import { Hono } from 'hono'

const guides = new Hono<{ Bindings: CloudflareBindings }>()

// POST /api/guides/:examId/process — PDF→Markdown変換
guides.post('/:examId/process', async (c) => {
	const examId = c.req.param('examId')
	const db = c.env.DB
	const bucket = c.env.BUCKET
	const ai = c.env.AI

	// 1. exams テーブルから guide_key を取得
	const exam = await db.prepare('SELECT * FROM exams WHERE id = ?')
		.bind(examId).first<{ id: string; guide_key: string; name: string }>()
	if (!exam) return c.json({ error: 'Exam not found' }, 404)

	// 2. R2 から PDF を取得
	const obj = await bucket.get(exam.guide_key)
	if (!obj) return c.json({ error: 'Guide PDF not found in R2' }, 404)

	await db.prepare("UPDATE exams SET status = 'analyzing' WHERE id = ?")
		.bind(examId).run()

	// 3. ガイドテキストを読み取り (PDF→テキスト変換はスクリプトで事前実行)
	const guideText = await obj.text()

	// テキストが長すぎる場合は切り詰め (Workers AI のコンテキスト制限)
	const maxChars = 24000
	const truncatedText = guideText.length > maxChars
		? guideText.slice(0, maxChars) + '\n\n[... テキストが長いため省略 ...]'
		: guideText

	// 4. Workers AI でテキスト → 構造化Markdown に変換
	const specResult = await ai.run(
		'@cf/meta/llama-3.3-70b-instruct-fp8-fast',
		{
			messages: [
				{
					role: 'system' as const,
					content: `あなたは試験分析の専門家です。試験ガイドのテキストから以下を抽出し、Markdown形式で出力してください。

## 試験概要
- 試験名、提供元、問題数、合格ライン、試験時間

## 出題形式
各形式を箇条書き (single_select, multi_select, fill_blank, matching, ordering, hotspot, domc のいずれかに分類)

## トピック構成
| トピック名 | 配点比率 | 主要キーワード |
形式: テーブル

## 学習リソース
公式ドキュメントや推奨教材のURLを列挙

元のテキストの情報を正確に反映してください。推測や追加情報を含めないでください。`,
				},
				{ role: 'user' as const, content: truncatedText },
			],
			max_tokens: 4096,
		},
	)

	const specMarkdown = (specResult as { response?: string }).response || ''

	// 5. R2 に spec を保存
	const specKey = `specs/${examId}/spec.md`
	await bucket.put(specKey, specMarkdown, {
		httpMetadata: { contentType: 'text/markdown' },
	})

	// 6. D1 を更新
	await db.prepare("UPDATE exams SET spec_key = ?, status = 'ready' WHERE id = ?")
		.bind(specKey, examId).run()

	// 7. トピック情報をパースして exam_topics に登録
	// テーブル行からトピック名を抽出 (配点比率があってもなくても対応)
	const topicRows: { name: string; weight: string }[] = []
	const tableRowRegex = /\|\s*([^|]+?)\s*\|\s*([^|]*?)\s*\|/g
	let tm: RegExpExecArray | null
	while ((tm = tableRowRegex.exec(specMarkdown)) !== null) {
		const name = tm[1].trim()
		if (name && !name.startsWith('---') && !name.startsWith('トピック') && name !== '---') {
			topicRows.push({ name, weight: tm[2].trim() })
		}
	}

	// 既存トピックの参照を解除してから再登録
	await db.prepare('UPDATE cards SET topic_id = NULL WHERE topic_id IN (SELECT id FROM exam_topics WHERE exam_id = ?)').bind(examId).run()
	await db.prepare('DELETE FROM exam_topics WHERE exam_id = ?').bind(examId).run()

	let position = 0
	const evenWeight = topicRows.length > 0 ? 1 / topicRows.length : 0
	for (const row of topicRows) {
		const weightNum = parseFloat(row.weight)
		const weight = isNaN(weightNum) ? evenWeight : weightNum / 100
		const topicId = `topic-${examId}-${position}`
		await db.prepare(
			'INSERT INTO exam_topics (id, exam_id, name, weight, position) VALUES (?, ?, ?, ?, ?)'
		).bind(topicId, examId, row.name, weight, position).run()
		position++
	}

	return c.json({
		examId,
		specKey,
		specLength: specMarkdown.length,
		topicsFound: position,
		status: 'ready',
	})
})

// POST /api/guides/:examId/generate — 問題自動生成
guides.post('/:examId/generate', async (c) => {
	const examId = c.req.param('examId')
	const body = await c.req.json<{ count?: number; topic_id?: string }>()
	const db = c.env.DB
	const bucket = c.env.BUCKET
	const ai = c.env.AI

	// 1. 試験情報を取得
	const exam = await db.prepare('SELECT * FROM exams WHERE id = ?')
		.bind(examId).first<{ id: string; name: string; spec_key: string | null; total_questions: number | null }>()
	if (!exam) return c.json({ error: 'Exam not found' }, 404)
	if (!exam.spec_key) return c.json({ error: 'Spec not processed yet. Call /process first.' }, 400)

	// 生成数: 指定 or 試験問題数の2倍
	const count = body.count ?? (exam.total_questions ? exam.total_questions * 2 : 20)

	// 2. spec を R2 から取得
	const specObj = await bucket.get(exam.spec_key)
	if (!specObj) return c.json({ error: 'Spec not found in R2' }, 404)
	const specText = await specObj.text()

	// 3. トピック情報を取得
	const topicQuery = body.topic_id
		? db.prepare('SELECT * FROM exam_topics WHERE exam_id = ? AND id = ?').bind(examId, body.topic_id)
		: db.prepare('SELECT * FROM exam_topics WHERE exam_id = ? ORDER BY position').bind(examId)
	const { results: topics } = await topicQuery.all<{ id: string; name: string; weight: number; position: number }>()

	// 4. デッキを取得 or 作成
	let deck = await db.prepare('SELECT * FROM decks WHERE exam_id = ?')
		.bind(examId).first<{ id: string }>()
	if (!deck) {
		const deckId = `deck-${examId}`
		await db.prepare('INSERT INTO decks (id, exam_id, name, description) VALUES (?, ?, ?, ?)')
			.bind(deckId, examId, exam.name, `${exam.name} 自動生成問題`).run()
		deck = { id: deckId }
	}

	// 5. バッチで問題を生成 (10問ずつ)
	const allCards: any[] = []
	const batchSize = 10
	const batches = Math.ceil(count / batchSize)

	for (let batch = 0; batch < batches; batch++) {
		const batchCount = Math.min(batchSize, count - batch * batchSize)

		// トピック配点比率に基づいて、このバッチで出題するトピックを選択
		const topicDistribution = topics.map(t => ({
			...t,
			questionsInBatch: Math.max(1, Math.round(batchCount * (t.weight || 1 / topics.length))),
		}))

		const topicList = topicDistribution
			.map(t => `- ${t.name} (${(t.weight * 100).toFixed(0)}%): ${t.questionsInBatch}問`)
			.join('\n')

		const result = await ai.run(
			'@cf/meta/llama-3.3-70b-instruct-fp8-fast',
			{
				messages: [
					{
						role: 'system',
						content: `あなたは資格試験の問題作成者です。以下の試験仕様に基づいて問題を生成してください。

## 試験仕様
${specText}

## ルール
- 事実に正確な問題を作成すること
- 各問題にJSON形式で出力すること
- 出力は JSON 配列のみ（前後に説明文を含めないこと）
- ${batchCount}問生成すること

## JSON形式
[
  {
    "type": "single_select",
    "topic": "トピック名",
    "question": "問題文 (Markdown可)",
    "explanation": "解説文 (Markdown可)",
    "options": [
      { "label": "A", "body": "選択肢1" },
      { "label": "B", "body": "選択肢2" },
      { "label": "C", "body": "選択肢3" },
      { "label": "D", "body": "選択肢4" }
    ],
    "correct_labels": ["A"]
  }
]

type は single_select (1つ正解) または multi_select (複数正解) を使い分けること。
correct_labels は正解の選択肢ラベルの配列。`,
					},
					{
						role: 'user',
						content: `以下のトピック配分で${batchCount}問生成してください:\n${topicList}`,
					},
				],
				max_tokens: 8192,
			},
		)

		const rawResponse = (result as any).response
		let questions: any[]

		if (Array.isArray(rawResponse)) {
			// AI が直接 JSON 配列を返した場合
			questions = rawResponse
		} else if (typeof rawResponse === 'string') {
			const cleaned = rawResponse.replace(/```json?\n?/g, '').replace(/```/g, '')
			const jsonMatch = cleaned.match(/\[[\s\S]*\]/)
			if (!jsonMatch) {
				console.error(`Batch ${batch}: Failed to parse JSON from AI response`)
				continue
			}
			try {
				questions = JSON.parse(jsonMatch[0])
			} catch (e) {
				console.error(`Batch ${batch}: JSON parse error:`, (e as Error).message)
				continue
			}
		} else {
			console.error(`Batch ${batch}: Unexpected response type:`, typeof rawResponse)
			continue
		}

		// 6. D1 に保存
		for (const q of questions) {
			const cardId = crypto.randomUUID()
			const topicMatch = topics.find(t => t.name.includes(q.topic) || q.topic?.includes(t.name))
			const topicId = topicMatch?.id || null
			const type = q.type || 'single_select'

			await db.prepare(
				'INSERT INTO cards (id, deck_id, type, topic_id, question, explanation) VALUES (?, ?, ?, ?, ?, ?)'
			).bind(cardId, deck.id, type, topicId, q.question, q.explanation || null).run()

			const positionToOptionId = new Map<number, string>()
			for (let i = 0; i < (q.options || []).length; i++) {
				const opt = q.options[i]
				const optId = crypto.randomUUID()
				await db.prepare(
					'INSERT INTO card_options (id, card_id, position, label, body) VALUES (?, ?, ?, ?, ?)'
				).bind(optId, cardId, i, opt.label || String.fromCharCode(65 + i), opt.body).run()
				positionToOptionId.set(i, optId)
			}

			const correctLabels = q.correct_labels || []
			for (const label of correctLabels) {
				const optIdx = (q.options || []).findIndex((o: any) => o.label === label)
				if (optIdx >= 0) {
					const ansId = crypto.randomUUID()
					const optionId = positionToOptionId.get(optIdx) || null
					await db.prepare(
						'INSERT INTO card_answers (id, card_id, option_id) VALUES (?, ?, ?)'
					).bind(ansId, cardId, optionId).run()
				}
			}

			allCards.push({ id: cardId, type, question: q.question.slice(0, 80) })
		}
	}

	return c.json({
		examId,
		deckId: deck.id,
		generated: allCards.length,
		requested: count,
		cards: allCards,
	})
})

// GET /api/guides/:examId — ガイド spec を取得
guides.get('/:examId', async (c) => {
	const examId = c.req.param('examId')
	const db = c.env.DB
	const bucket = c.env.BUCKET

	const exam = await db.prepare('SELECT * FROM exams WHERE id = ?')
		.bind(examId).first()
	if (!exam) return c.json({ error: 'Exam not found' }, 404)

	const specKey = (exam as any).spec_key
	if (!specKey) return c.json({ error: 'Spec not processed yet' }, 404)

	const obj = await bucket.get(specKey)
	if (!obj) return c.json({ error: 'Spec not found in R2' }, 404)

	const specText = await obj.text()
	return c.json({ exam, spec: specText })
})

export default guides

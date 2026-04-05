import { Hono } from 'hono'

const batch = new Hono<{ Bindings: CloudflareBindings }>()

const FREE_MODEL = '@cf/meta/llama-3.1-8b-instruct'

// POST /api/batch/fact-check — 日次ファクトチェック (20問)
batch.post('/fact-check', async (c) => {
	const db = c.env.DB
	const ai = c.env.AI
	const limit = 20

	// 直近7日間にチェック済みのcard_idを除外して、ランダムに20問ピックアップ
	const { results: cards } = await db.prepare(`
		SELECT c.id, c.question, c.explanation, c.type, c.deck_id,
			d.name as deck_name
		FROM cards c
		JOIN decks d ON c.deck_id = d.id
		WHERE c.id NOT IN (
			SELECT card_id FROM fact_checks
			WHERE checked_at >= datetime('now', '-7 days')
		)
		ORDER BY RANDOM()
		LIMIT ?
	`).bind(limit).all()

	if (cards.length === 0) {
		return c.json({ message: '直近7日間で全カードがチェック済みです', checked: 0 })
	}

	const results: any[] = []

	for (const card of cards as any[]) {
		// 選択肢と正解を取得
		const { results: options } = await db.prepare(
			'SELECT label, body FROM card_options WHERE card_id = ? ORDER BY position'
		).bind(card.id).all()

		const { results: answers } = await db.prepare(
			'SELECT ca.option_id, co.label, co.body FROM card_answers ca LEFT JOIN card_options co ON ca.option_id = co.id WHERE ca.card_id = ?'
		).bind(card.id).all()

		const optionsText = (options as any[])
			.map(o => `${o.label || '-'}. ${o.body}`)
			.join('\n')

		const answersText = (answers as any[])
			.map(a => a.label ? `${a.label}. ${a.body}` : '(テキスト回答)')
			.join(', ')

		// Workers AI でファクトチェック (無料モデル)
		const checkResult = await ai.run(FREE_MODEL, {
			messages: [
				{
					role: 'system' as const,
					content: `あなたは資格試験問題の品質審査官です。以下の問題と回答の正確性を評価してください。

必ず以下のJSON形式のみで回答してください。JSON以外のテキストは含めないでください。

{
  "verdict": "correct" | "incorrect" | "needs_revision",
  "confidence": 0.0-1.0,
  "reason": "判定理由を具体的に説明",
  "suggestion": {
    "question": "修正後の問題文 (変更不要ならnull)",
    "explanation": "修正後の解説 (変更不要ならnull)",
    "answer": "修正後の正解 (変更不要ならnull)"
  }
}`,
				},
				{
					role: 'user' as const,
					content: `## 問題
${card.question}

## 選択肢
${optionsText || '(選択肢なし)'}

## 正解
${answersText || '(正解データなし)'}

## 解説
${card.explanation || '(解説なし)'}`,
				},
			],
			max_tokens: 1024,
		})

		const responseText = (checkResult as any).response
		let verdict = 'correct'
		let confidence = 0.5
		let reason = ''
		let suggestion: any = null
		let actionTaken = 'none'

		try {
			const parsed = typeof responseText === 'string'
				? JSON.parse(responseText.replace(/```json?\n?/g, '').replace(/```/g, ''))
				: responseText

			verdict = parsed.verdict || 'correct'
			confidence = parsed.confidence || 0.5
			reason = parsed.reason || ''
			suggestion = parsed.suggestion || null

			// 高確信の incorrect は自動修正
			if (verdict === 'incorrect' && confidence >= 0.85 && suggestion) {
				if (suggestion.question) {
					const oldQuestion = card.question
					await db.prepare('UPDATE cards SET question = ? WHERE id = ?')
						.bind(suggestion.question, card.id).run()
					actionTaken = 'updated'
				}
				if (suggestion.explanation) {
					await db.prepare('UPDATE cards SET explanation = ? WHERE id = ?')
						.bind(suggestion.explanation, card.id).run()
					actionTaken = 'updated'
				}
			} else if (verdict !== 'correct') {
				actionTaken = 'flagged'
			}
		} catch {
			reason = `AI応答のパースに失敗: ${typeof responseText === 'string' ? responseText.slice(0, 200) : 'non-string response'}`
			verdict = 'needs_revision'
			confidence = 0
		}

		// fact_checks に記録
		const checkId = crypto.randomUUID()
		await db.prepare(`
			INSERT INTO fact_checks (id, card_id, verdict, confidence, reason, suggestion, action_taken, old_question, old_answer, model_used)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		`).bind(
			checkId,
			card.id,
			verdict,
			confidence,
			reason,
			suggestion ? JSON.stringify(suggestion) : null,
			actionTaken,
			actionTaken === 'updated' ? card.question : null,
			actionTaken === 'updated' ? answersText : null,
			FREE_MODEL,
		).run()

		results.push({
			cardId: card.id,
			verdict,
			confidence,
			actionTaken,
			reason: reason.slice(0, 100),
		})
	}

	const summary = {
		checked: results.length,
		correct: results.filter(r => r.verdict === 'correct').length,
		incorrect: results.filter(r => r.verdict === 'incorrect').length,
		needsRevision: results.filter(r => r.verdict === 'needs_revision').length,
		updated: results.filter(r => r.actionTaken === 'updated').length,
		flagged: results.filter(r => r.actionTaken === 'flagged').length,
	}

	return c.json({ summary, results })
})

// GET /api/batch/fact-check/history — ファクトチェック履歴
batch.get('/fact-check/history', async (c) => {
	const db = c.env.DB
	const limit = parseInt(c.req.query('limit') || '50')
	const offset = parseInt(c.req.query('offset') || '0')

	const { results } = await db.prepare(`
		SELECT fc.*, c.question, c.type, d.name as deck_name
		FROM fact_checks fc
		JOIN cards c ON fc.card_id = c.id
		JOIN decks d ON c.deck_id = d.id
		ORDER BY fc.checked_at DESC
		LIMIT ? OFFSET ?
	`).bind(limit, offset).all()

	const countRow = await db.prepare('SELECT COUNT(*) as cnt FROM fact_checks')
		.first<{ cnt: number }>()

	return c.json({ total: countRow?.cnt ?? 0, results })
})

export default batch

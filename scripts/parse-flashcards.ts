/**
 * dbt フラッシュカード Markdown → D1 INSERT SQL パーサー
 *
 * 出題形式の判定ロジック:
 * - 選択肢に「正しく対応させよ」「マッチング」→ matching
 * - 「正しい順序に並べよ」→ ordering
 * - 選択肢がなく穴埋め({{blank}})やテキスト回答 → fill_blank
 * - 正解が複数(A, B, C...) → multi_select
 * - 正解が1つ → single_select
 * - 「ホットスポット」→ hotspot (今回はなさそう)
 * - 「逐次正誤判定」「DOMC」→ domc
 */

import { readFileSync, writeFileSync } from 'node:fs'

const INPUT = process.argv[2] || '/Users/takumi.abe/garden/certifications/dbt Analytics Engineering 認定試験-フラッシュカード.md'
const OUTPUT = process.argv[3] || '/Users/takumi.abe/Developer/github.com/ta93abe/flashcard/seeds/dbt-analytics-engineer.sql'

const text = readFileSync(INPUT, 'utf-8')

const EXAM_ID = 'dbt-analytics-engineer'
const DECK_ID = 'deck-dbt-ae'

// --- Topic parsing ---
interface Topic {
	id: string
	name: string
	position: number
	questionCount: number
}

const topicRegex = /^## Topic (\d+): (.+?)（(.+?)）（(\d+)問）$/gm
const topics: Topic[] = []
let match: RegExpExecArray | null
while ((match = topicRegex.exec(text)) !== null) {
	const num = parseInt(match[1])
	topics.push({
		id: `topic-dbt-ae-${num}`,
		name: `${match[2]}（${match[3]}）`,
		position: num - 1,
		questionCount: parseInt(match[4]),
	})
}

const totalQuestions = topics.reduce((s, t) => s + t.questionCount, 0)

// --- Question parsing ---
interface ParsedCard {
	id: string
	topicId: string
	type: string
	question: string
	explanation: string
	sourceUrl: string | null
	options: { position: number; label: string | null; body: string; groupName: string | null }[]
	answers: { optionPosition?: number; textValue?: string; sortOrder?: number }[]
}

function escapeSQL(s: string): string {
	return s.replace(/'/g, "''")
}

function detectType(questionBlock: string, answerBlock: string): string {
	if (/正しく対応させよ|マッチング|対応付け/.test(questionBlock)) return 'matching'
	if (/正しい順序に並べよ|並べ替え/.test(questionBlock)) return 'ordering'
	if (/逐次正誤判定|DOMC/.test(questionBlock)) return 'domc'
	if (/ホットスポット/.test(questionBlock)) return 'hotspot'

	// Check if answer has multiple correct
	const ansMatch = answerBlock.match(/\*\*正解:\s*(.+?)\*\*/)
	if (ansMatch) {
		const ans = ansMatch[1]
		// Multiple answers like "A, B, C, D" or "A, D"
		const letters = ans.split(/[,、]\s*/).filter(s => /^[A-Z]$/.test(s.trim()))
		if (letters.length > 1) return 'multi_select'
		if (letters.length === 1) return 'single_select'
	}

	// If has choices (- A. / - B.) but single answer
	if (/^- [A-Z]\.\s/m.test(questionBlock)) return 'single_select'

	// Fill blank
	if (/\{\{blank\}\}|穴埋め/.test(questionBlock)) return 'fill_blank'

	// Free text answer
	return 'single_select'
}

function parseMatchingQuestion(questionBlock: string, answerBlock: string): {
	options: ParsedCard['options']
	answers: ParsedCard['answers']
} {
	// Parse table from question
	const tableRegex = /\|\s*(\d+)\.\s*`?([^|`]+?)`?\s*\|\s*([a-z])\.\s*(.+?)\s*\|/g
	const leftItems: { pos: number; body: string }[] = []
	const rightItems: { label: string; body: string }[] = []

	let m: RegExpExecArray | null
	while ((m = tableRegex.exec(questionBlock)) !== null) {
		leftItems.push({ pos: parseInt(m[1]) - 1, body: m[2].trim() })
		rightItems.push({ label: m[3], body: m[4].trim() })
	}

	if (leftItems.length === 0) {
		// Try alternative format: | 左列 | 右列 | followed by | 1. xxx | a. yyy |
		const lines = questionBlock.split('\n')
		for (const line of lines) {
			const altMatch = line.match(/\|\s*(\d+)\.\s*(.+?)\s*\|\s*([a-z])\.\s*(.+?)\s*\|/)
			if (altMatch) {
				leftItems.push({ pos: parseInt(altMatch[1]) - 1, body: altMatch[2].trim().replace(/^`|`$/g, '') })
				rightItems.push({ label: altMatch[3], body: altMatch[4].trim() })
			}
		}
	}

	const options: ParsedCard['options'] = []
	let pos = 0

	for (const item of leftItems) {
		options.push({ position: pos++, label: `${item.pos + 1}`, body: item.body, groupName: 'left' })
	}
	for (const item of rightItems) {
		options.push({ position: pos++, label: item.label, body: item.body, groupName: 'right' })
	}

	// Parse answer mapping like "1-b, 2-c, 3-a" or "**1-d, 2-c, 3-b, 4-a**"
	const ansMapping = answerBlock.match(/\*\*(\d+-[a-z](?:,\s*\d+-[a-z])*)\*\*/)
	const answers: ParsedCard['answers'] = []
	if (ansMapping) {
		const pairs = ansMapping[1].split(/,\s*/)
		for (const pair of pairs) {
			const [leftNum, rightLabel] = pair.split('-')
			const leftPos = parseInt(leftNum) - 1
			const rightIdx = rightItems.findIndex(r => r.label === rightLabel)
			if (rightIdx >= 0) {
				answers.push({ optionPosition: leftPos, sortOrder: rightIdx })
			}
		}
	}

	return { options, answers }
}

function parseOrderingQuestion(questionBlock: string, answerBlock: string): {
	options: ParsedCard['options']
	answers: ParsedCard['answers']
} {
	// Parse steps from question - format like: - (a) text
	const stepRegex = /- \(([a-z])\)\s*(.+)/g
	const steps: { label: string; body: string }[] = []
	let m: RegExpExecArray | null
	while ((m = stepRegex.exec(questionBlock)) !== null) {
		steps.push({ label: m[1], body: m[2].trim() })
	}

	const options = steps.map((s, i) => ({
		position: i,
		label: s.label,
		body: s.body,
		groupName: null,
	}))

	// Parse correct order from answer - format like: "c → b → a" or "**正解: c → b → a**"
	const orderMatch = answerBlock.match(/正解:\s*([a-z](?:\s*→\s*[a-z])+)/)
	const answers: ParsedCard['answers'] = []
	if (orderMatch) {
		const order = orderMatch[1].split(/\s*→\s*/)
		for (let sortOrder = 0; sortOrder < order.length; sortOrder++) {
			const label = order[sortOrder].trim()
			const optIdx = steps.findIndex(s => s.label === label)
			if (optIdx >= 0) {
				answers.push({ optionPosition: optIdx, sortOrder })
			}
		}
	}

	return { options, answers }
}

function parseSelectQuestion(questionBlock: string, answerBlock: string, type: string): {
	options: ParsedCard['options']
	answers: ParsedCard['answers']
} {
	// Parse choices like "- A. text"
	const choiceRegex = /^- ([A-Z])\.\s*(.+)/gm
	const choices: { label: string; body: string }[] = []
	let m: RegExpExecArray | null
	while ((m = choiceRegex.exec(questionBlock)) !== null) {
		choices.push({ label: m[1], body: m[2].trim() })
	}

	const options = choices.map((c, i) => ({
		position: i,
		label: c.label,
		body: c.body,
		groupName: null,
	}))

	// Parse correct answers
	const ansMatch = answerBlock.match(/\*\*正解:\s*(.+?)\*\*/)
	const answers: ParsedCard['answers'] = []
	if (ansMatch) {
		const letters = ansMatch[1].split(/[,、]\s*/).map(s => s.trim()).filter(s => /^[A-Z]$/.test(s))
		for (const letter of letters) {
			const idx = choices.findIndex(c => c.label === letter)
			if (idx >= 0) {
				answers.push({ optionPosition: idx })
			}
		}
	}

	return { options, answers }
}

// Split file into topic sections
const topicSections: { topicId: string; content: string }[] = []
const topicHeaderRegex = /^## Topic (\d+):/gm
const topicPositions: { index: number; topicNum: number }[] = []
let tm: RegExpExecArray | null
while ((tm = topicHeaderRegex.exec(text)) !== null) {
	topicPositions.push({ index: tm.index, topicNum: parseInt(tm[1]) })
}

for (let i = 0; i < topicPositions.length; i++) {
	const start = topicPositions[i].index
	const end = i + 1 < topicPositions.length ? topicPositions[i + 1].index : text.length
	const topicNum = topicPositions[i].topicNum
	topicSections.push({
		topicId: `topic-dbt-ae-${topicNum}`,
		content: text.slice(start, end),
	})
}

// Parse questions from each topic section
const cards: ParsedCard[] = []
let globalQ = 0

for (const section of topicSections) {
	// Split by question markers: Q{n}.
	const qRegex = /^Q(\d+)\.\s*/gm
	const qPositions: { index: number; num: number }[] = []
	let qm: RegExpExecArray | null
	while ((qm = qRegex.exec(section.content)) !== null) {
		qPositions.push({ index: qm.index, num: parseInt(qm[1]) })
	}

	for (let i = 0; i < qPositions.length; i++) {
		const start = qPositions[i].index
		const end = i + 1 < qPositions.length ? qPositions[i + 1].index : section.content.length
		const block = section.content.slice(start, end).trim()

		// Split by the ? separator (line with just ?)
		const separatorIdx = block.indexOf('\n?\n')
		if (separatorIdx === -1) continue

		const questionBlock = block.slice(0, separatorIdx).trim()
		const answerBlock = block.slice(separatorIdx + 3).trim()

		// Remove the Q{n}. prefix from question
		const questionText = questionBlock.replace(/^Q\d+\.\s*/, '')

		// Detect type
		const type = detectType(questionBlock, answerBlock)

		// Extract source URL
		const urlMatch = answerBlock.match(/📖\s*\[.+?\]\((.+?)\)/)
		const sourceUrl = urlMatch ? urlMatch[1] : null

		// Clean explanation (remove SR tag and URL)
		let explanation = answerBlock
			.replace(/<!--SR:.+?-->/g, '')
			.replace(/📖\s*\[.+?\]\(.+?\)/g, '')
			.trim()

		// Parse options and answers based on type
		let options: ParsedCard['options'] = []
		let answers: ParsedCard['answers'] = []

		if (type === 'matching') {
			const result = parseMatchingQuestion(questionBlock, answerBlock)
			options = result.options
			answers = result.answers
		} else if (type === 'ordering') {
			const result = parseOrderingQuestion(questionBlock, answerBlock)
			options = result.options
			answers = result.answers
		} else if (type === 'single_select' || type === 'multi_select' || type === 'domc') {
			const result = parseSelectQuestion(questionBlock, answerBlock, type)
			options = result.options
			answers = result.answers
		}

		globalQ++
		cards.push({
			id: `card-dbt-ae-${String(globalQ).padStart(3, '0')}`,
			topicId: section.topicId,
			type,
			question: questionText,
			explanation,
			sourceUrl,
			options,
			answers,
		})
	}
}

// --- Generate SQL ---
const sql: string[] = []

sql.push('-- Auto-generated from dbt Analytics Engineering フラッシュカード')
sql.push(`-- Total: ${cards.length} cards across ${topics.length} topics`)
sql.push('')

// Exam
sql.push(`INSERT OR IGNORE INTO exams (id, name, provider, guide_key, total_questions, status) VALUES ('${EXAM_ID}', 'dbt Analytics Engineering Certification', 'dbt Labs', 'guides/${EXAM_ID}/guide.md', ${totalQuestions}, 'ready');`)
sql.push('')

// Topics
for (const t of topics) {
	const weight = (t.questionCount / totalQuestions).toFixed(4)
	sql.push(`INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('${t.id}', '${EXAM_ID}', '${escapeSQL(t.name)}', ${weight}, ${t.position});`)
}
sql.push('')

// Deck
sql.push(`INSERT OR IGNORE INTO decks (id, exam_id, name, description) VALUES ('${DECK_ID}', '${EXAM_ID}', 'dbt Analytics Engineering', 'dbt Analytics Engineering 認定試験 全${totalQuestions}問');`)
sql.push('')

// Cards, options, answers
for (const card of cards) {
	sql.push(`INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('${card.id}', '${DECK_ID}', '${card.type}', '${card.topicId}', '${escapeSQL(card.question)}', '${escapeSQL(card.explanation)}', ${card.sourceUrl ? `'${escapeSQL(card.sourceUrl)}'` : 'NULL'});`)

	for (const opt of card.options) {
		const optId = `${card.id}-opt-${opt.position}`
		sql.push(`INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('${optId}', '${card.id}', ${opt.position}, ${opt.label ? `'${escapeSQL(opt.label)}'` : 'NULL'}, '${escapeSQL(opt.body)}', ${opt.groupName ? `'${opt.groupName}'` : 'NULL'});`)
	}

	for (let i = 0; i < card.answers.length; i++) {
		const ans = card.answers[i]
		const ansId = `${card.id}-ans-${i}`
		const optionId = ans.optionPosition !== undefined ? `'${card.id}-opt-${ans.optionPosition}'` : 'NULL'
		const textValue = ans.textValue ? `'${escapeSQL(ans.textValue)}'` : 'NULL'
		const sortOrder = ans.sortOrder !== undefined ? ans.sortOrder : 'NULL'
		sql.push(`INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('${ansId}', '${card.id}', ${optionId}, ${textValue}, ${sortOrder});`)
	}
	sql.push('')
}

writeFileSync(OUTPUT, sql.join('\n'), 'utf-8')

// Summary
const typeCounts: Record<string, number> = {}
for (const c of cards) {
	typeCounts[c.type] = (typeCounts[c.type] || 0) + 1
}
console.log(`Parsed ${cards.length} cards from ${topics.length} topics`)
console.log('Types:', JSON.stringify(typeCounts))
console.log(`Output: ${OUTPUT}`)

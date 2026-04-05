import { Hono } from 'hono'

const batch = new Hono<{ Bindings: CloudflareBindings }>()

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

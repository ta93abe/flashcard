import { Hono } from 'hono'
import { sm2 } from '../lib/sm2'

const reviews = new Hono<{ Bindings: CloudflareBindings }>()

reviews.post('/answer', async (c) => {
	const { card_id, quality } = await c.req.json<{ card_id: string; quality: number }>()

	const db = c.env.DB

	const existing = await db
		.prepare('SELECT * FROM reviews WHERE card_id = ?')
		.bind(card_id)
		.first<{ id: string; easiness: number; interval: number; repetitions: number }>()

	const input = {
		quality,
		easiness: existing?.easiness ?? 2.5,
		interval: existing?.interval ?? 0,
		repetitions: existing?.repetitions ?? 0,
	}

	const result = sm2(input)
	const id = existing?.id ?? crypto.randomUUID()

	if (existing) {
		await db
			.prepare(
				"UPDATE reviews SET easiness = ?, interval = ?, repetitions = ?, next_review = ?, last_quality = ?, reviewed_at = datetime('now') WHERE id = ?"
			)
			.bind(result.easiness, result.interval, result.repetitions, result.nextReview, quality, id)
			.run()
	} else {
		await db
			.prepare(
				'INSERT INTO reviews (id, card_id, easiness, interval, repetitions, next_review, last_quality) VALUES (?, ?, ?, ?, ?, ?, ?)'
			)
			.bind(id, card_id, result.easiness, result.interval, result.repetitions, result.nextReview, quality)
			.run()
	}

	return c.json({
		easiness: result.easiness,
		interval: result.interval,
		repetitions: result.repetitions,
		next_review: result.nextReview,
	})
})

reviews.get('/next', async (c) => {
	const deck_id = c.req.query('deck_id')
	if (!deck_id) {
		return c.json({ error: 'deck_id is required' }, 400)
	}

	const db = c.env.DB
	const today = new Date().toISOString().split('T')[0]

	const row = await db
		.prepare(
			'SELECT c.id as card_id, c.question, c.type, c.explanation, r.next_review FROM reviews r JOIN cards c ON r.card_id = c.id WHERE c.deck_id = ? AND r.next_review <= ? ORDER BY r.next_review ASC LIMIT 1'
		)
		.bind(deck_id, today)
		.first()

	if (!row) {
		return c.body(null, 204)
	}

	return c.json(row)
})

export default reviews

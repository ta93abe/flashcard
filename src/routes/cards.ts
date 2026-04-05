import { Hono } from 'hono'

const cards = new Hono<{ Bindings: CloudflareBindings }>()

async function fetchCardDetail(db: D1Database, cardId: string) {
	const card = await db
		.prepare('SELECT * FROM cards WHERE id = ?')
		.bind(cardId)
		.first()

	if (!card) return null

	const { results: options } = await db
		.prepare('SELECT * FROM card_options WHERE card_id = ? ORDER BY position')
		.bind(cardId)
		.all()

	const { results: answers } = await db
		.prepare('SELECT * FROM card_answers WHERE card_id = ?')
		.bind(cardId)
		.all()

	return { card, options, answers }
}

// GET /decks/:deckId/cards
cards.get('/decks/:deckId/cards', async (c) => {
	const deckId = c.req.param('deckId')
	const { results } = await c.env.DB
		.prepare('SELECT * FROM cards WHERE deck_id = ?')
		.bind(deckId)
		.all()
	return c.json({ cards: results })
})

// POST /decks/:deckId/cards
cards.post('/decks/:deckId/cards', async (c) => {
	const deckId = c.req.param('deckId')
	const body = await c.req.json()
	const db = c.env.DB

	const cardId = crypto.randomUUID()
	const { question, type, explanation } = body

	await db
		.prepare(
			'INSERT INTO cards (id, deck_id, type, question, explanation) VALUES (?, ?, ?, ?, ?)',
		)
		.bind(cardId, deckId, type ?? 'single_select', question, explanation ?? null)
		.run()

	const positionToOptionId = new Map<number, string>()
	for (const opt of body.options ?? []) {
		const optionId = crypto.randomUUID()
		await db
			.prepare(
				'INSERT INTO card_options (id, card_id, position, label, body) VALUES (?, ?, ?, ?, ?)',
			)
			.bind(optionId, cardId, opt.position, opt.label ?? null, opt.body)
			.run()
		positionToOptionId.set(opt.position, optionId)
	}

	for (const ans of body.answers ?? []) {
		const answerId = crypto.randomUUID()
		const optionId = ans.option_position !== undefined
			? positionToOptionId.get(ans.option_position) ?? null
			: null
		await db
			.prepare(
				'INSERT INTO card_answers (id, card_id, option_id) VALUES (?, ?, ?)',
			)
			.bind(answerId, cardId, optionId)
			.run()
	}

	const detail = await fetchCardDetail(db, cardId)
	return c.json(detail, 201)
})

// GET /cards/:id
cards.get('/cards/:id', async (c) => {
	const id = c.req.param('id')
	const detail = await fetchCardDetail(c.env.DB, id)

	if (!detail) {
		return c.json({ error: 'Card not found' }, 404)
	}

	return c.json(detail)
})

export default cards

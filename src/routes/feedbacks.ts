import { Hono } from 'hono'

const feedbacks = new Hono<{ Bindings: CloudflareBindings }>()

const VALID_TYPES = ['incorrect_answer', 'ambiguous', 'outdated', 'other'] as const

feedbacks.post('/', async (c) => {
	const { card_id, type, comment } = await c.req.json()

	if (!card_id) {
		return c.json({ error: 'card_id is required' }, 400)
	}
	if (!VALID_TYPES.includes(type)) {
		return c.json({ error: `type must be one of: ${VALID_TYPES.join(', ')}` }, 400)
	}

	const id = crypto.randomUUID()

	await c.env.DB.prepare(
		`INSERT INTO feedbacks (id, card_id, type, comment, status) VALUES (?, ?, ?, ?, 'pending')`
	)
		.bind(id, card_id, type, comment ?? null)
		.run()

	const row = await c.env.DB.prepare('SELECT * FROM feedbacks WHERE id = ?')
		.bind(id)
		.first()

	return c.json(row, 201)
})

feedbacks.get('/', async (c) => {
	const status = c.req.query('status')
	if (status) {
		const { results } = await c.env.DB.prepare('SELECT * FROM feedbacks WHERE status = ? ORDER BY created_at DESC')
			.bind(status)
			.all()
		return c.json(results)
	}
	const { results } = await c.env.DB.prepare('SELECT * FROM feedbacks ORDER BY created_at DESC').all()
	return c.json(results)
})

feedbacks.get('/:id', async (c) => {
	const id = c.req.param('id')
	const row = await c.env.DB.prepare('SELECT * FROM feedbacks WHERE id = ?')
		.bind(id)
		.first()
	if (!row) {
		return c.json({ error: 'Feedback not found' }, 404)
	}
	return c.json(row)
})

feedbacks.patch('/:id/decide', async (c) => {
	const id = c.req.param('id')
	const { decision, note } = await c.req.json()

	const existing = await c.env.DB.prepare('SELECT * FROM feedbacks WHERE id = ?')
		.bind(id)
		.first()
	if (!existing) {
		return c.json({ error: 'Feedback not found' }, 404)
	}

	const status = decision === 'approve' ? 'fixed' : 'dismissed'
	const resolvedAt = new Date().toISOString()

	await c.env.DB.prepare(
		`UPDATE feedbacks SET status = ?, human_decision = ?, human_note = ?, resolved_at = ? WHERE id = ?`
	)
		.bind(status, decision, note ?? null, resolvedAt, id)
		.run()

	const row = await c.env.DB.prepare('SELECT * FROM feedbacks WHERE id = ?')
		.bind(id)
		.first()

	return c.json(row)
})

export default feedbacks

import { Hono } from 'hono'

const decks = new Hono<{ Bindings: CloudflareBindings }>()

decks.get('/', async (c) => {
	const { results } = await c.env.DB.prepare('SELECT * FROM decks').all()
	return c.json({ decks: results })
})

decks.post('/', async (c) => {
	const body = await c.req.json<{ name?: string; description?: string; exam_id?: string }>()

	if (!body.name) {
		return c.json({ error: 'name is required' }, 400)
	}

	const id = crypto.randomUUID()
	await c.env.DB.prepare(
		'INSERT INTO decks (id, name, description, exam_id) VALUES (?, ?, ?, ?)'
	)
		.bind(id, body.name, body.description ?? null, body.exam_id ?? null)
		.run()

	const deck = await c.env.DB.prepare('SELECT * FROM decks WHERE id = ?').bind(id).first()
	return c.json({ deck }, 201)
})

decks.get('/:id', async (c) => {
	const id = c.req.param('id')
	const deck = await c.env.DB.prepare('SELECT * FROM decks WHERE id = ?').bind(id).first()

	if (!deck) {
		return c.json({ error: 'deck not found' }, 404)
	}

	return c.json({ deck })
})

export default decks

import { Hono } from 'hono'

const guides = new Hono<{ Bindings: CloudflareBindings }>()

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

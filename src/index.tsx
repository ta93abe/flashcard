import { Hono } from 'hono'
import decks from './routes/decks'
import cards from './routes/cards'
import reviews from './routes/reviews'
import feedbacks from './routes/feedbacks'
import { HomePage } from './pages/home'
import { ReviewPage, ReviewEmptyPage } from './pages/review'

const app = new Hono<{ Bindings: CloudflareBindings }>()

// --- Pages ---

app.get('/', async (c) => {
	const { results: deckRows } = await c.env.DB.prepare('SELECT * FROM decks').all()
	const today = new Date().toISOString().split('T')[0]

	const decksWithStats = await Promise.all(
		(deckRows as any[]).map(async (deck) => {
			const countRow = await c.env.DB.prepare(
				'SELECT COUNT(*) as cnt FROM cards WHERE deck_id = ?'
			).bind(deck.id).first<{ cnt: number }>()

			const dueRow = await c.env.DB.prepare(
				'SELECT COUNT(*) as cnt FROM reviews r JOIN cards c ON r.card_id = c.id WHERE c.deck_id = ? AND r.next_review <= ?'
			).bind(deck.id, today).first<{ cnt: number }>()

			return {
				...deck,
				cardCount: countRow?.cnt ?? 0,
				dueCount: dueRow?.cnt ?? 0,
			}
		})
	)

	return c.html(<HomePage decks={decksWithStats} />)
})

app.get('/review/:deckId', async (c) => {
	const deckId = c.req.param('deckId')
	const mode = c.req.query('mode')

	const deck = await c.env.DB.prepare('SELECT * FROM decks WHERE id = ?')
		.bind(deckId).first<{ id: string; name: string }>()
	if (!deck) return c.redirect('/')

	const today = new Date().toISOString().split('T')[0]
	const totalRow = await c.env.DB.prepare(
		'SELECT COUNT(*) as cnt FROM cards WHERE deck_id = ?'
	).bind(deckId).first<{ cnt: number }>()
	const reviewedRow = await c.env.DB.prepare(
		'SELECT COUNT(*) as cnt FROM reviews r JOIN cards c ON r.card_id = c.id WHERE c.deck_id = ?'
	).bind(deckId).first<{ cnt: number }>()

	let card: any = null

	if (mode !== 'new') {
		// Due card first
		card = await c.env.DB.prepare(
			'SELECT c.* FROM reviews r JOIN cards c ON r.card_id = c.id WHERE c.deck_id = ? AND r.next_review <= ? ORDER BY r.next_review ASC LIMIT 1'
		).bind(deckId, today).first()
	}

	if (!card) {
		// New card (not yet reviewed)
		card = await c.env.DB.prepare(
			'SELECT c.* FROM cards c WHERE c.deck_id = ? AND c.id NOT IN (SELECT card_id FROM reviews) ORDER BY c.id LIMIT 1'
		).bind(deckId).first()
	}

	if (!card) {
		return c.html(<ReviewEmptyPage deckId={deckId} deckName={deck.name} />)
	}

	const { results: options } = await c.env.DB.prepare(
		'SELECT * FROM card_options WHERE card_id = ? ORDER BY group_name, position'
	).bind(card.id).all()

	const { results: answers } = await c.env.DB.prepare(
		'SELECT * FROM card_answers WHERE card_id = ?'
	).bind(card.id).all()

	let topic: { name: string } | null = null
	if (card.topic_id) {
		topic = await c.env.DB.prepare(
			'SELECT name FROM exam_topics WHERE id = ?'
		).bind(card.topic_id).first()
	}

	return c.html(
		<ReviewPage
			deckId={deckId}
			deckName={deck.name}
			card={card}
			options={options as any[]}
			answers={answers as any[]}
			topic={topic}
			progress={{ current: reviewedRow?.cnt ?? 0, total: totalRow?.cnt ?? 0 }}
		/>
	)
})

// --- API ---

app.route('/api/decks', decks)
app.route('/api', cards)
app.route('/api/review', reviews)
app.route('/api/feedback', feedbacks)

export default app

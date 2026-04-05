import { Hono } from 'hono'
import decks from './routes/decks'
import cards from './routes/cards'
import reviews from './routes/reviews'
import feedbacks from './routes/feedbacks'

const app = new Hono<{ Bindings: CloudflareBindings }>()

app.get('/', (c) => {
	return c.text('Hello Hono!')
})

app.route('/api/decks', decks)
app.route('/api', cards)
app.route('/api/review', reviews)
app.route('/api/feedback', feedbacks)

export default app

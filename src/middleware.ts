import { defineMiddleware } from 'astro:middleware'
import { env } from 'cloudflare:workers'
import { Hono } from 'hono'
import decks from '@/routes/decks'
import cards from '@/routes/cards'
import reviews from '@/routes/reviews'
import feedbacks from '@/routes/feedbacks'
import guides from '@/routes/guides'

const api = new Hono<{ Bindings: CloudflareBindings }>()
api.route('/api/decks', decks)
api.route('/api', cards)
api.route('/api/review', reviews)
api.route('/api/feedback', feedbacks)
api.route('/api/guides', guides)

export const onRequest = defineMiddleware(async (context, next) => {
	const url = new URL(context.request.url)

	if (url.pathname.startsWith('/api/')) {
		return api.fetch(context.request, env as unknown as CloudflareBindings)
	}

	return next()
})

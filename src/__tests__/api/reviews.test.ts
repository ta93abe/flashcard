import { describe, it, expect, beforeEach } from 'vitest'
import { env, exports } from 'cloudflare:workers'

const app = exports.default

async function setupDB() {
	await env.DB.exec("CREATE TABLE IF NOT EXISTS decks (id TEXT PRIMARY KEY, exam_id TEXT, name TEXT NOT NULL, description TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS cards (id TEXT PRIMARY KEY, deck_id TEXT NOT NULL REFERENCES decks(id), type TEXT NOT NULL DEFAULT 'single_select', question TEXT NOT NULL, explanation TEXT, version INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS reviews (id TEXT PRIMARY KEY, card_id TEXT NOT NULL REFERENCES cards(id), easiness REAL NOT NULL DEFAULT 2.5, interval INTEGER NOT NULL DEFAULT 0, repetitions INTEGER NOT NULL DEFAULT 0, next_review TEXT NOT NULL, last_quality INTEGER, reviewed_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec('DELETE FROM reviews')
	await env.DB.exec('DELETE FROM cards')
	await env.DB.exec('DELETE FROM decks')
	await env.DB.prepare("INSERT INTO decks (id, name) VALUES (?, ?)").bind('deck-1', 'Test Deck').run()
	await env.DB.prepare("INSERT INTO cards (id, deck_id, question) VALUES (?, ?, ?)").bind('card-1', 'deck-1', 'What is 1+1?').run()
}

describe('POST /api/review/answer', () => {
	beforeEach(async () => {
		await setupDB()
	})

	it('新規回答: SM-2で計算しレビューを作成', async () => {
		const res = await app.fetch(
			new Request('http://localhost/api/review/answer', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', quality: 4 }),
			})
		)
		expect(res.status).toBe(200)
		const body = await res.json() as any
		expect(body.interval).toBe(1)
		expect(body.repetitions).toBe(1)
		expect(body.easiness).toBeCloseTo(2.5)
		expect(body.next_review).toBeDefined()
	})

	it('既存レビュー更新: 2回目の回答でrepetitions増加', async () => {
		await app.fetch(
			new Request('http://localhost/api/review/answer', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', quality: 4 }),
			})
		)
		const res = await app.fetch(
			new Request('http://localhost/api/review/answer', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', quality: 4 }),
			})
		)
		expect(res.status).toBe(200)
		const body = await res.json() as any
		expect(body.repetitions).toBe(2)
		expect(body.interval).toBe(6)
	})
})

describe('GET /api/review/next', () => {
	beforeEach(async () => {
		await setupDB()
	})

	it('next_review <= 今日 のカードを1枚返す', async () => {
		await env.DB.prepare("INSERT INTO reviews (id, card_id, easiness, interval, repetitions, next_review, last_quality) VALUES (?, ?, ?, ?, ?, ?, ?)")
			.bind('rev-1', 'card-1', 2.5, 1, 1, '2020-01-01', 4).run()

		const res = await app.fetch(new Request('http://localhost/api/review/next?deck_id=deck-1'))
		expect(res.status).toBe(200)
		const body = await res.json() as any
		expect(body.card_id).toBe('card-1')
	})

	it('復習カードなし → 204 No Content', async () => {
		const res = await app.fetch(new Request('http://localhost/api/review/next?deck_id=deck-1'))
		expect(res.status).toBe(204)
	})

	it('未来のnext_reviewのカードは返さない', async () => {
		await env.DB.prepare("INSERT INTO reviews (id, card_id, easiness, interval, repetitions, next_review, last_quality) VALUES (?, ?, ?, ?, ?, ?, ?)")
			.bind('rev-1', 'card-1', 2.5, 1, 1, '2099-12-31', 4).run()

		const res = await app.fetch(new Request('http://localhost/api/review/next?deck_id=deck-1'))
		expect(res.status).toBe(204)
	})
})

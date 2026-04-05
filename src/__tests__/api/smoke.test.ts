import { env, exports } from 'cloudflare:workers'
import { describe, it, expect, beforeEach } from 'vitest'

describe('smoke test', () => {
	beforeEach(async () => {
		await env.DB.exec("CREATE TABLE IF NOT EXISTS decks (id TEXT PRIMARY KEY, exam_id TEXT, name TEXT NOT NULL, description TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now')))")
		await env.DB.exec("CREATE TABLE IF NOT EXISTS cards (id TEXT PRIMARY KEY, deck_id TEXT NOT NULL, type TEXT NOT NULL DEFAULT 'single_select', question TEXT NOT NULL, explanation TEXT, version INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL DEFAULT (datetime('now')))")
		await env.DB.exec("CREATE TABLE IF NOT EXISTS reviews (id TEXT PRIMARY KEY, card_id TEXT NOT NULL, easiness REAL NOT NULL DEFAULT 2.5, interval INTEGER NOT NULL DEFAULT 0, repetitions INTEGER NOT NULL DEFAULT 0, next_review TEXT NOT NULL, last_quality INTEGER, reviewed_at TEXT NOT NULL DEFAULT (datetime('now')))")
	})

	it('GET / returns HTML with デッキ一覧', async () => {
		const res = await exports.default.fetch(new Request('http://localhost/'))
		expect(res.status).toBe(200)
		const text = await res.text()
		expect(text).toContain('デッキ一覧')
	})

	it('D1 binding is available', () => {
		expect(env.DB).toBeDefined()
	})
})

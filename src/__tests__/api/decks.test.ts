import { describe, it, expect, beforeEach } from 'vitest'
import { env, exports } from 'cloudflare:workers'

const app = exports.default

async function setupDB() {
	await env.DB.exec("CREATE TABLE IF NOT EXISTS decks (id TEXT PRIMARY KEY, exam_id TEXT, name TEXT NOT NULL, description TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec('DELETE FROM decks')
}

describe('Decks API', () => {
	beforeEach(async () => {
		await setupDB()
	})

	describe('GET /api/decks', () => {
		it('空のときは空配列を返す', async () => {
			const res = await app.fetch(new Request('http://localhost/api/decks'))
			expect(res.status).toBe(200)
			const body = await res.json()
			expect(body).toEqual({ decks: [] })
		})

		it('データがあるときはデッキ一覧を返す', async () => {
			await env.DB.prepare('INSERT INTO decks (id, name, description) VALUES (?, ?, ?)')
				.bind('deck-1', 'JavaScript基礎', 'JSの基本問題集').run()
			await env.DB.prepare('INSERT INTO decks (id, name, description) VALUES (?, ?, ?)')
				.bind('deck-2', 'TypeScript応用', 'TSの応用問題集').run()

			const res = await app.fetch(new Request('http://localhost/api/decks'))
			expect(res.status).toBe(200)
			const body = await res.json() as { decks: Array<{ id: string; name: string }> }
			expect(body.decks).toHaveLength(2)
			expect(body.decks[0]).toMatchObject({ id: 'deck-1', name: 'JavaScript基礎' })
		})
	})

	describe('POST /api/decks', () => {
		it('デッキを作成して201を返す', async () => {
			const res = await app.fetch(
				new Request('http://localhost/api/decks', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({ name: 'React入門', description: 'Reactの基本問題集' }),
				})
			)
			expect(res.status).toBe(201)
			const body = await res.json() as { deck: { id: string; name: string; description: string } }
			expect(body.deck.name).toBe('React入門')
			expect(body.deck.id).toBeDefined()
		})

		it('nameがない場合は400を返す', async () => {
			const res = await app.fetch(
				new Request('http://localhost/api/decks', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({ description: 'nameなし' }),
				})
			)
			expect(res.status).toBe(400)
		})
	})

	describe('GET /api/decks/:id', () => {
		beforeEach(async () => {
			await env.DB.prepare('INSERT INTO decks (id, name, description) VALUES (?, ?, ?)')
				.bind('deck-1', 'JavaScript基礎', 'JSの基本問題集').run()
		})

		it('存在するIDでデッキ詳細を返す', async () => {
			const res = await app.fetch(new Request('http://localhost/api/decks/deck-1'))
			expect(res.status).toBe(200)
			const body = await res.json() as { deck: { id: string; name: string } }
			expect(body.deck).toMatchObject({ id: 'deck-1', name: 'JavaScript基礎' })
		})

		it('存在しないIDで404を返す', async () => {
			const res = await app.fetch(new Request('http://localhost/api/decks/nonexistent'))
			expect(res.status).toBe(404)
		})
	})
})

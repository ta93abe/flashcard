import { describe, it, expect, beforeEach } from 'vitest'
import { env, exports } from 'cloudflare:workers'

const app = exports.default

async function setupDB() {
	await env.DB.exec("CREATE TABLE IF NOT EXISTS decks (id TEXT PRIMARY KEY, exam_id TEXT, name TEXT NOT NULL, description TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS cards (id TEXT PRIMARY KEY, deck_id TEXT NOT NULL REFERENCES decks(id), type TEXT NOT NULL DEFAULT 'single_select', question TEXT NOT NULL, explanation TEXT, version INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS feedbacks (id TEXT PRIMARY KEY, card_id TEXT NOT NULL REFERENCES cards(id), type TEXT NOT NULL, comment TEXT, status TEXT NOT NULL DEFAULT 'pending', ai_verdict TEXT, ai_confidence REAL, ai_suggested_question TEXT, ai_suggested_answer TEXT, human_decision TEXT, human_note TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), resolved_at TEXT)")
	await env.DB.exec('DELETE FROM feedbacks')
	await env.DB.exec('DELETE FROM cards')
	await env.DB.exec('DELETE FROM decks')
	await env.DB.prepare("INSERT INTO decks (id, name) VALUES (?, ?)").bind('deck-1', 'Test Deck').run()
	await env.DB.prepare("INSERT INTO cards (id, deck_id, question) VALUES (?, ?, ?)").bind('card-1', 'deck-1', 'What is 1+1?').run()
}

describe('Feedbacks API', () => {
	beforeEach(async () => {
		await setupDB()
	})

	describe('POST /api/feedback', () => {
		it('フィードバックを作成できる', async () => {
			const res = await app.fetch(
				new Request('http://localhost/api/feedback', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({
						card_id: 'card-1',
						type: 'incorrect_answer',
						comment: 'The answer seems wrong',
					}),
				})
			)
			expect(res.status).toBe(201)
			const body = await res.json() as any
			expect(body.id).toBeDefined()
			expect(body.card_id).toBe('card-1')
			expect(body.type).toBe('incorrect_answer')
			expect(body.status).toBe('pending')
		})

		it('不正なtypeで400を返す', async () => {
			const res = await app.fetch(
				new Request('http://localhost/api/feedback', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({ card_id: 'card-1', type: 'invalid_type' }),
				})
			)
			expect(res.status).toBe(400)
		})

		it('card_idが未指定で400を返す', async () => {
			const res = await app.fetch(
				new Request('http://localhost/api/feedback', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({ type: 'incorrect_answer' }),
				})
			)
			expect(res.status).toBe(400)
		})
	})

	describe('GET /api/feedback', () => {
		it('フィードバック一覧を取得できる', async () => {
			await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'incorrect_answer' }),
			}))
			await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'ambiguous' }),
			}))

			const res = await app.fetch(new Request('http://localhost/api/feedback'))
			expect(res.status).toBe(200)
			const body = await res.json() as any[]
			expect(body).toHaveLength(2)
		})

		it('statusでフィルタできる', async () => {
			await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'incorrect_answer' }),
			}))
			await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'ambiguous' }),
			}))

			const allRes = await app.fetch(new Request('http://localhost/api/feedback'))
			const all = await allRes.json() as any[]
			await env.DB.prepare("UPDATE feedbacks SET status = 'fixed' WHERE id = ?")
				.bind(all[0].id).run()

			const pendingRes = await app.fetch(new Request('http://localhost/api/feedback?status=pending'))
			const pending = await pendingRes.json() as any[]
			expect(pending).toHaveLength(1)
			expect(pending[0].status).toBe('pending')
		})
	})

	describe('GET /api/feedback/:id', () => {
		it('フィードバック詳細を取得できる', async () => {
			const createRes = await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'incorrect_answer', comment: 'test' }),
			}))
			const created = await createRes.json() as any

			const res = await app.fetch(new Request(`http://localhost/api/feedback/${created.id}`))
			expect(res.status).toBe(200)
			const body = await res.json() as any
			expect(body.id).toBe(created.id)
		})

		it('存在しないIDで404を返す', async () => {
			const res = await app.fetch(new Request('http://localhost/api/feedback/nonexistent-id'))
			expect(res.status).toBe(404)
		})
	})

	describe('PATCH /api/feedback/:id/decide', () => {
		it('approveでstatus=fixedになる', async () => {
			const createRes = await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'incorrect_answer' }),
			}))
			const created = await createRes.json() as any

			const res = await app.fetch(new Request(`http://localhost/api/feedback/${created.id}/decide`, {
				method: 'PATCH',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ decision: 'approve', note: 'Confirmed incorrect' }),
			}))
			expect(res.status).toBe(200)
			const body = await res.json() as any
			expect(body.status).toBe('fixed')
			expect(body.human_decision).toBe('approve')
			expect(body.resolved_at).toBeDefined()
		})

		it('rejectでstatus=dismissedになる', async () => {
			const createRes = await app.fetch(new Request('http://localhost/api/feedback', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: 'card-1', type: 'ambiguous' }),
			}))
			const created = await createRes.json() as any

			const res = await app.fetch(new Request(`http://localhost/api/feedback/${created.id}/decide`, {
				method: 'PATCH',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ decision: 'reject', note: 'Not a real issue' }),
			}))
			expect(res.status).toBe(200)
			const body = await res.json() as any
			expect(body.status).toBe('dismissed')
		})

		it('存在しないフィードバックへのdecideで404を返す', async () => {
			const res = await app.fetch(new Request('http://localhost/api/feedback/nonexistent/decide', {
				method: 'PATCH',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ decision: 'approve' }),
			}))
			expect(res.status).toBe(404)
		})
	})
})

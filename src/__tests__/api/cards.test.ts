import { describe, it, expect, beforeEach } from 'vitest'
import { env, exports } from 'cloudflare:workers'

const app = exports.default

async function setupDB() {
	await env.DB.exec("CREATE TABLE IF NOT EXISTS decks (id TEXT PRIMARY KEY, exam_id TEXT, name TEXT NOT NULL, description TEXT, created_at TEXT NOT NULL DEFAULT (datetime('now')), updated_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS cards (id TEXT PRIMARY KEY, deck_id TEXT NOT NULL REFERENCES decks(id), type TEXT NOT NULL DEFAULT 'single_select', topic_id TEXT, question TEXT NOT NULL, explanation TEXT, media_key TEXT, source_url TEXT, quality_score REAL, quality_note TEXT, version INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL DEFAULT (datetime('now')))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS card_options (id TEXT PRIMARY KEY, card_id TEXT NOT NULL REFERENCES cards(id), position INTEGER NOT NULL, label TEXT, body TEXT NOT NULL, media_key TEXT, group_name TEXT, UNIQUE(card_id, position))")
	await env.DB.exec("CREATE TABLE IF NOT EXISTS card_answers (id TEXT PRIMARY KEY, card_id TEXT NOT NULL REFERENCES cards(id), option_id TEXT REFERENCES card_options(id), text_value TEXT, sort_order INTEGER, region_x INTEGER, region_y INTEGER, region_w INTEGER, region_h INTEGER, child_card_id TEXT)")
	await env.DB.exec('DELETE FROM card_answers')
	await env.DB.exec('DELETE FROM card_options')
	await env.DB.exec('DELETE FROM cards')
	await env.DB.exec('DELETE FROM decks')
	await env.DB.prepare('INSERT INTO decks (id, name) VALUES (?, ?)').bind('deck-1', 'Test Deck').run()
}

describe('Cards API', () => {
	beforeEach(async () => {
		await setupDB()
	})

	describe('GET /api/decks/:deckId/cards', () => {
		it('デッキ内のカード一覧が空配列で返る', async () => {
			const res = await app.fetch(new Request('http://localhost/api/decks/deck-1/cards'))
			expect(res.status).toBe(200)
			const body = await res.json()
			expect(body).toEqual({ cards: [] })
		})
	})

	describe('POST /api/decks/:deckId/cards', () => {
		it('カード・選択肢・正解を一括作成できる', async () => {
			const payload = {
				question: 'Snowflakeのアーキテクチャ層は？',
				type: 'single_select',
				explanation: '3層構成です',
				options: [
					{ position: 0, label: 'A', body: 'Storage' },
					{ position: 1, label: 'B', body: 'Compute' },
					{ position: 2, label: 'C', body: 'Cloud Services' },
					{ position: 3, label: 'D', body: 'All of the above' },
				],
				answers: [{ option_position: 3 }],
			}

			const res = await app.fetch(
				new Request('http://localhost/api/decks/deck-1/cards', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify(payload),
				})
			)
			expect(res.status).toBe(201)

			const body = await res.json() as any
			expect(body.card.question).toBe('Snowflakeのアーキテクチャ層は？')
			expect(body.card.deck_id).toBe('deck-1')
			expect(body.options).toHaveLength(4)
			expect(body.answers).toHaveLength(1)
			expect(body.answers[0].option_id).toBe(body.options[3].id)
		})
	})

	describe('GET /api/cards/:id', () => {
		it('カード詳細を選択肢・正解付きで取得できる', async () => {
			const createRes = await app.fetch(
				new Request('http://localhost/api/decks/deck-1/cards', {
					method: 'POST',
					headers: { 'Content-Type': 'application/json' },
					body: JSON.stringify({
						question: 'テスト問題',
						options: [
							{ position: 0, label: 'A', body: '選択肢1' },
							{ position: 1, label: 'B', body: '選択肢2' },
						],
						answers: [{ option_position: 1 }],
					}),
				})
			)
			const created = await createRes.json() as any
			const cardId = created.card.id

			const res = await app.fetch(new Request(`http://localhost/api/cards/${cardId}`))
			expect(res.status).toBe(200)

			const body = await res.json() as any
			expect(body.card.question).toBe('テスト問題')
			expect(body.options).toHaveLength(2)
			expect(body.answers).toHaveLength(1)
		})

		it('存在しないIDで404が返る', async () => {
			const res = await app.fetch(new Request('http://localhost/api/cards/non-existent-id'))
			expect(res.status).toBe(404)
		})
	})
})

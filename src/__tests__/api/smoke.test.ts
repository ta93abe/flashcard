import { env, exports } from 'cloudflare:workers'
import { describe, it, expect } from 'vitest'

describe('smoke test', () => {
	it('GET / returns Hello Hono!', async () => {
		const res = await exports.default.fetch(new Request('http://localhost/'))
		expect(res.status).toBe(200)
		expect(await res.text()).toBe('Hello Hono!')
	})

	it('D1 binding is available', () => {
		expect(env.DB).toBeDefined()
	})
})

import { describe, it, expect } from 'vitest'
import { sm2 } from '../../lib/sm2'

describe('sm2', () => {
	describe('quality >= 3 (正解)', () => {
		it('初回正解: interval=1, repetitions=1', () => {
			const result = sm2({ quality: 4, easiness: 2.5, interval: 0, repetitions: 0 })
			expect(result.interval).toBe(1)
			expect(result.repetitions).toBe(1)
			expect(result.easiness).toBeCloseTo(2.5)
		})
	})

	describe('連続正解でinterval増加', () => {
		it('2回目正解: interval=6', () => {
			const result = sm2({ quality: 4, easiness: 2.5, interval: 1, repetitions: 1 })
			expect(result.interval).toBe(6)
			expect(result.repetitions).toBe(2)
		})

		it('3回目以降: interval = round(interval * easiness)', () => {
			const result = sm2({ quality: 4, easiness: 2.5, interval: 6, repetitions: 2 })
			expect(result.interval).toBe(15)
			expect(result.repetitions).toBe(3)
		})

		it('4回目: interval = round(15 * 2.5) = 38', () => {
			const result = sm2({ quality: 4, easiness: 2.5, interval: 15, repetitions: 3 })
			expect(result.interval).toBe(38)
			expect(result.repetitions).toBe(4)
		})
	})

	describe('境界値', () => {
		it('quality=3 (正解の下限): easiness下がる', () => {
			const result = sm2({ quality: 3, easiness: 2.5, interval: 0, repetitions: 0 })
			expect(result.interval).toBe(1)
			expect(result.repetitions).toBe(1)
			expect(result.easiness).toBeCloseTo(2.36)
		})

		it('quality=5 (最高評価): easinessが上がる', () => {
			const result = sm2({ quality: 5, easiness: 2.5, interval: 0, repetitions: 0 })
			expect(result.interval).toBe(1)
			expect(result.repetitions).toBe(1)
			expect(result.easiness).toBeCloseTo(2.6)
		})

		it('quality=0 (最低評価): easinessが1.3を下回らない', () => {
			const result = sm2({ quality: 0, easiness: 1.3, interval: 6, repetitions: 3 })
			expect(result.repetitions).toBe(0)
			expect(result.interval).toBe(1)
			expect(result.easiness).toBe(1.3)
		})
	})

	describe('quality < 3 (不正解)', () => {
		it('不正解: repetitions=0, interval=1にリセット', () => {
			const result = sm2({ quality: 1, easiness: 2.5, interval: 6, repetitions: 3 })
			expect(result.repetitions).toBe(0)
			expect(result.interval).toBe(1)
			expect(result.easiness).toBeCloseTo(1.96)
		})
	})
})

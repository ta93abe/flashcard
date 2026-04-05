import { test, expect } from '@playwright/test'

test.setTimeout(60_000)

test.describe('回答フロー', () => {
	test('回答後に結果バナー→解説→次の問題ボタン', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')

		const optBtn = page.locator('.option-btn').first()
		await expect(optBtn).toBeVisible({ timeout: 20_000 })
		await optBtn.click()

		const submitBtn = page.locator('.submit-btn:not([disabled])')
		await expect(submitBtn).toBeVisible({ timeout: 10_000 })
		await submitBtn.click()

		await expect(page.locator('.result-banner')).toBeVisible({ timeout: 5_000 })
		await expect(page.locator('.rating-grid')).not.toBeVisible()
		await expect(page.locator('.next-btn')).toBeVisible()
	})

	test('問題を報告ボタンが機能する', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')

		const optBtn = page.locator('.option-btn').first()
		await expect(optBtn).toBeVisible({ timeout: 20_000 })
		await optBtn.click()

		const submitBtn = page.locator('.submit-btn:not([disabled])')
		await expect(submitBtn).toBeVisible({ timeout: 10_000 })
		await submitBtn.click()

		await expect(page.locator('.flag-btn')).toBeVisible({ timeout: 5_000 })
		await page.locator('.flag-btn').click()
		await expect(page.locator('.flag-btn')).toContainText('報告済み')
	})
})

test.describe('模擬試験', () => {
	test('模擬試験モードで開始', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae?mode=exam')
		await expect(page).toHaveURL(/mode=exam&session=/)
		await expect(page.getByText('模擬試験')).toBeVisible({ timeout: 15_000 })
	})
})

test.describe('API', () => {
	test('POST /api/review/answer', async ({ request }) => {
		const res = await request.get('/api/decks/deck-dbt-ae/cards')
		const { cards } = await res.json()
		const ansRes = await request.post('/api/review/answer', {
			data: { card_id: cards[0].id, quality: 4 },
		})
		expect(ansRes.status()).toBe(200)
	})

	test('POST /api/feedback', async ({ request }) => {
		const res = await request.get('/api/decks/deck-dbt-ae/cards')
		const { cards } = await res.json()
		const fbRes = await request.post('/api/feedback', {
			data: { card_id: cards[0].id, type: 'ambiguous', comment: 'test' },
		})
		expect(fbRes.status()).toBe(201)
	})
})

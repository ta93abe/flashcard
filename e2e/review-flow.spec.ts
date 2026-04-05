import { test, expect } from '@playwright/test'

test.setTimeout(60_000)

test.describe('デッキ一覧', () => {
	test('デッキ一覧が表示される', async ({ page }) => {
		await page.goto('/')
		await expect(page.getByText('デッキ一覧')).toBeVisible()
		await expect(page.getByText('dbt Analytics Engineering').first()).toBeVisible()
	})

	test('学習ボタンで学習画面に遷移する', async ({ page }) => {
		await page.goto('/')
		await page.getByText('学習する').click()
		await expect(page).toHaveURL(/\/review\/deck-dbt-ae/)
	})
})

test.describe('学習フロー', () => {
	test('回答 → 解説 → 次の問題', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')

		// hydration 完了を待つ: ボタンがenabledになるまで
		const optBtn = page.locator('.option-btn').first()
		await expect(optBtn).toBeVisible({ timeout: 20_000 })
		await optBtn.click()

		// ボタンがenabledになるのを待つ
		const submitBtn = page.locator('.submit-btn:not([disabled])')
		await expect(submitBtn).toBeVisible({ timeout: 10_000 })
		await submitBtn.click()

		await expect(page.locator('.result-banner')).toBeVisible({ timeout: 5_000 })
		await expect(page.locator('.next-btn')).toBeVisible()
	})

	test('戻るリンクでデッキ一覧に戻れる', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')
		await page.getByText('デッキ一覧').click()
		await expect(page).toHaveURL('/')
	})
})

test.describe('API', () => {
	test('GET /api/decks', async ({ request }) => {
		const res = await request.get('/api/decks')
		expect(res.status()).toBe(200)
		const body = await res.json()
		expect(body.decks.length).toBeGreaterThan(0)
	})
})

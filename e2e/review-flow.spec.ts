import { test, expect } from '@playwright/test'

test.describe('デッキ一覧', () => {
	test('デッキ一覧が表示される', async ({ page }) => {
		await page.goto('/')
		await expect(page.getByText('デッキ一覧')).toBeVisible()
		await expect(page.getByText('dbt Analytics Engineering').first()).toBeVisible()
	})

	test('デッキカードに問題数が表示される', async ({ page }) => {
		await page.goto('/')
		await expect(page.getByText('320 問')).toBeVisible()
	})

	test('デッキをクリックすると学習画面に遷移する', async ({ page }) => {
		await page.goto('/')
		await page.getByText('dbt Analytics Engineering').first().click()
		await expect(page).toHaveURL(/\/review\/deck-dbt-ae/)
	})
})

test.describe('学習フロー', () => {
	test('問題が表示され回答できる', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')

		// 「回答する」か「答えを見る」ボタンを待つ (選択肢あり/なし両対応)
		const submitBtn = page.getByRole('button', { name: /回答する|答えを見る/ })
		await expect(submitBtn).toBeVisible({ timeout: 15_000 })

		// 選択肢があればクリック
		const optionBtn = page.locator('.option-btn').first()
		if (await optionBtn.isVisible().catch(() => false)) {
			await optionBtn.click()
		}

		await submitBtn.click()

		// 結果が表示される
		await expect(page.getByText('解説')).toBeVisible({ timeout: 5_000 })
	})

	test('理解度評価 → 次の問題', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')

		const submitBtn = page.getByRole('button', { name: /回答する|答えを見る/ })
		await expect(submitBtn).toBeVisible({ timeout: 15_000 })

		const optionBtn = page.locator('.option-btn').first()
		if (await optionBtn.isVisible().catch(() => false)) {
			await optionBtn.click()
		}

		await submitBtn.click()

		await expect(page.getByText('理解度を評価してください')).toBeVisible({ timeout: 5_000 })

		await page.locator('.rating-btn').last().click()
		await page.waitForURL(/\/review\/deck-dbt-ae/, { timeout: 10_000 })
	})

	test('戻るリンクでデッキ一覧に戻れる', async ({ page }) => {
		await page.goto('/review/deck-dbt-ae')
		await page.getByText('デッキ一覧').click()
		await expect(page).toHaveURL('/')
	})
})

test.describe('レスポンシブ', () => {
	test('モバイルでもデッキ一覧が表示される', async ({ page }) => {
		await page.setViewportSize({ width: 375, height: 812 })
		await page.goto('/')
		await expect(page.getByText('デッキ一覧')).toBeVisible()
		await expect(page.getByText('dbt Analytics Engineering').first()).toBeVisible()
	})

	test('モバイルでも学習画面が操作できる', async ({ page }) => {
		await page.setViewportSize({ width: 375, height: 812 })
		await page.goto('/review/deck-dbt-ae')
		const submitBtn = page.getByRole('button', { name: /回答する|答えを見る/ })
		await expect(submitBtn).toBeVisible({ timeout: 15_000 })
	})
})

test.describe('API', () => {
	test('GET /api/decks がJSONを返す', async ({ request }) => {
		const res = await request.get('/api/decks')
		expect(res.status()).toBe(200)
		const body = await res.json()
		expect(body.decks).toBeDefined()
		expect(body.decks.length).toBeGreaterThan(0)
	})

	test('GET /api/decks/deck-dbt-ae/cards がカード一覧を返す', async ({ request }) => {
		const res = await request.get('/api/decks/deck-dbt-ae/cards')
		expect(res.status()).toBe(200)
		const body = await res.json()
		expect(body.cards.length).toBe(320)
	})
})

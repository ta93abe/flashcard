# テスト

## テストスタック

| 種別 | ツール | 対象 |
|---|---|---|
| API単体テスト | Vitest + `@cloudflare/vitest-pool-workers` | Hono API ルート |
| API型安全テスト | Vitest + `hono/testing` (testClient) | RPC型推論の検証 |
| フロントエンド単体テスト | Vitest + Astro Container API | Astroコンポーネント |
| E2Eテスト | Playwright | ユーザーフロー全体 |

## セットアップ

```bash
# API テスト
pnpm add -D vitest @cloudflare/vitest-pool-workers

# E2E テスト
pnpm create playwright
```

package.json に以下のスクリプトを追加:

```jsonc
{
  "scripts": {
    "test": "vitest run",
    "test:watch": "vitest",
    "test:e2e": "playwright test"
  }
}
```

## Vitest 設定 (API — Hono Workers)

`@cloudflare/vitest-pool-workers` を使うことで、D1/KV/R2 のバインディングが実際の Miniflare ランタイムで動作する。モックではなく本物のSQLiteが使われるため、D1クエリの挙動を正確にテストできる。

```ts
// vitest.config.ts (API)
import { defineWorkersConfig } from '@cloudflare/vitest-pool-workers/config'

export default defineWorkersConfig({
  test: {
    poolOptions: {
      workers: {
        wrangler: { configPath: './wrangler.jsonc' },
      },
    },
  },
})
```

## Vitest 設定 (フロントエンド — Astro)

```ts
// vitest.config.ts (フロントエンド)
/// <reference types="vitest/config" />
import { getViteConfig } from 'astro/config'

export default getViteConfig({
  test: {},
})
```

## Playwright 設定

```ts
// playwright.config.ts
import { defineConfig } from '@playwright/test'

export default defineConfig({
  webServer: {
    command: 'pnpm run preview',
    url: 'http://localhost:4321/',
    timeout: 120 * 1000,
    reuseExistingServer: !process.env.CI,
  },
  use: {
    baseURL: 'http://localhost:4321/',
  },
})
```

## APIテスト例

### バインディングを使った統合テスト (`@cloudflare/vitest-pool-workers`)

```ts
// src/__tests__/api/decks.test.ts
import { env } from 'cloudflare:workers'
import { createExecutionContext, waitOnExecutionContext } from 'cloudflare:test'
import { describe, it, expect, beforeEach } from 'vitest'
import app from '../../index'

describe('GET /api/decks', () => {
  beforeEach(async () => {
    // Miniflare の D1 に直接テストデータを投入
    await env.DB.exec(`
      DELETE FROM decks;
      INSERT INTO decks (id, name, description)
      VALUES ('deck-1', 'SnowPro Core', 'Snowflake基礎');
    `)
  })

  it('デッキ一覧を返す', async () => {
    const req = new Request('http://localhost/api/decks')
    const ctx = createExecutionContext()
    const res = await app.fetch(req, env, ctx)
    await waitOnExecutionContext(ctx)

    expect(res.status).toBe(200)
    const data = await res.json()
    expect(data).toHaveLength(1)
    expect(data[0].name).toBe('SnowPro Core')
  })
})
```

### testClient を使った型安全テスト (`hono/testing`)

ルート定義をチェーンすることで型推論が効き、パスやクエリパラメータの補完が得られる。

```ts
// src/__tests__/api/review.test.ts
import { testClient } from 'hono/testing'
import { describe, it, expect } from 'vitest'
import app from '../../index'

describe('POST /api/review/answer', () => {
  const client = testClient(app)

  it('SM-2パラメータが更新される', async () => {
    const res = await client.api.review.answer.$post({
      json: {
        card_id: 'card-1',
        quality: 4,
      },
    })

    expect(res.status).toBe(200)
    const data = await res.json()
    expect(data.next_review).toBeDefined()
    expect(data.interval).toBeGreaterThan(0)
  })
})
```

### app.request() を使ったシンプルなテスト

バインディングのモックが必要な場合やtestClientが使えない場合に使用。

```ts
// src/__tests__/api/feedback.test.ts
import { describe, it, expect } from 'vitest'
import app from '../../index'

const MOCK_ENV = {
  DB: {
    prepare: () => ({
      bind: () => ({
        run: async () => ({ success: true }),
        first: async () => ({ id: 'fb-1', status: 'pending' }),
      }),
    }),
  },
  AI: {
    run: async () => ({ response: '{"verdict":"incorrect","reason":"..."}' }),
    autorag: () => ({
      search: async () => ({ data: [] }),
    }),
  },
}

describe('POST /api/feedback', () => {
  it('フィードバックを保存する', async () => {
    const res = await app.request('/api/feedback', {
      method: 'POST',
      body: JSON.stringify({
        card_id: 'card-1',
        type: 'incorrect_answer',
        comment: '正解が間違っている',
      }),
      headers: { 'Content-Type': 'application/json' },
    }, MOCK_ENV)

    expect(res.status).toBe(200)
  })
})
```

## フロントエンドテスト例

### Astro Container API でコンポーネントテスト

```ts
// src/__tests__/components/Card.test.ts
import { experimental_AstroContainer as AstroContainer } from 'astro/container'
import { expect, test } from 'vitest'
import ReviewCard from '../../components/ReviewCard.astro'

test('ReviewCard に問題文が表示される', async () => {
  const container = await AstroContainer.create()
  const result = await container.renderToString(ReviewCard, {
    props: {
      question: 'Snowflakeの3層アーキテクチャを挙げよ',
      type: 'free_recall',
    },
  })

  expect(result).toContain('Snowflakeの3層アーキテクチャ')
  expect(result).toContain('free_recall')
})
```

## E2Eテスト例

### Playwright で学習フロー全体をテスト

```ts
// e2e/review-flow.spec.ts
import { test, expect } from '@playwright/test'

test.describe('学習フロー', () => {
  test('デッキ選択 → 出題 → 回答 → 次の問題', async ({ page }) => {
    await page.goto('/')

    // デッキ一覧
    await expect(page.getByRole('heading', { name: 'デッキ一覧' })).toBeVisible()
    await page.getByRole('link', { name: 'SnowPro Core' }).click()

    // 出題画面
    await expect(page.getByTestId('question')).toBeVisible()

    // 回答を選択 (single_select)
    await page.getByTestId('option-1').click()
    await page.getByRole('button', { name: '回答する' }).click()

    // 結果表示
    await expect(page.getByTestId('explanation')).toBeVisible()

    // 自己評価
    await page.getByRole('button', { name: '4 - 少し迷ったが正解' }).click()

    // 次の問題
    await expect(page.getByTestId('question')).toBeVisible()
  })

  test('問題を報告できる', async ({ page }) => {
    await page.goto('/review/deck-1')

    await page.getByRole('button', { name: '問題を報告' }).click()
    await page.getByRole('radio', { name: '正解が間違っている' }).click()
    await page.getByRole('textbox', { name: 'コメント' }).fill('RFC 793と矛盾する')
    await page.getByRole('button', { name: '送信' }).click()

    await expect(page.getByText('報告を受け付けました')).toBeVisible()
  })

  test('モバイルでも操作できる', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 812 })
    await page.goto('/')

    await expect(page.getByRole('heading', { name: 'デッキ一覧' })).toBeVisible()
    await page.getByRole('link', { name: 'SnowPro Core' }).click()
    await expect(page.getByTestId('question')).toBeVisible()
  })
})
```

### Playwright で問題形式ごとのUIテスト

```ts
// e2e/card-types.spec.ts
import { test, expect } from '@playwright/test'

test.describe('問題形式別UI', () => {
  test('matching: ドラッグで左右を対応付け', async ({ page }) => {
    await page.goto('/review/deck-1?type=matching')

    const leftItems = page.getByTestId('matching-left').locator('li')
    const rightItems = page.getByTestId('matching-right').locator('li')
    await expect(leftItems).toHaveCount(3)
    await expect(rightItems).toHaveCount(3)

    // ドラッグ&ドロップで対応付け
    await leftItems.nth(0).dragTo(rightItems.nth(1))

    await page.getByRole('button', { name: '回答する' }).click()
    await expect(page.getByTestId('result')).toBeVisible()
  })

  test('ordering: 並べ替え', async ({ page }) => {
    await page.goto('/review/deck-1?type=ordering')

    const items = page.getByTestId('ordering-list').locator('li')
    await expect(items).toHaveCount(3)

    // 並べ替え操作
    await items.nth(2).dragTo(items.nth(0))

    await page.getByRole('button', { name: '回答する' }).click()
    await expect(page.getByTestId('result')).toBeVisible()
  })

  test('fill_blank: テキスト入力', async ({ page }) => {
    await page.goto('/review/deck-1?type=fill_blank')

    await page.getByTestId('blank-input').fill('dbt deps')
    await page.getByRole('button', { name: '回答する' }).click()
    await expect(page.getByTestId('result')).toBeVisible()
  })
})
```

## テスト方針

| テスト対象 | 手法 | ポイント |
|---|---|---|
| SM-2 アルゴリズム | Vitest 単体テスト | 境界値 (quality=0,3,5), interval計算の正確性 |
| D1 クエリ | `@cloudflare/vitest-pool-workers` | Miniflare の実D1で実行。モック不要 |
| 採点ロジック | Vitest 単体テスト | card_types.grading ごとに正解/不正解/部分点 |
| AI 呼び出し | app.request() + モック | AI レスポンスをモックし、パース・保存ロジックをテスト |
| 問題形式 UI | Playwright | 各 card_type の操作性（タップ、ドラッグ、入力） |
| レスポンシブ | Playwright viewport | 375px (モバイル) / 1280px (デスクトップ) |
| フィードバック→修正フロー | Playwright | 報告→ファクトチェック→管理者承認の一連の流れ |

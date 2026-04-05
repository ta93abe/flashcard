# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flashcard API built with Hono on Cloudflare Workers. SM-2 spaced repetition algorithm for learning.

## Commands

- `pnpm install` — install dependencies
- `pnpm run dev` — start local dev server (wrangler dev)
- `pnpm run deploy` — deploy to Cloudflare Workers
- `pnpm run cf-typegen` — generate TypeScript types from wrangler config
- `pnpm test` — run tests (vitest + @cloudflare/vitest-pool-workers)
- `pnpm run test:watch` — run tests in watch mode

## Architecture

- **Runtime**: Cloudflare Workers
- **Framework**: Hono (sub-app pattern per route module)
- **Database**: D1 (SQLite)
- **Entry point**: `src/index.ts`
- **Routes**: `src/routes/{decks,cards,reviews,feedbacks}.ts`
- **Logic**: `src/lib/sm2.ts` (SM-2 algorithm)
- **Config**: `wrangler.jsonc`
- **Schema**: `seeds/schema.sql`, `seeds/seed-card-types.sql`

When using Cloudflare bindings (KV, D1, R2, etc.), pass `CloudflareBindings` as generics to Hono:

```ts
const app = new Hono<{ Bindings: CloudflareBindings }>()
```

## Testing

- Tests use `@cloudflare/vitest-pool-workers` (v4) with real D1 via Miniflare
- Import `{ env, exports } from 'cloudflare:workers'`
- Use `exports.default.fetch(new Request(...))` to call the app
- D1 schema is set up in `beforeEach` per test file

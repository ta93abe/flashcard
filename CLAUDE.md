# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flashcard API built with Hono on Cloudflare Workers. Currently in early stage (single endpoint).

## Commands

- `pnpm install` — install dependencies
- `pnpm run dev` — start local dev server (wrangler dev)
- `pnpm run deploy` — deploy to Cloudflare Workers
- `pnpm run cf-typegen` — generate TypeScript types from wrangler config

## Architecture

- **Runtime**: Cloudflare Workers
- **Framework**: Hono
- **Entry point**: `src/index.ts`
- **Config**: `wrangler.jsonc`

When using Cloudflare bindings (KV, D1, R2, etc.), pass `CloudflareBindings` as generics to Hono:

```ts
const app = new Hono<{ Bindings: CloudflareBindings }>()
```

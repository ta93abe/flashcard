import { defineConfig } from 'vitest/config'
import { cloudflarePool } from '@cloudflare/vitest-pool-workers'
import path from 'node:path'

export default defineConfig({
	resolve: {
		alias: {
			'@': path.resolve(__dirname, './src'),
		},
	},
	test: {
		pool: cloudflarePool({
			main: './src/index.tsx',
			wrangler: { configPath: './wrangler.jsonc' },
		}),
		exclude: ['node_modules/**', '.claude/**'],
	},
})

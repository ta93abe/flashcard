import { defineConfig } from 'astro/config'
import react from '@astrojs/react'
import cloudflare from '@astrojs/cloudflare'

export default defineConfig({
	output: 'server',
	adapter: cloudflare({
		platformProxy: {
			enabled: true,
			configPath: './wrangler.jsonc',
		},
	}),
	integrations: [react()],
	vite: {
		ssr: {
			external: ['cloudflare:workers'],
		},
	},
})

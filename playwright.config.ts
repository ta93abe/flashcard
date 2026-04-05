import { defineConfig } from '@playwright/test'

export default defineConfig({
	testDir: 'e2e',
	timeout: 30_000,
	webServer: {
		command: 'pnpm run preview',
		url: 'http://localhost:8787/',
		timeout: 60_000,
		reuseExistingServer: !process.env.CI,
		stdout: 'pipe',
	},
	use: {
		baseURL: 'http://localhost:8787/',
	},
})

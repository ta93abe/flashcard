import type { FC, PropsWithChildren } from 'hono/jsx'

export const Layout: FC<PropsWithChildren<{ title?: string }>> = ({ title, children }) => (
	<html lang="ja">
		<head>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<title>{title ? `${title} — Flashcard` : 'Flashcard'}</title>
			<style>{`
				*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

				:root {
					--bg: #0f0f13;
					--bg-card: #1a1a24;
					--bg-card-hover: #22223a;
					--bg-option: #1e1e2e;
					--bg-option-hover: #2a2a42;
					--bg-option-selected: #3b3b6d;
					--bg-correct: #1a3a2a;
					--bg-incorrect: #3a1a1a;
					--border: #2a2a3e;
					--border-focus: #6366f1;
					--text: #e4e4ed;
					--text-muted: #8888a4;
					--text-dim: #5c5c78;
					--accent: #6366f1;
					--accent-hover: #818cf8;
					--correct: #4ade80;
					--incorrect: #f87171;
					--warning: #fbbf24;
					--radius: 12px;
					--radius-sm: 8px;
					--shadow: 0 4px 24px rgba(0,0,0,0.3);
					--transition: 0.2s cubic-bezier(0.4, 0, 0.2, 1);
				}

				body {
					font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans JP', sans-serif;
					background: var(--bg);
					color: var(--text);
					line-height: 1.7;
					min-height: 100dvh;
					-webkit-font-smoothing: antialiased;
				}

				.container {
					max-width: 720px;
					margin: 0 auto;
					padding: 0 20px;
				}

				header {
					padding: 20px 0;
					border-bottom: 1px solid var(--border);
					margin-bottom: 32px;
				}

				header .container {
					display: flex;
					align-items: center;
					justify-content: space-between;
				}

				header a {
					color: var(--text);
					text-decoration: none;
					font-weight: 700;
					font-size: 18px;
					letter-spacing: -0.02em;
				}

				header .badge {
					font-size: 11px;
					color: var(--text-muted);
					background: var(--bg-card);
					padding: 4px 10px;
					border-radius: 100px;
					border: 1px solid var(--border);
				}

				main { padding-bottom: 80px; }

				h1 {
					font-size: 28px;
					font-weight: 800;
					letter-spacing: -0.03em;
					margin-bottom: 8px;
				}

				h2 {
					font-size: 20px;
					font-weight: 700;
					letter-spacing: -0.02em;
					margin-bottom: 16px;
				}

				p.subtitle {
					color: var(--text-muted);
					font-size: 14px;
					margin-bottom: 32px;
				}

				.card {
					background: var(--bg-card);
					border: 1px solid var(--border);
					border-radius: var(--radius);
					padding: 24px;
					transition: var(--transition);
					box-shadow: var(--shadow);
				}

				.card:hover {
					background: var(--bg-card-hover);
					border-color: var(--border-focus);
					transform: translateY(-2px);
				}

				.card a {
					text-decoration: none;
					color: inherit;
					display: block;
				}

				.btn {
					display: inline-flex;
					align-items: center;
					justify-content: center;
					gap: 8px;
					padding: 12px 24px;
					border-radius: var(--radius-sm);
					border: none;
					font-size: 15px;
					font-weight: 600;
					cursor: pointer;
					transition: var(--transition);
					text-decoration: none;
					line-height: 1;
				}

				.btn-primary {
					background: var(--accent);
					color: #fff;
				}
				.btn-primary:hover { background: var(--accent-hover); }
				.btn-primary:disabled {
					opacity: 0.4;
					cursor: not-allowed;
				}

				.btn-ghost {
					background: transparent;
					color: var(--text-muted);
					border: 1px solid var(--border);
				}
				.btn-ghost:hover {
					background: var(--bg-card);
					color: var(--text);
				}

				.btn-block { width: 100%; }

				.tag {
					display: inline-block;
					font-size: 11px;
					font-weight: 600;
					padding: 3px 8px;
					border-radius: 4px;
					text-transform: uppercase;
					letter-spacing: 0.04em;
				}

				.tag-purple { background: rgba(99,102,241,0.15); color: #a5b4fc; }
				.tag-green { background: rgba(74,222,128,0.15); color: var(--correct); }
				.tag-amber { background: rgba(251,191,36,0.15); color: var(--warning); }

				code {
					font-family: 'SF Mono', 'Fira Code', monospace;
					background: rgba(99,102,241,0.1);
					padding: 2px 6px;
					border-radius: 4px;
					font-size: 0.9em;
				}

				pre {
					background: #12121a;
					border: 1px solid var(--border);
					border-radius: var(--radius-sm);
					padding: 16px;
					overflow-x: auto;
					font-size: 13px;
					line-height: 1.5;
					margin: 12px 0;
				}

				pre code {
					background: none;
					padding: 0;
				}

				@media (max-width: 640px) {
					h1 { font-size: 22px; }
					.card { padding: 16px; }
					.container { padding: 0 16px; }
				}

				.fade-in {
					animation: fadeIn 0.3s ease-out;
				}

				@keyframes fadeIn {
					from { opacity: 0; transform: translateY(8px); }
					to { opacity: 1; transform: translateY(0); }
				}

				@keyframes shake {
					0%, 100% { transform: translateX(0); }
					25% { transform: translateX(-4px); }
					75% { transform: translateX(4px); }
				}
			`}</style>
		</head>
		<body>
			<header>
				<div class="container">
					<a href="/">Flashcard</a>
					<span class="badge">Spaced Repetition</span>
				</div>
			</header>
			<main>
				<div class="container">
					{children}
				</div>
			</main>
		</body>
	</html>
)

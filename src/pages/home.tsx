import type { FC } from 'hono/jsx'
import { Layout } from './layout'

interface Deck {
	id: string
	name: string
	description: string | null
	exam_id: string | null
}

interface DeckWithStats extends Deck {
	cardCount: number
	dueCount: number
}

export const HomePage: FC<{ decks: DeckWithStats[] }> = ({ decks }) => (
	<Layout title="ホーム">
		<h1>デッキ一覧</h1>
		<p class="subtitle">学習するデッキを選んでください</p>

		<div style="display: flex; flex-direction: column; gap: 16px;">
			{decks.length === 0 ? (
				<div class="card" style="text-align: center; padding: 48px 24px;">
					<p style="color: var(--text-muted); font-size: 15px;">
						デッキがまだありません
					</p>
				</div>
			) : (
				decks.map((deck) => (
					<div class="card fade-in">
						<a href={`/review/${deck.id}`}>
							<div style="display: flex; justify-content: space-between; align-items: flex-start; gap: 16px;">
								<div style="flex: 1; min-width: 0;">
									<h2 style="margin-bottom: 6px; font-size: 18px;">{deck.name}</h2>
									{deck.description && (
										<p style="color: var(--text-muted); font-size: 13px; margin-bottom: 12px;">
											{deck.description}
										</p>
									)}
									<div style="display: flex; gap: 8px; flex-wrap: wrap;">
										<span class="tag tag-purple">{deck.cardCount} 問</span>
										{deck.dueCount > 0 ? (
											<span class="tag tag-amber">{deck.dueCount} 復習待ち</span>
										) : (
											<span class="tag tag-green">完了</span>
										)}
									</div>
								</div>
								<div style="color: var(--text-dim); font-size: 24px; flex-shrink: 0; padding-top: 4px;">
									&#8250;
								</div>
							</div>
						</a>
					</div>
				))
			)}
		</div>
	</Layout>
)

import { Surface, Badge, Text } from '@cloudflare/kumo'
import { BookOpen, ArrowRight, Trophy, Book, Exam } from '@phosphor-icons/react'

interface DeckWithStats {
	id: string
	name: string
	description: string | null
	exam_id: string | null
	cardCount: number
	dueCount: number
}

export function DeckList({ decks }: { decks: DeckWithStats[] }) {
	if (decks.length === 0) {
		return (
			<div className="deck-empty">
				<BookOpen size={48} style={{ color: '#6b7280', marginBottom: 16 }} />
				<p style={{ color: '#9ca3af' }}>デッキがまだありません</p>
			</div>
		)
	}

	return (
		<div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
			{decks.map((deck) => (
				<div key={deck.id} className="deck-card fade-in">
					<div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 16 }}>
						<div style={{ flex: 1, minWidth: 0 }}>
							<h3 className="deck-title">{deck.name}</h3>
							{deck.description && (
								<p className="deck-desc">{deck.description}</p>
							)}
							<div className="deck-badges">
								<span className="badge badge-blue">{deck.cardCount} 問</span>
								{deck.dueCount > 0 ? (
									<span className="badge badge-orange">{deck.dueCount} 復習待ち</span>
								) : (
									<span className="badge badge-green">完了</span>
								)}
							</div>
							<div className="deck-actions">
								<a href={`/review/${deck.id}`} className="action-btn action-study">
									学習する
								</a>
								{deck.exam_id && (
									<a href={`/review/${deck.id}?mode=exam`} className="action-btn action-exam">
										<Exam size={14} weight="bold" />
										模擬試験 (65問)
									</a>
								)}
								{deck.exam_id && (
									<a href={`/guide/${deck.exam_id}`} className="action-btn action-guide">
										<Book size={14} />
										ガイド
									</a>
								)}
							</div>
						</div>
					</div>
				</div>
			))}
		</div>
	)
}

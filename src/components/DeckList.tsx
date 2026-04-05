import { Surface, Badge, Button, Text } from '@cloudflare/kumo'
import { BookOpen, ArrowRight, Trophy, Book } from '@phosphor-icons/react'

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
			<Surface className="deck-empty" style={{ textAlign: 'center', padding: '48px 24px' }}>
				<BookOpen size={48} style={{ color: 'var(--kumo-color-text-subtle)', marginBottom: 16 }} />
				<Text>デッキがまだありません</Text>
			</Surface>
		)
	}

	return (
		<div style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
			{decks.map((deck) => (
				<a key={deck.id} href={`/review/${deck.id}`} style={{ textDecoration: 'none', color: 'inherit' }}>
					<Surface className="deck-card fade-in">
						<div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 16 }}>
							<div style={{ flex: 1, minWidth: 0 }}>
								<Text style={{ fontSize: 18, fontWeight: 700, marginBottom: 6, display: 'block' }}>
									{deck.name}
								</Text>
								{deck.description && (
									<Text style={{ fontSize: 13, color: 'var(--kumo-color-text-subtle)', marginBottom: 12, display: 'block' }}>
										{deck.description}
									</Text>
								)}
								<div style={{ display: 'flex', gap: 8, flexWrap: 'wrap', alignItems: 'center' }}>
									<Badge color="blue">{deck.cardCount} 問</Badge>
									{deck.dueCount > 0 ? (
										<Badge color="orange">{deck.dueCount} 復習待ち</Badge>
									) : (
										<Badge color="green">
											<Trophy size={12} weight="bold" style={{ marginRight: 4 }} />
											完了
										</Badge>
									)}
									{deck.exam_id && (
										<a
											href={`/review/${deck.id}?mode=exam`}
											onClick={(e) => e.stopPropagation()}
											style={{ fontSize: 12, color: '#fbbf24', textDecoration: 'none', fontWeight: 600, padding: '2px 8px', border: '1px solid #fbbf24', borderRadius: 4 }}
										>
											模擬試験
										</a>
									)}
								</div>
							</div>
							<div style={{ display: 'flex', flexDirection: 'column', gap: 8, flexShrink: 0 }}>
								<ArrowRight size={20} style={{ color: 'var(--kumo-color-text-subtle)' }} />
								{deck.exam_id && (
									<a href={`/guide/${deck.exam_id}`} onClick={(e) => e.stopPropagation()} style={{ color: 'var(--kumo-color-text-subtle)', fontSize: 12 }} title="ガイドを見る">
										<Book size={18} />
									</a>
								)}
							</div>
						</div>
					</Surface>
				</a>
			))}
		</div>
	)
}

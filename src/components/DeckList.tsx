import { Surface, Badge, Button, Text } from '@cloudflare/kumo'
import { BookOpen, ArrowRight, Trophy } from '@phosphor-icons/react'

interface DeckWithStats {
	id: string
	name: string
	description: string | null
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
								<div style={{ display: 'flex', gap: 8, flexWrap: 'wrap' }}>
									<Badge color="blue">{deck.cardCount} 問</Badge>
									{deck.dueCount > 0 ? (
										<Badge color="orange">{deck.dueCount} 復習待ち</Badge>
									) : (
										<Badge color="green">
											<Trophy size={12} weight="bold" style={{ marginRight: 4 }} />
											完了
										</Badge>
									)}
								</div>
							</div>
							<ArrowRight size={20} style={{ color: 'var(--kumo-color-text-subtle)', flexShrink: 0, paddingTop: 4 }} />
						</div>
					</Surface>
				</a>
			))}
		</div>
	)
}

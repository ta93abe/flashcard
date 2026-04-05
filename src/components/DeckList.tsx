import { BookOpen, Book, Exam } from '@phosphor-icons/react'

interface DeckWithStats {
	id: string
	name: string
	description: string | null
	exam_id: string | null
	cardCount: number
	dueCount: number
	reviewedCount: number
}

function ProgressRing({ reviewed, total }: { reviewed: number; total: number }) {
	const size = 44
	const sw = 4
	const r = (size - sw) / 2
	const circ = 2 * Math.PI * r
	const pct = total > 0 ? Math.round((reviewed / total) * 100) : 0
	const offset = circ - (circ * pct) / 100
	return (
		<svg width={size} height={size} style={{ flexShrink: 0 }}>
			<circle cx={size/2} cy={size/2} r={r} fill="none" stroke="#2a2a42" strokeWidth={sw} />
			<circle cx={size/2} cy={size/2} r={r} fill="none" stroke="#6366f1" strokeWidth={sw}
				strokeDasharray={circ} strokeDashoffset={offset} strokeLinecap="round"
				transform={`rotate(-90 ${size/2} ${size/2})`} />
			<text x={size/2} y={size/2} textAnchor="middle" dominantBaseline="central"
				fill="#e4e4ed" fontSize={11} fontWeight={700}>{pct}%</text>
		</svg>
	)
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
							{deck.description && <p className="deck-desc">{deck.description}</p>}
							<div className="deck-badges">
								<span className="badge badge-blue">{deck.cardCount} 問</span>
								{deck.dueCount > 0 ? (
									<span className="badge badge-orange">{deck.dueCount} 復習待ち</span>
								) : (
									<span className="badge badge-green">完了</span>
								)}
							</div>
							<div className="deck-actions">
								<a href={`/review/${deck.id}`} className="action-btn action-study">学習する</a>
								{deck.exam_id && (
									<a href={`/review/${deck.id}?mode=exam`} className="action-btn action-exam">
										<Exam size={14} weight="bold" /> 模擬試験 (65問)
									</a>
								)}
								{deck.exam_id && (
									<a href={`/guide/${deck.exam_id}`} className="action-btn action-guide">
										<Book size={14} /> ガイド
									</a>
								)}
							</div>
						</div>
						<ProgressRing reviewed={deck.reviewedCount} total={deck.cardCount} />
					</div>
				</div>
			))}
		</div>
	)
}

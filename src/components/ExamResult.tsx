import { ArrowClockwise, House } from '@phosphor-icons/react'

interface ExamResultProps {
	deckId: string
	deckName: string
	totalQuestions: number
	correctCount: number
	passingScore: number
}

export function ExamResult({ deckId, deckName, totalQuestions, correctCount, passingScore }: ExamResultProps) {
	const pct = totalQuestions > 0 ? Math.round((correctCount / totalQuestions) * 100) : 0
	const passed = pct >= passingScore
	const radius = 70
	const circ = 2 * Math.PI * radius
	const correctArc = (correctCount / totalQuestions) * circ

	return (
		<div style={{ maxWidth: 520, margin: '0 auto', padding: '40px 20px' }}>
			<div style={{ textAlign: 'center', marginBottom: 32 }}>
				<div style={{ fontSize: 40, marginBottom: 8 }}>&#127942;</div>
				<h2 style={{ fontSize: 22, fontWeight: 700, color: '#e4e4ed', margin: '0 0 4px' }}>模擬試験完了!</h2>
				<p style={{ fontSize: 14, color: '#8888a4', margin: 0 }}>{deckName}</p>
			</div>

			<div style={{
				padding: '14px 20px', borderRadius: 10, marginBottom: 28, textAlign: 'center',
				fontWeight: 700, fontSize: 16,
				background: passed ? 'rgba(74,222,128,0.12)' : 'rgba(248,113,113,0.12)',
				color: passed ? '#4ade80' : '#f87171',
				border: `1px solid ${passed ? 'rgba(74,222,128,0.25)' : 'rgba(248,113,113,0.25)'}`,
			}}>
				{passed ? '&#127881; 合格' : '&#128546; 不合格'} &mdash; {pct}%（合格ライン: {passingScore}%）
			</div>

			<div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 36, marginBottom: 28, flexWrap: 'wrap' }}>
				<div style={{ position: 'relative', width: 170, height: 170, flexShrink: 0 }}>
					<svg width="170" height="170" viewBox="0 0 170 170">
						<circle cx="85" cy="85" r={radius} fill="none" stroke="#2a2a42" strokeWidth="16" />
						<circle cx="85" cy="85" r={radius} fill="none" stroke="#f87171" strokeWidth="16"
							strokeDasharray={`${circ} ${circ}`} transform="rotate(-90 85 85)" strokeLinecap="round" />
						<circle cx="85" cy="85" r={radius} fill="none" stroke="#4ade80" strokeWidth="16"
							strokeDasharray={`${correctArc} ${circ - correctArc}`} transform="rotate(-90 85 85)" strokeLinecap="round" />
					</svg>
					<div style={{ position: 'absolute', inset: 0, display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center' }}>
						<span style={{ fontSize: 32, fontWeight: 800, color: '#e4e4ed', lineHeight: 1 }}>{pct}%</span>
						<span style={{ fontSize: 12, color: '#8888a4', marginTop: 4 }}>正答率</span>
					</div>
				</div>
				<div style={{ display: 'flex', flexDirection: 'column', gap: 12 }}>
					<div style={{ background: '#1e1e2e', border: '1px solid #2a2a42', borderRadius: 10, padding: '14px 20px', minWidth: 150 }}>
						<div style={{ fontSize: 12, color: '#8888a4', marginBottom: 4 }}>正解</div>
						<div style={{ fontSize: 28, fontWeight: 800, color: '#4ade80' }}>{correctCount}<span style={{ fontSize: 14, fontWeight: 400, color: '#8888a4' }}> / {totalQuestions}</span></div>
					</div>
					<div style={{ background: '#1e1e2e', border: '1px solid #2a2a42', borderRadius: 10, padding: '14px 20px', minWidth: 150 }}>
						<div style={{ fontSize: 12, color: '#8888a4', marginBottom: 4 }}>不正解</div>
						<div style={{ fontSize: 28, fontWeight: 800, color: '#f87171' }}>{totalQuestions - correctCount}<span style={{ fontSize: 14, fontWeight: 400, color: '#8888a4' }}> / {totalQuestions}</span></div>
					</div>
				</div>
			</div>

			<div style={{ display: 'flex', gap: 12, justifyContent: 'center', flexWrap: 'wrap' }}>
				<a href={`/review/${deckId}?mode=exam`} style={{ display: 'inline-flex', alignItems: 'center', gap: 8, padding: '14px 28px', borderRadius: 10, textDecoration: 'none', fontWeight: 700, fontSize: 15, background: '#6366f1', color: '#fff' }}>
					<ArrowClockwise size={18} weight="bold" /> もう1回受験する
				</a>
				<a href="/" style={{ display: 'inline-flex', alignItems: 'center', gap: 8, padding: '14px 28px', borderRadius: 10, textDecoration: 'none', fontWeight: 700, fontSize: 15, background: '#1e1e2e', color: '#e4e4ed', border: '1px solid #2a2a42' }}>
					<House size={18} weight="bold" /> デッキ一覧に戻る
				</a>
			</div>
		</div>
	)
}

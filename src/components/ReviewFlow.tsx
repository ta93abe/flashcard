import { useState, useCallback, useMemo } from 'react'
import { Surface, Button, Badge, Text, Meter } from '@cloudflare/kumo'
import { ArrowLeft, Check, X, ArrowRight, BookOpenText } from '@phosphor-icons/react'
import { marked } from 'marked'

interface Card {
	id: string
	type: string
	question: string
	explanation: string | null
	source_url: string | null
}

interface Option {
	id: string
	position: number
	label: string | null
	body: string
	group_name: string | null
}

interface Answer {
	id: string
	option_id: string | null
}

interface ReviewFlowProps {
	deckId: string
	deckName: string
	card: Card
	options: Option[]
	answers: Answer[]
	topicName: string | null
	progressCurrent: number
	progressTotal: number
}

type Phase = 'answering' | 'result' | 'rating'

const RATINGS = [
	{ n: 0, label: '全くわからない', color: '#f87171' },
	{ n: 1, label: 'かなり難しい', color: '#fb923c' },
	{ n: 2, label: '迷って不正解', color: '#fbbf24' },
	{ n: 3, label: '迷ったが正解', color: '#a3e635' },
	{ n: 4, label: '少し迷った', color: '#4ade80' },
	{ n: 5, label: '完璧', color: '#22d3ee' },
] as const

export function ReviewFlow({
	deckId, deckName, card, options, answers, topicName,
	progressCurrent, progressTotal,
}: ReviewFlowProps) {
	const [phase, setPhase] = useState<Phase>('answering')
	const [selected, setSelected] = useState<number[]>([])
	const [isCorrect, setIsCorrect] = useState(false)
	const [isSubmitting, setIsSubmitting] = useState(false)

	const isMulti = card.type === 'multi_select' || card.type === 'domc'
	const hasOptions = options.filter(o => !o.group_name).length > 0
	const correctPositions = answers
		.filter(a => a.option_id)
		.map(a => {
			const opt = options.find(o => o.id === a.option_id)
			return opt ? opt.position : -1
		})
		.filter(p => p >= 0)

	const toggleOption = useCallback((pos: number) => {
		if (phase !== 'answering') return
		if (isMulti) {
			setSelected(prev =>
				prev.includes(pos) ? prev.filter(p => p !== pos) : [...prev, pos]
			)
		} else {
			setSelected([pos])
		}
	}, [phase, isMulti])

	const submit = useCallback(() => {
		if (!hasOptions) {
			// 選択肢なしカードは解説表示のみ
			setIsCorrect(true)
			setPhase('result')
			return
		}
		const sortedSel = [...selected].sort()
		const sortedCorr = [...correctPositions].sort()
		const correct = sortedSel.length === sortedCorr.length &&
			sortedSel.every((v, i) => v === sortedCorr[i])
		setIsCorrect(correct)
		setPhase('result')
	}, [selected, correctPositions, hasOptions])

	const rate = useCallback(async (quality: number) => {
		setIsSubmitting(true)
		try {
			await fetch('/api/review/answer', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: card.id, quality }),
			})
			window.location.href = `/review/${deckId}`
		} catch {
			setIsSubmitting(false)
		}
	}, [card.id, deckId])

	const progressPct = progressTotal > 0 ? Math.round((progressCurrent / progressTotal) * 100) : 0

	return (
		<div className="fade-in">
			{/* Header */}
			<div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 20 }}>
				<a href="/" style={{ color: 'var(--kumo-color-text-subtle)', textDecoration: 'none', fontSize: 14, display: 'flex', alignItems: 'center', gap: 4 }}>
					<ArrowLeft size={14} /> デッキ一覧
				</a>
				<Text style={{ fontSize: 13, color: 'var(--kumo-color-text-subtle)' }}>
					{progressCurrent} / {progressTotal}
				</Text>
			</div>

			{/* Progress */}
			<div style={{ marginBottom: 28 }}>
				<Meter value={progressPct} />
			</div>

			{/* Topic & type tags */}
			<div style={{ display: 'flex', gap: 8, marginBottom: 16, flexWrap: 'wrap' }}>
				{topicName && <Badge color="blue">{topicName}</Badge>}
				<Badge color="gray">{card.type.replace('_', ' ')}</Badge>
			</div>

			{/* Question */}
			<Surface style={{ padding: 28, marginBottom: 24 }}>
				<div
					className="prose" style={{ fontSize: 16, lineHeight: 1.8 }}
					dangerouslySetInnerHTML={{ __html: formatQuestion(card.question, card.type) }}
				/>
			</Surface>

			{/* Options */}
			{options.filter(o => !o.group_name).length === 0 && phase === 'answering' && (
				<div style={{ textAlign: 'center', padding: '20px 0', marginBottom: 24 }}>
					<Text style={{ color: 'var(--kumo-color-text-subtle)', fontSize: 14, display: 'block', marginBottom: 12 }}>
						考えがまとまったら答えを確認しましょう
					</Text>
				</div>
			)}
			<div style={{ display: 'flex', flexDirection: 'column', gap: 10, marginBottom: 24 }}>
				{options
					.filter(o => !o.group_name)
					.map(o => {
						const isSelected = selected.includes(o.position)
						const showResult = phase !== 'answering'
						const isAnswer = correctPositions.includes(o.position)
						const wasSelected = selected.includes(o.position)

						let className = 'option-btn'
						if (isSelected && !showResult) className += ' selected'
						if (showResult && isAnswer) className += ' correct'
						if (showResult && wasSelected && !isAnswer) className += ' incorrect'

						return (
							<button
								key={o.id}
								className={className}
								onClick={() => toggleOption(o.position)}
								disabled={phase !== 'answering'}
							>
								<span className={`option-label${showResult && isAnswer ? ' correct' : ''}${showResult && wasSelected && !isAnswer ? ' incorrect' : ''}${isSelected && !showResult ? ' selected' : ''}`}>
									{o.label || String.fromCharCode(65 + o.position)}
								</span>
								<span className="option-body">{o.body}</span>
								{showResult && isAnswer && (
									<span className="result-icon"><Check size={18} weight="bold" color="#4ade80" /></span>
								)}
								{showResult && wasSelected && !isAnswer && (
									<span className="result-icon"><X size={18} weight="bold" color="#f87171" /></span>
								)}
							</button>
						)
					})}
			</div>

			{/* Submit */}
			{phase === 'answering' && (
				<Button
					style={{ width: '100%' }}
					onClick={submit}
					disabled={hasOptions && selected.length === 0}
				>
					{hasOptions ? '回答する' : '答えを見る'}
				</Button>
			)}

			{/* Result + Explanation */}
			{phase === 'result' && (
				<div className="fade-in">
					{/* Result banner */}
					<Surface
						style={{
							padding: '14px 18px',
							marginBottom: 16,
							display: 'flex',
							alignItems: 'center',
							gap: 10,
							border: `1px solid ${isCorrect ? '#4ade80' : '#f87171'}`,
							background: isCorrect ? 'rgba(74,222,128,0.08)' : 'rgba(248,113,113,0.08)',
						}}
					>
						{isCorrect
							? <><Check size={22} weight="bold" color="#4ade80" /><Text style={{ fontWeight: 600, color: '#4ade80' }}>正解!</Text></>
							: <><X size={22} weight="bold" color="#f87171" /><Text style={{ fontWeight: 600, color: '#f87171' }}>不正解</Text></>
						}
					</Surface>

					{/* Explanation */}
					{card.explanation && (
						<Surface style={{ padding: 24, marginBottom: 24 }}>
							<Text style={{ fontSize: 12, color: 'var(--kumo-color-text-subtle)', textTransform: 'uppercase', letterSpacing: '0.06em', marginBottom: 12, display: 'block' }}>
								解説
							</Text>
							<div
								className="prose" style={{ fontSize: 14, lineHeight: 1.8 }}
								dangerouslySetInnerHTML={{ __html: formatExplanation(card.explanation) }}
							/>
							{card.source_url && (
								<a href={card.source_url} target="_blank" rel="noopener"
									style={{ display: 'inline-flex', alignItems: 'center', gap: 4, marginTop: 12, fontSize: 12, color: 'var(--kumo-color-text-link)' }}
								>
									<BookOpenText size={14} /> 公式ドキュメント
								</a>
							)}
						</Surface>
					)}

					{/* Rating */}
					<div style={{ textAlign: 'center', marginBottom: 16 }}>
						<Text style={{ fontSize: 14, color: 'var(--kumo-color-text-subtle)' }}>
							理解度を評価してください
						</Text>
					</div>
					<div className="rating-grid">
						{RATINGS.map(r => (
							<button
								key={r.n}
								className="rating-btn"
								onClick={() => rate(r.n)}
								disabled={isSubmitting}
							>
								<span className="rating-num" style={{ color: r.color }}>{r.n}</span>
								<span className="rating-label">{r.label}</span>
							</button>
						))}
					</div>
				</div>
			)}
		</div>
	)
}

export function ReviewEmpty({ deckId, deckName }: { deckId: string; deckName: string }) {
	return (
		<div style={{ textAlign: 'center', padding: '80px 20px' }} className="fade-in">
			<div style={{ fontSize: 48, marginBottom: 16 }}>&#127881;</div>
			<Text style={{ fontSize: 20, fontWeight: 700, display: 'block', marginBottom: 8 }}>
				すべて完了!
			</Text>
			<Text style={{ color: 'var(--kumo-color-text-subtle)', display: 'block', marginBottom: 24 }}>
				復習が必要なカードはありません。<br />新しいカードで学習を始めましょう。
			</Text>
			<Button onClick={() => window.location.href = `/review/${deckId}?mode=new`}>
				<ArrowRight size={16} /> 新しいカードで学習
			</Button>
		</div>
	)
}

function formatQuestion(text: string, type: string): string {
	let cleaned = text
	// Remove option lines for select types (they're rendered separately)
	if (type.includes('select') || type === 'domc') {
		cleaned = cleaned.replace(/^- [A-Z]\.\s+.*/gm, '')
	}
	return marked.parse(cleaned, { async: false }) as string
}

function formatExplanation(text: string): string {
	const cleaned = text
		.replace(/\*\*正解:.+?\*\*/g, '')
		.replace(/📖\s*\[.+?\]\(.+?\)/g, '')
		.replace(/<!--SR:.+?-->/g, '')
		.replace(/^\n+/, '')
	return marked.parse(cleaned, { async: false }) as string
}

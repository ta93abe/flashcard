import { useState, useCallback } from 'react'
import { Surface, Text } from '@cloudflare/kumo'
import { ArrowLeft, Check, X, ArrowRight, BookOpenText, Flag } from '@phosphor-icons/react'
import { MatchingGame } from './MatchingGame'
import { OrderingGame } from './OrderingGame'

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
	explanation: string | null
}

interface Answer {
	id: string
	option_id: string | null
	sort_order: number | null
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
	questionHtml: string
	explanationHtml: string
	nextUrl?: string
	isExamMode?: boolean
}

type Phase = 'answering' | 'result'

export function ReviewFlow({
	deckId, deckName, card, options, answers, topicName,
	progressCurrent, progressTotal, questionHtml, explanationHtml,
	nextUrl, isExamMode,
}: ReviewFlowProps) {
	const [phase, setPhase] = useState<Phase>('answering')
	const [selected, setSelected] = useState<number[]>([])
	const [isCorrect, setIsCorrect] = useState(false)
	const [flagged, setFlagged] = useState(false)

	const isMulti = card.type === 'multi_select' || card.type === 'domc'
	const isMatching = card.type === 'matching'
	const isOrdering = card.type === 'ordering'
	const isSpecialType = isMatching || isOrdering
	const selectOptions = options.filter(o => !o.group_name)
	const hasOptions = selectOptions.length > 0
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
			setSelected(prev => prev.includes(pos) ? prev.filter(p => p !== pos) : [...prev, pos])
		} else {
			setSelected([pos])
		}
	}, [phase, isMulti])

	// 回答を自動記録して次へ進む
	const recordAndNext = useCallback(async (correct: boolean) => {
		setIsCorrect(correct)
		setPhase('result')
		// quality: 正解=4, 不正解=1 でSM-2に記録
		await fetch('/api/review/answer', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ card_id: card.id, quality: correct ? 4 : 1 }),
		}).catch(() => {})
	}, [card.id])

	const submit = useCallback(() => {
		if (!hasOptions && !isSpecialType) {
			recordAndNext(true)
			return
		}
		const sortedSel = [...selected].sort()
		const sortedCorr = [...correctPositions].sort()
		const correct = sortedSel.length === sortedCorr.length &&
			sortedSel.every((v, i) => v === sortedCorr[i])
		recordAndNext(correct)
	}, [selected, correctPositions, hasOptions, isSpecialType, recordAndNext])

	const goNext = useCallback(() => {
		window.location.href = nextUrl || `/review/${deckId}`
	}, [nextUrl, deckId])

	const flagCard = useCallback(async () => {
		setFlagged(true)
		await fetch('/api/feedback', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ card_id: card.id, type: 'ambiguous', comment: 'ユーザーが問題に問題ありとフラグ' }),
		})
	}, [card.id])

	const progressPct = progressTotal > 0 ? Math.round((progressCurrent / progressTotal) * 100) : 0

	return (
		<div className="fade-in">
			{/* Header */}
			<div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: 20 }}>
				<a href="/" style={{ color: '#9ca3af', textDecoration: 'none', fontSize: 14, display: 'flex', alignItems: 'center', gap: 4 }}>
					<ArrowLeft size={14} /> デッキ一覧
				</a>
				<span style={{ fontSize: 13, color: '#9ca3af' }}>
					{isExamMode && <span style={{ marginRight: 8, color: '#fbbf24', fontWeight: 600 }}>模擬試験</span>}
					{progressCurrent + 1} / {progressTotal}
				</span>
			</div>

			{/* Progress */}
			<div className="progress-bar" style={{ marginBottom: 24 }}>
				<div className="progress-fill" style={{ width: `${progressPct}%` }} />
			</div>

			{/* Topic & type tags */}
			<div style={{ display: 'flex', gap: 8, marginBottom: 16, flexWrap: 'wrap' }}>
				{topicName && <span className="tag tag-purple">{topicName}</span>}
				<span className="tag tag-gray">{card.type.replace('_', ' ')}</span>
			</div>

			{/* Question */}
			<Surface style={{ padding: 28, marginBottom: 24 }}>
				<div className="prose" style={{ fontSize: 16, lineHeight: 1.8 }}
					dangerouslySetInnerHTML={{ __html: questionHtml }}
				/>
			</Surface>

			{/* Matching */}
			{isMatching && (
				<div style={{ marginBottom: 24 }}>
					<MatchingGame options={options} answers={answers} onComplete={recordAndNext} disabled={phase !== 'answering'} />
				</div>
			)}

			{/* Ordering */}
			{isOrdering && (
				<div style={{ marginBottom: 24 }}>
					<OrderingGame options={selectOptions} answers={answers} onComplete={recordAndNext} disabled={phase !== 'answering'} />
				</div>
			)}

			{/* Select options */}
			{!isSpecialType && hasOptions && (
				<div>
					{isMulti && phase === 'answering' && (
						<p className="select-hint">複数選択してください（チェックボックス）</p>
					)}
					<div style={{ display: 'flex', flexDirection: 'column', gap: 10, marginBottom: 24 }}>
						{selectOptions.map(o => {
							const isSel = selected.includes(o.position)
							const showRes = phase !== 'answering'
							const isAns = correctPositions.includes(o.position)
							const wasSel = selected.includes(o.position)
							let cls = 'option-btn'
							if (isSel && !showRes) cls += ' selected'
							if (showRes && isAns) cls += ' correct'
							if (showRes && wasSel && !isAns) cls += ' incorrect'
							return (
								<button key={o.id} className={cls} onClick={() => toggleOption(o.position)} disabled={phase !== 'answering'}>
									<span className={`option-indicator ${isMulti ? 'checkbox' : 'radio'}${isSel && !showRes ? ' selected' : ''}${showRes && isAns ? ' correct' : ''}${showRes && wasSel && !isAns ? ' incorrect' : ''}`}>
										{showRes && isAns && <Check size={12} weight="bold" />}
										{showRes && wasSel && !isAns && <X size={12} weight="bold" />}
										{!showRes && isSel && (isMulti ? <Check size={12} weight="bold" /> : <span className="radio-dot" />)}
									</span>
									<span className="option-content">
										<span className="option-body" dangerouslySetInnerHTML={{ __html: o.body.replace(/`([^`]+)`/g, '<code>$1</code>') }} />
										{showRes && o.explanation && (
											<span className={`option-explanation ${isAns ? 'correct' : 'incorrect'}`}>
												{o.explanation}
											</span>
										)}
									</span>
								</button>
							)
						})}
					</div>
				</div>
			)}

			{/* No options prompt */}
			{!isSpecialType && !hasOptions && phase === 'answering' && (
				<div style={{ textAlign: 'center', padding: '20px 0', marginBottom: 24 }}>
					<p style={{ color: '#9ca3af', fontSize: 14 }}>考えがまとまったら答えを確認しましょう</p>
				</div>
			)}

			{/* Submit (select系のみ) */}
			{phase === 'answering' && !isSpecialType && (
				<button className="submit-btn" onClick={submit} disabled={hasOptions && selected.length === 0}>
					{hasOptions ? '回答する' : '答えを見る'}
				</button>
			)}

			{/* Result */}
			{phase === 'result' && (
				<div className="flip-container">
					<div className="flip-card">
						{/* Result banner */}
						<div className={`result-banner ${isCorrect ? 'correct' : 'incorrect'}`}>
							{isCorrect
								? <><Check size={22} weight="bold" color="#4ade80" /><span>正解!</span></>
								: <><X size={22} weight="bold" color="#f87171" /><span>不正解</span></>
							}
						</div>

						{/* Explanation */}
						{card.explanation && (
							<div className="explanation-box">
								<div className="explanation-label">解説</div>
								<div className="prose" style={{ fontSize: 14, lineHeight: 1.8 }}
									dangerouslySetInnerHTML={{ __html: explanationHtml }}
								/>
								<div style={{ display: 'flex', alignItems: 'center', gap: 16, marginTop: 12 }}>
									{card.source_url && (
										<a href={card.source_url} target="_blank" rel="noopener" className="source-link">
											<BookOpenText size={14} /> 公式ドキュメント
										</a>
									)}
									<button onClick={flagCard} disabled={flagged} className="flag-btn">
										<Flag size={14} weight={flagged ? 'fill' : 'regular'} />
										{flagged ? '報告済み' : '問題を報告'}
									</button>
								</div>
							</div>
						)}

						{/* Next button */}
						<button className="submit-btn next-btn" onClick={goNext}>
							次の問題へ <ArrowRight size={16} weight="bold" />
						</button>
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
			<h2 style={{ fontSize: 20, fontWeight: 700, marginBottom: 8 }}>すべて完了!</h2>
			<p style={{ color: '#9ca3af', marginBottom: 24 }}>
				復習が必要なカードはありません。<br />新しいカードで学習を始めましょう。
			</p>
			<a href={`/review/${deckId}?mode=new`} className="submit-btn" style={{ display: 'inline-flex', alignItems: 'center', gap: 8, textDecoration: 'none' }}>
				<ArrowRight size={16} /> 新しいカードで学習
			</a>
		</div>
	)
}

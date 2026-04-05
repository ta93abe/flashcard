import { useState, useRef, useCallback, useEffect } from 'react'

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
	sort_order: number | null
}

interface Match {
	leftPos: number
	rightPos: number
}

interface MatchingGameProps {
	options: Option[]
	answers: Answer[]
	onComplete: (isCorrect: boolean) => void
	disabled: boolean
}

export function MatchingGame({ options, answers, onComplete, disabled }: MatchingGameProps) {
	const leftItems = options.filter(o => o.group_name === 'left')
	const rightItems = options.filter(o => o.group_name === 'right')

	const [matches, setMatches] = useState<Match[]>([])
	const [selectedLeft, setSelectedLeft] = useState<number | null>(null)
	const [hoveredRight, setHoveredRight] = useState<number | null>(null)
	const [showResult, setShowResult] = useState(false)
	const [correctMatches, setCorrectMatches] = useState<Set<string>>(new Set())

	const containerRef = useRef<HTMLDivElement>(null)
	const leftRefs = useRef<Map<number, HTMLDivElement>>(new Map())
	const rightRefs = useRef<Map<number, HTMLDivElement>>(new Map())
	const [linePositions, setLinePositions] = useState<{ x1: number; y1: number; x2: number; y2: number; key: string; correct?: boolean; incorrect?: boolean }[]>([])

	const updateLines = useCallback(() => {
		if (!containerRef.current) return
		const containerRect = containerRef.current.getBoundingClientRect()
		const lines = matches.map(m => {
			const leftEl = leftRefs.current.get(m.leftPos)
			const rightEl = rightRefs.current.get(m.rightPos)
			if (!leftEl || !rightEl) return null
			const leftRect = leftEl.getBoundingClientRect()
			const rightRect = rightEl.getBoundingClientRect()
			const key = `${m.leftPos}-${m.rightPos}`
			return {
				x1: leftRect.right - containerRect.left,
				y1: leftRect.top + leftRect.height / 2 - containerRect.top,
				x2: rightRect.left - containerRect.left,
				y2: rightRect.top + rightRect.height / 2 - containerRect.top,
				key,
				correct: showResult ? correctMatches.has(key) : undefined,
				incorrect: showResult ? !correctMatches.has(key) : undefined,
			}
		}).filter(Boolean) as typeof linePositions
		setLinePositions(lines)
	}, [matches, showResult, correctMatches])

	useEffect(() => {
		updateLines()
		window.addEventListener('resize', updateLines)
		return () => window.removeEventListener('resize', updateLines)
	}, [updateLines])

	const handleLeftClick = (pos: number) => {
		if (disabled || showResult) return
		// すでにマッチ済みなら解除
		const existing = matches.find(m => m.leftPos === pos)
		if (existing) {
			setMatches(prev => prev.filter(m => m.leftPos !== pos))
			setSelectedLeft(null)
			return
		}
		setSelectedLeft(pos)
	}

	const handleRightClick = (pos: number) => {
		if (disabled || showResult || selectedLeft === null) return
		// すでにこの右側がマッチ済みなら解除して新しく繋ぐ
		setMatches(prev => {
			const filtered = prev.filter(m => m.leftPos !== selectedLeft && m.rightPos !== pos)
			return [...filtered, { leftPos: selectedLeft, rightPos: pos }]
		})
		setSelectedLeft(null)
	}

	const handleSubmit = () => {
		// 正解チェック
		// answers: option_id=左側ID, sort_order=右側リスト内のインデックス(0始まり)
		// matches: leftPos=左側position, rightPos=右側position(全体のposition)
		// rightItemsの並び順でsort_orderを右側positionに変換する
		const correctSet = new Set<string>()
		for (const ans of answers) {
			if (ans.option_id && ans.sort_order !== null) {
				const leftOpt = options.find(o => o.id === ans.option_id)
				const rightOpt = rightItems[ans.sort_order]
				if (leftOpt && rightOpt) {
					correctSet.add(`${leftOpt.position}-${rightOpt.position}`)
				}
			}
		}
		setCorrectMatches(correctSet)
		setShowResult(true)

		const allCorrect = matches.length === leftItems.length &&
			matches.every(m => correctSet.has(`${m.leftPos}-${m.rightPos}`))
		setTimeout(() => onComplete(allCorrect), 100)
	}

	const allMatched = matches.length === leftItems.length

	return (
		<div>
			<div ref={containerRef} className="matching-container">
				<svg className="matching-lines" style={{ position: 'absolute', top: 0, left: 0, width: '100%', height: '100%', pointerEvents: 'none', zIndex: 1 }}>
					{linePositions.map(line => (
						<line
							key={line.key}
							x1={line.x1} y1={line.y1}
							x2={line.x2} y2={line.y2}
							stroke={line.correct ? '#4ade80' : line.incorrect ? '#f87171' : '#6366f1'}
							strokeWidth={3}
							strokeLinecap="round"
							style={{ transition: 'stroke 0.3s' }}
						/>
					))}
					{/* ホバー中の仮線 */}
					{selectedLeft !== null && hoveredRight !== null && (() => {
						const leftEl = leftRefs.current.get(selectedLeft)
						const rightEl = rightRefs.current.get(hoveredRight)
						if (!leftEl || !rightEl || !containerRef.current) return null
						const cr = containerRef.current.getBoundingClientRect()
						const lr = leftEl.getBoundingClientRect()
						const rr = rightEl.getBoundingClientRect()
						return (
							<line
								x1={lr.right - cr.left} y1={lr.top + lr.height / 2 - cr.top}
								x2={rr.left - cr.left} y2={rr.top + rr.height / 2 - cr.top}
								stroke="#6366f1"
								strokeWidth={2}
								strokeDasharray="6 4"
								strokeLinecap="round"
								opacity={0.5}
							/>
						)
					})()}
				</svg>

				<div className="matching-col">
					<div className="matching-col-label">項目</div>
					{leftItems.map(item => {
						const isSelected = selectedLeft === item.position
						const isMatched = matches.some(m => m.leftPos === item.position)
						const matchKey = matches.find(m => m.leftPos === item.position)
						const isCorrectMatch = matchKey && showResult && correctMatches.has(`${matchKey.leftPos}-${matchKey.rightPos}`)
						const isIncorrectMatch = matchKey && showResult && !correctMatches.has(`${matchKey.leftPos}-${matchKey.rightPos}`)

						return (
							<div
								key={item.id}
								ref={el => { if (el) leftRefs.current.set(item.position, el) }}
								className={`matching-item matching-left ${isSelected ? 'active' : ''} ${isMatched ? 'matched' : ''} ${isCorrectMatch ? 'correct' : ''} ${isIncorrectMatch ? 'incorrect' : ''}`}
								onClick={() => handleLeftClick(item.position)}
							>
								<span className="matching-label">{item.label || String(item.position + 1)}</span>
								<span dangerouslySetInnerHTML={{ __html: item.body.replace(/`([^`]+)`/g, '<code>$1</code>') }} />
								{isMatched && <span className="matching-dot" />}
							</div>
						)
					})}
				</div>

				<div className="matching-gap" />

				<div className="matching-col">
					<div className="matching-col-label">対応</div>
					{rightItems.map(item => {
						const isMatched = matches.some(m => m.rightPos === item.position)
						const matchKey = matches.find(m => m.rightPos === item.position)
						const isCorrectMatch = matchKey && showResult && correctMatches.has(`${matchKey.leftPos}-${matchKey.rightPos}`)
						const isIncorrectMatch = matchKey && showResult && !correctMatches.has(`${matchKey.leftPos}-${matchKey.rightPos}`)

						return (
							<div
								key={item.id}
								ref={el => { if (el) rightRefs.current.set(item.position, el) }}
								className={`matching-item matching-right ${selectedLeft !== null ? 'hoverable' : ''} ${isMatched ? 'matched' : ''} ${isCorrectMatch ? 'correct' : ''} ${isIncorrectMatch ? 'incorrect' : ''}`}
								onClick={() => handleRightClick(item.position)}
								onMouseEnter={() => selectedLeft !== null && setHoveredRight(item.position)}
								onMouseLeave={() => setHoveredRight(null)}
							>
								<span className="matching-dot-left" />
								<span className="matching-label">{item.label || String.fromCharCode(97 + item.position)}</span>
								<span dangerouslySetInnerHTML={{ __html: item.body.replace(/`([^`]+)`/g, '<code>$1</code>') }} />
							</div>
						)
					})}
				</div>
			</div>

			{!showResult && (
				<button
					className="submit-btn"
					onClick={handleSubmit}
					disabled={!allMatched}
					style={{ marginTop: 16 }}
				>
					回答する
				</button>
			)}
		</div>
	)
}

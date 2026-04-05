import { useState, useRef, useCallback, useEffect } from 'react'

interface OrderingGameProps {
	options: { id: string; position: number; label: string | null; body: string }[]
	answers: { option_id: string | null; sort_order: number | null }[]
	onComplete: (isCorrect: boolean) => void
	disabled: boolean
}

export function OrderingGame({ options, answers, onComplete, disabled }: OrderingGameProps) {
	const [items, setItems] = useState(() => {
		const shuffled = [...options]
		for (let i = shuffled.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1))
			;[shuffled[i], shuffled[j]] = [shuffled[j], shuffled[i]]
		}
		return shuffled
	})

	const [dragIndex, setDragIndex] = useState<number | null>(null)
	const [overIndex, setOverIndex] = useState<number | null>(null)
	const [showResult, setShowResult] = useState(false)
	const [resultMap, setResultMap] = useState<Map<string, boolean>>(new Map())
	const touchState = useRef<{ idx: number; startY: number; clone: HTMLElement | null; el: HTMLElement | null } | null>(null)
	const itemRefs = useRef<Map<number, HTMLDivElement>>(new Map())

	const handleDragStart = (e: React.DragEvent, idx: number) => {
		if (disabled || showResult) return
		e.dataTransfer.effectAllowed = 'move'
		e.dataTransfer.setData('text/plain', String(idx))
		setDragIndex(idx)
	}

	const handleDragOver = (e: React.DragEvent, idx: number) => {
		e.preventDefault()
		setOverIndex(idx)
	}

	const handleDrop = (e: React.DragEvent, dropIdx: number) => {
		e.preventDefault()
		const from = parseInt(e.dataTransfer.getData('text/plain'))
		if (!isNaN(from) && from !== dropIdx) {
			setItems(prev => {
				const next = [...prev]
				const [moved] = next.splice(from, 1)
				next.splice(dropIdx, 0, moved)
				return next
			})
		}
		setDragIndex(null)
		setOverIndex(null)
	}

	const handleTouchStart = (e: React.TouchEvent, idx: number) => {
		if (disabled || showResult) return
		const touch = e.touches[0]
		const el = e.currentTarget as HTMLElement
		const clone = el.cloneNode(true) as HTMLElement
		clone.style.cssText = `position:fixed;left:${el.getBoundingClientRect().left}px;top:${touch.clientY - el.offsetHeight / 2}px;width:${el.offsetWidth}px;z-index:9999;opacity:0.9;box-shadow:0 8px 32px rgba(0,0,0,0.4);border-color:#6366f1;background:rgba(99,102,241,0.15);pointer-events:none;`
		document.body.appendChild(clone)
		el.style.opacity = '0.3'
		touchState.current = { idx, startY: touch.clientY, clone, el }
		setDragIndex(idx)
	}

	const handleTouchMove = (e: React.TouchEvent) => {
		if (!touchState.current) return
		e.preventDefault()
		const y = e.touches[0].clientY
		if (touchState.current.clone) {
			touchState.current.clone.style.top = `${y - (touchState.current.el?.offsetHeight || 0) / 2}px`
		}
		let over = touchState.current.idx
		itemRefs.current.forEach((el, i) => {
			const r = el.getBoundingClientRect()
			if (y >= r.top && y <= r.bottom) over = i
		})
		setOverIndex(over)
	}

	const handleTouchEnd = () => {
		if (!touchState.current) return
		const { idx, clone, el } = touchState.current
		if (clone?.parentNode) clone.parentNode.removeChild(clone)
		if (el) el.style.opacity = '1'
		if (overIndex !== null && idx !== overIndex) {
			setItems(prev => {
				const next = [...prev]
				const [moved] = next.splice(idx, 1)
				next.splice(overIndex, 0, moved)
				return next
			})
		}
		touchState.current = null
		setDragIndex(null)
		setOverIndex(null)
	}

	useEffect(() => {
		return () => { if (touchState.current?.clone?.parentNode) touchState.current.clone.parentNode.removeChild(touchState.current.clone) }
	}, [])

	const handleSubmit = () => {
		const correctOrder = new Map<string, number>()
		for (const a of answers) {
			if (a.option_id && a.sort_order !== null) correctOrder.set(a.option_id, a.sort_order)
		}
		const results = new Map<string, boolean>()
		let allCorrect = true
		items.forEach((item, i) => {
			const ok = correctOrder.get(item.id) === i
			results.set(item.id, ok)
			if (!ok) allCorrect = false
		})
		setResultMap(results)
		setShowResult(true)
		setTimeout(() => onComplete(allCorrect), 100)
	}

	return (
		<div>
			<div className="ordering-label">ドラッグして正しい順番に並べ替えてください</div>
			<div className="ordering-list">
				{items.map((item, i) => (
					<div
						key={item.id}
						ref={el => { if (el) itemRefs.current.set(i, el) }}
						className={`ordering-item${dragIndex === i ? ' dragging' : ''}${overIndex === i && dragIndex !== i ? ' drag-over' : ''}${showResult && resultMap.get(item.id) ? ' correct' : ''}${showResult && resultMap.get(item.id) === false ? ' incorrect' : ''}`}
						draggable={!disabled && !showResult}
						onDragStart={e => handleDragStart(e, i)}
						onDragOver={e => handleDragOver(e, i)}
						onDrop={e => handleDrop(e, i)}
						onDragEnd={() => { setDragIndex(null); setOverIndex(null) }}
						onTouchStart={e => handleTouchStart(e, i)}
						onTouchMove={handleTouchMove}
						onTouchEnd={handleTouchEnd}
					>
						<span className="ordering-handle">&#8801;</span>
						<span className="ordering-number">{i + 1}</span>
						<span className="ordering-body" dangerouslySetInnerHTML={{ __html: item.body.replace(/`([^`]+)`/g, '<code>$1</code>') }} />
						{showResult && resultMap.get(item.id) && <span style={{ marginLeft: 'auto', color: '#4ade80', fontWeight: 700 }}>&#10003;</span>}
						{showResult && resultMap.get(item.id) === false && <span style={{ marginLeft: 'auto', color: '#f87171', fontWeight: 700 }}>&#10007;</span>}
					</div>
				))}
			</div>
			{!showResult && <button className="submit-btn" onClick={handleSubmit} disabled={disabled} style={{ marginTop: 16 }}>回答する</button>}
		</div>
	)
}

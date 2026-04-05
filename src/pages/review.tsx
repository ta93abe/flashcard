import type { FC } from 'hono/jsx'
import { Layout } from './layout'

interface Card {
	id: string
	type: string
	question: string
	explanation: string | null
	source_url: string | null
	topic_id: string | null
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
	text_value: string | null
	sort_order: number | null
}

interface TopicInfo {
	name: string
}

export const ReviewPage: FC<{
	deckId: string
	deckName: string
	card: Card
	options: Option[]
	answers: Answer[]
	topic: TopicInfo | null
	progress: { current: number; total: number }
}> = ({ deckId, deckName, card, options, answers, topic, progress }) => (
	<Layout title={`${deckName} — 学習`}>
		<style>{`
			.review-header {
				display: flex;
				align-items: center;
				justify-content: space-between;
				margin-bottom: 24px;
			}
			.review-header a {
				color: var(--text-muted);
				text-decoration: none;
				font-size: 14px;
				display: flex;
				align-items: center;
				gap: 4px;
			}
			.review-header a:hover { color: var(--text); }
			.progress-bar {
				width: 100%;
				height: 4px;
				background: var(--border);
				border-radius: 2px;
				margin-bottom: 28px;
				overflow: hidden;
			}
			.progress-fill {
				height: 100%;
				background: var(--accent);
				border-radius: 2px;
				transition: width 0.5s ease;
			}
			.question-card {
				background: var(--bg-card);
				border: 1px solid var(--border);
				border-radius: var(--radius);
				padding: 28px;
				margin-bottom: 24px;
				box-shadow: var(--shadow);
			}
			.question-meta {
				display: flex;
				gap: 8px;
				margin-bottom: 16px;
				flex-wrap: wrap;
			}
			.question-text {
				font-size: 16px;
				line-height: 1.8;
				white-space: pre-wrap;
			}
			.question-text code {
				font-size: 0.88em;
			}
			.options-list {
				display: flex;
				flex-direction: column;
				gap: 10px;
				margin-bottom: 24px;
			}
			.option-btn {
				display: flex;
				align-items: flex-start;
				gap: 14px;
				padding: 16px 18px;
				background: var(--bg-option);
				border: 2px solid var(--border);
				border-radius: var(--radius-sm);
				cursor: pointer;
				transition: var(--transition);
				text-align: left;
				font-size: 15px;
				color: var(--text);
				line-height: 1.6;
				width: 100%;
			}
			.option-btn:hover:not(:disabled) {
				background: var(--bg-option-hover);
				border-color: var(--border-focus);
			}
			.option-btn.selected {
				background: var(--bg-option-selected);
				border-color: var(--accent);
			}
			.option-btn.correct {
				background: var(--bg-correct);
				border-color: var(--correct);
			}
			.option-btn.incorrect {
				background: var(--bg-incorrect);
				border-color: var(--incorrect);
			}
			.option-btn:disabled {
				cursor: default;
			}
			.option-label {
				flex-shrink: 0;
				width: 28px;
				height: 28px;
				display: flex;
				align-items: center;
				justify-content: center;
				border-radius: 6px;
				font-weight: 700;
				font-size: 13px;
				background: rgba(255,255,255,0.06);
				color: var(--text-muted);
				transition: var(--transition);
			}
			.selected .option-label {
				background: var(--accent);
				color: #fff;
			}
			.correct .option-label {
				background: var(--correct);
				color: #000;
			}
			.incorrect .option-label {
				background: var(--incorrect);
				color: #fff;
			}
			.option-body {
				flex: 1;
				padding-top: 3px;
			}
			.result-icon {
				flex-shrink: 0;
				margin-left: auto;
				font-size: 18px;
				padding-top: 3px;
			}
			.explanation-box {
				background: var(--bg-card);
				border: 1px solid var(--border);
				border-radius: var(--radius);
				padding: 24px;
				margin-bottom: 24px;
				animation: fadeIn 0.3s ease-out;
			}
			.explanation-box h3 {
				font-size: 14px;
				color: var(--text-muted);
				text-transform: uppercase;
				letter-spacing: 0.06em;
				margin-bottom: 12px;
			}
			.explanation-body {
				font-size: 14px;
				line-height: 1.8;
				color: var(--text);
				white-space: pre-wrap;
			}
			.source-link {
				display: inline-block;
				margin-top: 12px;
				font-size: 12px;
				color: var(--accent);
				text-decoration: none;
			}
			.source-link:hover { text-decoration: underline; }
			.rating-section {
				animation: fadeIn 0.3s ease-out;
			}
			.rating-title {
				font-size: 14px;
				color: var(--text-muted);
				text-align: center;
				margin-bottom: 16px;
			}
			.rating-grid {
				display: grid;
				grid-template-columns: repeat(3, 1fr);
				gap: 8px;
			}
			@media (max-width: 640px) {
				.rating-grid { grid-template-columns: repeat(2, 1fr); }
			}
			.rating-btn {
				padding: 14px 8px;
				background: var(--bg-option);
				border: 1px solid var(--border);
				border-radius: var(--radius-sm);
				cursor: pointer;
				text-align: center;
				transition: var(--transition);
				color: var(--text);
			}
			.rating-btn:hover {
				background: var(--bg-option-hover);
				border-color: var(--border-focus);
			}
			.rating-btn .rating-num {
				font-size: 22px;
				font-weight: 700;
				display: block;
				margin-bottom: 4px;
			}
			.rating-btn .rating-label {
				font-size: 11px;
				color: var(--text-muted);
				display: block;
			}
			.rating-btn.r0 .rating-num { color: var(--incorrect); }
			.rating-btn.r1 .rating-num { color: #fb923c; }
			.rating-btn.r2 .rating-num { color: var(--warning); }
			.rating-btn.r3 .rating-num { color: #a3e635; }
			.rating-btn.r4 .rating-num { color: var(--correct); }
			.rating-btn.r5 .rating-num { color: #22d3ee; }

			.matching-container {
				display: grid;
				grid-template-columns: 1fr 1fr;
				gap: 12px;
				margin-bottom: 24px;
			}
			.matching-col h4 {
				font-size: 12px;
				color: var(--text-muted);
				text-transform: uppercase;
				letter-spacing: 0.06em;
				margin-bottom: 10px;
			}
			.matching-item {
				padding: 12px 14px;
				background: var(--bg-option);
				border: 2px solid var(--border);
				border-radius: var(--radius-sm);
				margin-bottom: 8px;
				font-size: 14px;
				cursor: pointer;
				transition: var(--transition);
			}
			.matching-item.selected {
				border-color: var(--accent);
				background: var(--bg-option-selected);
			}
			.matching-item.matched {
				border-color: var(--correct);
				background: var(--bg-correct);
				cursor: default;
			}
			.match-number {
				display: inline-flex;
				width: 22px; height: 22px;
				align-items: center; justify-content: center;
				background: rgba(255,255,255,0.08);
				border-radius: 4px;
				font-size: 11px;
				font-weight: 700;
				margin-right: 8px;
				color: var(--text-muted);
			}

			.empty-state {
				text-align: center;
				padding: 80px 20px;
			}
			.empty-state .emoji {
				font-size: 48px;
				margin-bottom: 16px;
			}
			.empty-state p {
				color: var(--text-muted);
				margin-bottom: 24px;
			}
		`}</style>

		<div class="review-header">
			<a href="/">&#8249; デッキ一覧</a>
			<span style="font-size: 13px; color: var(--text-muted);">
				{progress.current} / {progress.total}
			</span>
		</div>

		<div class="progress-bar">
			<div class="progress-fill" style={`width: ${Math.round((progress.current / progress.total) * 100)}%`} />
		</div>

		{topic && (
			<div class="question-meta">
				<span class="tag tag-purple">{topic.name}</span>
				<span class="tag tag-green">{card.type.replace('_', ' ')}</span>
			</div>
		)}

		<div class="question-card fade-in" id="question-card">
			<div class="question-text" id="question-text"
				dangerouslySetInnerHTML={{ __html: formatQuestion(card.question) }}
			/>
		</div>

		<div id="options-area">
			{renderOptionsForType(card, options)}
		</div>

		<div id="submit-area" style="margin-bottom: 24px;">
			<button
				class="btn btn-primary btn-block"
				id="submit-btn"
				disabled
				onclick="submitAnswer()"
			>
				回答する
			</button>
		</div>

		<div id="explanation-area" style="display: none;"></div>
		<div id="rating-area" style="display: none;"></div>

		<script dangerouslySetInnerHTML={{ __html: buildClientScript(deckId, card, options, answers) }} />
	</Layout>
)

export const ReviewEmptyPage: FC<{ deckId: string; deckName: string }> = ({ deckId, deckName }) => (
	<Layout title={`${deckName} — 学習`}>
		<div class="review-header">
			<a href="/" style="color: var(--text-muted); text-decoration: none; font-size: 14px;">
				&#8249; デッキ一覧
			</a>
		</div>
		<div class="empty-state fade-in">
			<div class="emoji">&#127881;</div>
			<h2>すべて完了!</h2>
			<p>復習が必要なカードはありません。<br/>新しいカードで学習を始めましょう。</p>
			<a href={`/review/${deckId}?mode=new`} class="btn btn-primary">新しいカードで学習</a>
		</div>
	</Layout>
)

function formatQuestion(text: string): string {
	return text
		.replace(/&/g, '&amp;')
		.replace(/</g, '&lt;')
		.replace(/>/g, '&gt;')
		.replace(/`([^`]+)`/g, '<code>$1</code>')
		.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
		.replace(/^```(\w*)\n([\s\S]*?)```$/gm, (_m, _lang, code) =>
			`<pre><code>${code}</code></pre>`
		)
		.replace(/\n- ([A-Z])\.\s*/g, '\n')  // options handled separately
		.replace(/\n/g, '<br/>')
}

function renderOptionsForType(card: Card, options: Option[]) {
	if (card.type === 'matching') {
		const left = options.filter(o => o.group_name === 'left')
		const right = options.filter(o => o.group_name === 'right')
		return (
			<div class="matching-container" id="matching-area">
				<div class="matching-col">
					<h4>項目</h4>
					{left.map(o => (
						<div class="matching-item" data-side="left" data-pos={o.position} id={`match-left-${o.position}`} onclick={`selectMatch('left', ${o.position})`}>
							<span class="match-number">{(o.label || String(o.position + 1))}</span>
							{o.body}
						</div>
					))}
				</div>
				<div class="matching-col">
					<h4>対応</h4>
					{right.map(o => (
						<div class="matching-item" data-side="right" data-pos={o.position} id={`match-right-${o.position}`} onclick={`selectMatch('right', ${o.position})`}>
							<span class="match-number">{(o.label || String(o.position + 1))}</span>
							{o.body}
						</div>
					))}
				</div>
			</div>
		)
	}

	if (card.type === 'ordering') {
		return (
			<div class="options-list" id="ordering-list">
				{options.map(o => (
					<div class="option-btn ordering-item" data-pos={o.position} id={`order-${o.position}`}
						draggable="true"
						ondragstart={`dragStart(event, ${o.position})`}
						ondragover="event.preventDefault()"
						ondrop={`dropItem(event, ${o.position})`}
					>
						<span class="option-label">{o.label || String(o.position + 1)}</span>
						<span class="option-body">{o.body}</span>
					</div>
				))}
			</div>
		)
	}

	// single_select / multi_select / domc
	const isMulti = card.type === 'multi_select' || card.type === 'domc'
	return (
		<div class="options-list" id="options-list">
			{options.map(o => (
				<button class="option-btn" data-pos={o.position} id={`opt-${o.position}`}
					onclick={`toggleOption(${o.position}, ${isMulti})`}
				>
					<span class="option-label">{o.label || String.fromCharCode(65 + o.position)}</span>
					<span class="option-body">{o.body}</span>
				</button>
			))}
		</div>
	)
}

function buildClientScript(
	deckId: string,
	card: Card,
	options: Option[],
	answers: Answer[],
): string {
	const correctOptionIds = answers
		.filter(a => a.option_id)
		.map(a => {
			const opt = options.find(o => `${card.id}-opt-${o.position}` === a.option_id)
			return opt ? opt.position : -1
		})
		.filter(p => p >= 0)

	const correctOrders = answers
		.filter(a => a.sort_order !== null)
		.map(a => {
			const opt = options.find(o => `${card.id}-opt-${(a as any).option_id?.split('-opt-')[1]}` === `${card.id}-opt-${o.position}`)
			return { optionPos: opt?.position ?? -1, sortOrder: a.sort_order }
		})

	return `
		var cardId = ${JSON.stringify(card.id)};
		var cardType = ${JSON.stringify(card.type)};
		var deckId = ${JSON.stringify(deckId)};
		var correctPositions = ${JSON.stringify(correctOptionIds)};
		var correctOrders = ${JSON.stringify(correctOrders)};
		var selectedPositions = [];
		var answered = false;
		var explanation = ${JSON.stringify(card.explanation || '')};
		var sourceUrl = ${JSON.stringify(card.source_url || '')};

		// Matching state
		var matchSelected = { left: null, right: null };
		var matches = [];

		function toggleOption(pos, multi) {
			if (answered) return;
			var btn = document.getElementById('opt-' + pos);
			if (multi) {
				var idx = selectedPositions.indexOf(pos);
				if (idx >= 0) {
					selectedPositions.splice(idx, 1);
					btn.classList.remove('selected');
				} else {
					selectedPositions.push(pos);
					btn.classList.add('selected');
				}
			} else {
				selectedPositions.forEach(function(p) {
					document.getElementById('opt-' + p).classList.remove('selected');
				});
				selectedPositions = [pos];
				btn.classList.add('selected');
			}
			document.getElementById('submit-btn').disabled = selectedPositions.length === 0;
		}

		function selectMatch(side, pos) {
			if (answered) return;
			// deselect previous
			if (matchSelected[side] !== null) {
				var prev = document.getElementById('match-' + side + '-' + matchSelected[side]);
				if (prev) prev.classList.remove('selected');
			}
			matchSelected[side] = pos;
			document.getElementById('match-' + side + '-' + pos).classList.add('selected');

			if (matchSelected.left !== null && matchSelected.right !== null) {
				// make a match
				matches.push({ left: matchSelected.left, right: matchSelected.right });
				var le = document.getElementById('match-left-' + matchSelected.left);
				var re = document.getElementById('match-right-' + matchSelected.right);
				le.classList.remove('selected');
				re.classList.remove('selected');
				le.classList.add('matched');
				re.classList.add('matched');
				le.onclick = null;
				re.onclick = null;
				matchSelected = { left: null, right: null };
				document.getElementById('submit-btn').disabled = false;
			}
		}

		// Ordering drag-and-drop
		var draggedPos = null;
		function dragStart(e, pos) {
			draggedPos = pos;
			e.dataTransfer.effectAllowed = 'move';
			document.getElementById('submit-btn').disabled = false;
		}
		function dropItem(e, targetPos) {
			e.preventDefault();
			if (draggedPos === null || draggedPos === targetPos) return;
			var list = document.getElementById('ordering-list');
			var items = Array.from(list.children);
			var draggedIdx = items.findIndex(function(el) { return el.dataset.pos == draggedPos; });
			var targetIdx = items.findIndex(function(el) { return el.dataset.pos == targetPos; });
			if (draggedIdx < targetIdx) {
				list.insertBefore(items[draggedIdx], items[targetIdx].nextSibling);
			} else {
				list.insertBefore(items[draggedIdx], items[targetIdx]);
			}
		}

		function submitAnswer() {
			if (answered) return;
			answered = true;
			document.getElementById('submit-btn').style.display = 'none';

			var isCorrect = false;

			if (cardType === 'matching') {
				// Check matches - simplified: just show result
				isCorrect = matches.length > 0;
				showExplanation(isCorrect);
			} else if (cardType === 'ordering') {
				// Check order
				isCorrect = true; // simplified
				showExplanation(isCorrect);
			} else {
				// Check selections
				var sortedSelected = selectedPositions.slice().sort();
				var sortedCorrect = correctPositions.slice().sort();
				isCorrect = sortedSelected.length === sortedCorrect.length &&
					sortedSelected.every(function(v, i) { return v === sortedCorrect[i]; });

				// Show correct/incorrect on options
				document.querySelectorAll('.option-btn').forEach(function(btn) {
					btn.disabled = true;
					var pos = parseInt(btn.dataset.pos);
					if (correctPositions.indexOf(pos) >= 0) {
						btn.classList.add('correct');
						var icon = document.createElement('span');
						icon.className = 'result-icon';
						icon.textContent = '\\u2713';
						btn.appendChild(icon);
					} else if (selectedPositions.indexOf(pos) >= 0) {
						btn.classList.add('incorrect');
						var icon = document.createElement('span');
						icon.className = 'result-icon';
						icon.textContent = '\\u2717';
						btn.appendChild(icon);
					}
				});

				showExplanation(isCorrect);
			}
		}

		function showExplanation(isCorrect) {
			var area = document.getElementById('explanation-area');
			var cleanExplanation = explanation
				.replace(/\\*\\*正解:.+?\\*\\*/g, '')
				.replace(/^\\n+/, '')
				.replace(/\\n/g, '<br/>')
				.replace(/\`([^\`]+)\`/g, '<code>$1</code>');

			var resultBanner = isCorrect
				? '<div style="background:var(--bg-correct);border:1px solid var(--correct);border-radius:var(--radius-sm);padding:14px 18px;margin-bottom:16px;display:flex;align-items:center;gap:10px;"><span style="font-size:20px;">\\u2713</span><span style="font-weight:600;color:var(--correct);">\\u6b63\\u89e3!</span></div>'
				: '<div style="background:var(--bg-incorrect);border:1px solid var(--incorrect);border-radius:var(--radius-sm);padding:14px 18px;margin-bottom:16px;display:flex;align-items:center;gap:10px;"><span style="font-size:20px;">\\u2717</span><span style="font-weight:600;color:var(--incorrect);">\\u4e0d\\u6b63\\u89e3</span></div>';

			area.innerHTML = resultBanner +
				'<div class="explanation-box">' +
				'<h3>\\u89e3\\u8aac</h3>' +
				'<div class="explanation-body">' + cleanExplanation + '</div>' +
				(sourceUrl ? '<a class="source-link" href="' + sourceUrl + '" target="_blank" rel="noopener">\\ud83d\\udcd6 \\u516c\\u5f0f\\u30c9\\u30ad\\u30e5\\u30e1\\u30f3\\u30c8</a>' : '') +
				'</div>';
			area.style.display = 'block';

			// Show rating
			var ratingArea = document.getElementById('rating-area');
			var ratings = [
				{ n: 0, label: '\\u5168\\u304f\\u308f\\u304b\\u3089\\u306a\\u3044', cls: 'r0' },
				{ n: 1, label: '\\u304b\\u306a\\u308a\\u96e3\\u3057\\u3044', cls: 'r1' },
				{ n: 2, label: '\\u8ff7\\u3063\\u305f\\u304c\\u4e0d\\u6b63\\u89e3', cls: 'r2' },
				{ n: 3, label: '\\u8ff7\\u3063\\u305f\\u304c\\u6b63\\u89e3', cls: 'r3' },
				{ n: 4, label: '\\u5c11\\u3057\\u8ff7\\u3063\\u305f', cls: 'r4' },
				{ n: 5, label: '\\u5b8c\\u74a7', cls: 'r5' },
			];
			ratingArea.innerHTML = '<div class="rating-section">' +
				'<p class="rating-title">\\u7406\\u89e3\\u5ea6\\u3092\\u8a55\\u4fa1\\u3057\\u3066\\u304f\\u3060\\u3055\\u3044</p>' +
				'<div class="rating-grid">' +
				ratings.map(function(r) {
					return '<button class="rating-btn ' + r.cls + '" onclick="rate(' + r.n + ')">' +
						'<span class="rating-num">' + r.n + '</span>' +
						'<span class="rating-label">' + r.label + '</span>' +
						'</button>';
				}).join('') +
				'</div></div>';
			ratingArea.style.display = 'block';

			// Scroll to explanation
			area.scrollIntoView({ behavior: 'smooth', block: 'start' });
		}

		function rate(quality) {
			// Disable all rating buttons
			document.querySelectorAll('.rating-btn').forEach(function(btn) { btn.disabled = true; btn.style.opacity = '0.4'; });

			fetch('/api/review/answer', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ card_id: cardId, quality: quality }),
			})
			.then(function(res) { return res.json(); })
			.then(function(data) {
				// Show next review info briefly, then navigate
				var info = document.createElement('p');
				info.style.cssText = 'text-align:center;color:var(--text-muted);font-size:13px;margin-top:16px;';
				info.textContent = '\\u6b21\\u306e\\u5fa9\\u7fd2: ' + data.next_review + ' (interval: ' + data.interval + '\\u65e5)';
				document.getElementById('rating-area').appendChild(info);

				setTimeout(function() {
					window.location.href = '/review/' + deckId;
				}, 800);
			});
		}
	`
}

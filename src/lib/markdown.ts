import { unified } from 'unified'
import remarkParse from 'remark-parse'
import remarkGfm from 'remark-gfm'
import remarkRehype from 'remark-rehype'
import rehypeShiki from '@shikijs/rehype'
import rehypeStringify from 'rehype-stringify'

let processorWithShiki: ReturnType<typeof unified> | null = null
const processorPlain = unified()
	.use(remarkParse)
	.use(remarkGfm)
	.use(remarkRehype)
	.use(rehypeStringify)

async function getProcessor() {
	if (processorWithShiki) return processorWithShiki
	try {
		processorWithShiki = unified()
			.use(remarkParse)
			.use(remarkGfm)
			.use(remarkRehype)
			.use(rehypeShiki, {
				theme: 'github-dark-default',
				langs: ['sql', 'yaml', 'python', 'bash', 'json', 'jinja', 'toml'],
			})
			.use(rehypeStringify)
		// テスト実行で初期化を検証
		await processorWithShiki.process('test')
		return processorWithShiki
	} catch {
		console.warn('Shiki initialization failed, falling back to plain markdown')
		processorWithShiki = null
		return processorPlain
	}
}

export async function renderMarkdown(md: string): Promise<string> {
	const processor = await getProcessor()
	const result = await processor.process(md)
	return String(result)
}

export function renderQuestionMarkdown(text: string, type: string): Promise<string> {
	let cleaned = text
	if (type.includes('select') || type === 'domc') {
		cleaned = cleaned.replace(/^- [A-Z]\.\s+.*/gm, '')
	}
	return renderMarkdown(cleaned)
}

export function renderExplanationMarkdown(text: string): Promise<string> {
	const cleaned = text
		.replace(/\*\*正解:.+?\*\*/g, '')
		.replace(/📖\s*\[.+?\]\(.+?\)/g, '')
		.replace(/<!--SR:.+?-->/g, '')
		.replace(/^\n+/, '')
	return renderMarkdown(cleaned)
}

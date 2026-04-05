import { unified } from 'unified'
import remarkParse from 'remark-parse'
import remarkGfm from 'remark-gfm'
import remarkRehype from 'remark-rehype'
import rehypeShiki from '@shikijs/rehype'
import rehypeStringify from 'rehype-stringify'

const processor = unified()
	.use(remarkParse)
	.use(remarkGfm)
	.use(remarkRehype)
	.use(rehypeShiki, {
		theme: 'github-dark-default',
		langs: ['sql', 'yaml', 'python', 'bash', 'json', 'jinja', 'toml'],
	})
	.use(rehypeStringify)

export async function renderMarkdown(md: string): Promise<string> {
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

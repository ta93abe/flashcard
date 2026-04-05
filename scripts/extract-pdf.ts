/**
 * PDF → テキスト抽出 → R2 にアップロード
 * Usage: npx tsx scripts/extract-pdf.ts <exam-id> <pdf-path>
 */
import { readFileSync, writeFileSync } from 'node:fs'
import { extractText } from 'unpdf'
import { execSync } from 'node:child_process'

const examId = process.argv[2]
const pdfPath = process.argv[3]

if (!examId || !pdfPath) {
	console.error('Usage: npx tsx scripts/extract-pdf.ts <exam-id> <pdf-path>')
	process.exit(1)
}

const buf = readFileSync(pdfPath)
const { text: pages } = await extractText(new Uint8Array(buf))
const fullText = Array.isArray(pages) ? pages.join('\n\n') : String(pages)

const textPath = `/tmp/${examId}-guide.txt`
writeFileSync(textPath, fullText)

console.log(`Extracted ${fullText.length} chars from ${pdfPath}`)
console.log(`Saved to ${textPath}`)

// R2にアップロード
execSync(`npx wrangler r2 object put flashcard-bucket/guides/${examId}/guide.txt --file="${textPath}" --content-type="text/plain" --remote`, { stdio: 'inherit' })

console.log(`Uploaded to R2: guides/${examId}/guide.txt`)

// D1の guide_key を更新
execSync(`npx wrangler d1 execute flashcard-db --remote --command="UPDATE exams SET guide_key = 'guides/${examId}/guide.txt' WHERE id = '${examId}';"`, { stdio: 'inherit' })

console.log('Done!')

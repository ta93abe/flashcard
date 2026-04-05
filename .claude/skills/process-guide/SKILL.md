---
name: process-guide
description: 試験ガイドPDFを解析し、構造化Markdownに変換してR2に保存する。「ガイドを処理して」「試験ガイドを解析して」のようなリクエストで使用。
argument-hint: <pdf-path> <exam-id>
allowed-tools: Read Bash Write Glob Grep
---

試験ガイドPDFを解析し、構造化Markdownの仕様書に変換する。

## 手順

1. `$0` (PDFパス) からテキストを抽出する
   ```bash
   npx tsx scripts/extract-pdf.ts $1 $0
   ```
   - exam-id が `$1` で未指定の場合、PDFファイル名から推測する

2. 抽出されたテキスト (`/tmp/$1-guide.txt`) を読み、以下の構造のMarkdownを生成する:

   ```markdown
   ## 試験概要
   - 試験名、提供元、問題数、合格ライン、試験時間

   ## 出題形式
   - 各形式を card_types のIDで分類 (single_select, multi_select, fill_blank, matching, ordering, hotspot, domc)

   ## トピック構成
   | トピック名 | 配点比率 | 主要キーワード |

   ## 学習リソース
   公式ドキュメントや推奨教材のURLを列挙
   ```

3. 生成したMarkdownを R2 に保存:
   ```bash
   npx wrangler r2 object put flashcard-bucket/specs/$1/spec.md --file=/tmp/$1-spec.md --content-type="text/markdown" --remote
   ```

4. D1 の exams テーブルを更新:
   ```bash
   npx wrangler d1 execute flashcard-db --remote --command="UPDATE exams SET spec_key = 'specs/$1/spec.md', status = 'ready' WHERE id = '$1';"
   ```

5. トピック情報を exam_topics テーブルに登録 (SQLを生成して実行)

## ルール
- PDFのテキストから**事実のみ**を抽出する。推測や追加情報を含めない
- 配点比率がPDFに記載されていない場合は均等配分とする
- exams テーブルに試験が存在しない場合は INSERT する

---
name: generate-questions
description: 試験仕様に基づいて問題を生成しD1に投入する。「問題を作って」「10問追加して」「N問生成して」のようなリクエストで使用。
argument-hint: <exam-id> [count] [topic]
allowed-tools: Read Bash Write Glob Grep
---

試験仕様 (spec) に基づいて問題を生成し、D1に投入する。

## 手順

1. 試験仕様を取得:
   ```bash
   npx wrangler r2 object get flashcard-bucket/specs/$0/spec.md --remote --file=/tmp/$0-spec.md
   ```

2. 既存の問題を確認 (重複防止):
   ```bash
   npx wrangler d1 execute flashcard-db --remote --command="SELECT question FROM cards WHERE deck_id = 'deck-$0' LIMIT 50;"
   ```

3. specとトピック構成を読み、`$1` 問 (デフォルト: 試験問題数の2倍) の問題を生成する

4. 問題は以下の形式で seeds/ にSQLファイルとして出力:
   ```sql
   INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation) VALUES (...);
   INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES (...);
   INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES (...);
   ```

5. D1に投入:
   ```bash
   npx wrangler d1 execute flashcard-db --remote --file=./seeds/generated-$0.sql
   ```

## 問題生成ルール

- **出題形式**: 試験ガイドに記載された形式のみ使用
  - single_select: 4択1正解
  - multi_select: 4-5択で正解が複数
  - matching: 左右の対応付け
  - ordering: 正しい順序に並べ替え
- **トピック配分**: specのトピック配点比率に従う
- **問題文**: Markdown可。コードブロックを活用
- **正解**: 明確に1つ (single_select) または複数 (multi_select) を特定できること
- **不正解選択肢**: もっともらしいが明確に間違いであること
- **解説**: 正解の根拠を具体的に説明
- **ID形式**: card-{exam-id}-gen-{3桁連番}, option: {card-id}-opt-{position}, answer: {card-id}-ans-{index}
- **重複防止**: 既存の問題と同じ内容を生成しない

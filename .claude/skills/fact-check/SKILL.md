---
name: fact-check
description: 問題と回答のファクトチェックを実行する。「ファクトチェックして」「問題を検証して」のようなリクエストで使用。
argument-hint: [count] [deck-id]
allowed-tools: Read Bash Write Glob Grep
---

ランダムに問題をピックアップしてファクトチェックし、結果をD1に記録する。

## 手順

1. 直近7日間にチェック済みのカードを除外して、ランダムに `$0` 問 (デフォルト: 20) ピックアップ:
   ```bash
   npx wrangler d1 execute flashcard-db --remote --json --command="SELECT c.id, c.question, c.explanation, c.type FROM cards c WHERE c.id NOT IN (SELECT card_id FROM fact_checks WHERE checked_at >= datetime('now', '-7 days')) ORDER BY RANDOM() LIMIT 20;"
   ```

2. 各カードの選択肢と正解を取得:
   ```bash
   npx wrangler d1 execute flashcard-db --remote --json --command="SELECT co.label, co.body FROM card_options co WHERE co.card_id = '{card_id}' ORDER BY position;"
   npx wrangler d1 execute flashcard-db --remote --json --command="SELECT ca.option_id, co.label, co.body FROM card_answers ca LEFT JOIN card_options co ON ca.option_id = co.id WHERE ca.card_id = '{card_id}';"
   ```

3. 問題文・選択肢・正解・解説を確認し、以下の観点で判定:
   - **factual_accuracy**: 事実の正確性
   - **answer_correctness**: 正解の妥当性
   - **clarity**: 問題文の明確さ
   - **relevance**: 試験範囲との関連性

4. 判定結果をSQLとして出力し、D1に投入:
   ```sql
   INSERT INTO fact_checks (id, card_id, verdict, confidence, reason, suggestion, action_taken, old_question, old_answer, model_used, checked_at)
   VALUES ('{uuid}', '{card_id}', '{verdict}', {confidence}, '{reason}', '{suggestion_json}', '{action}', NULL, NULL, 'claude-code', datetime('now'));
   ```

   - verdict: 'correct' | 'incorrect' | 'needs_revision'
   - confidence: 0.0-1.0
   - action_taken: 'none' (correct時), 'updated' (自動修正時), 'flagged' (要確認時)

5. incorrect で confidence >= 0.85 の場合は cards テーブルも修正し、old_question/old_answer に修正前の値を記録

6. 結果サマリーを表示

## ルール
- model_used は 'claude-code' とする
- 1回の実行で最大20問
- dbt の公式ドキュメントの知識に基づいて判定する

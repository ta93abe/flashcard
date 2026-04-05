-- Auto-generated from dbt Analytics Engineering フラッシュカード
-- Total: 320 cards across 8 topics

INSERT OR IGNORE INTO exams (id, name, provider, guide_key, total_questions, status) VALUES ('dbt-analytics-engineer', 'dbt Analytics Engineering Certification', 'dbt Labs', 'guides/dbt-analytics-engineer/guide.md', 320, 'ready');

INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-1', 'dbt-analytics-engineer', 'Developing dbt Models（モデル開発）', 0.4437, 0);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-2', 'dbt-analytics-engineer', 'Understanding dbt Model Governance（モデルガバナンス）', 0.0313, 1);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-3', 'dbt-analytics-engineer', 'Debugging Data Modeling Errors（デバッグ）', 0.1344, 2);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-4', 'dbt-analytics-engineer', 'Managing Data Pipelines（パイプライン管理）', 0.0281, 3);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-5', 'dbt-analytics-engineer', 'Implementing dbt Tests（テスト実装）', 0.1875, 4);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-6', 'dbt-analytics-engineer', 'Creating and Maintaining dbt Documentation（ドキュメント）', 0.0594, 5);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-7', 'dbt-analytics-engineer', 'External Dependencies（外部依存関係）', 0.0781, 6);
INSERT OR IGNORE INTO exam_topics (id, exam_id, name, weight, position) VALUES ('topic-dbt-ae-8', 'dbt-analytics-engineer', 'Leveraging the dbt State（State活用）', 0.0375, 7);

INSERT OR IGNORE INTO decks (id, exam_id, name, description) VALUES ('deck-dbt-ae', 'dbt-analytics-engineer', 'dbt Analytics Engineering', 'dbt Analytics Engineering 認定試験 全320問');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-001', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'incremental モデルの `on_schema_change` 設定で使用可能な値を**すべて**選べ。
- A. `ignore`
- B. `fail`
- C. `append_new_columns`
- D. `sync_all_columns`
- E. `drop_and_recreate`', '**正解: A, B, C, D**
- `ignore`（デフォルト）— スキーマ変更を無視
- `fail` — スキーマ変更時にエラー
- `append_new_columns` — 新カラムを追加（削除はしない）
- `sync_all_columns` — カラムの追加と削除を同期', 'https://docs.getdbt.com/docs/build/incremental-models#what-if-the-columns-of-my-incremental-model-change');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-001-opt-0', 'card-dbt-ae-001', 0, 'A', '`ignore`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-001-opt-1', 'card-dbt-ae-001', 1, 'B', '`fail`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-001-opt-2', 'card-dbt-ae-001', 2, 'C', '`append_new_columns`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-001-opt-3', 'card-dbt-ae-001', 3, 'D', '`sync_all_columns`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-001-opt-4', 'card-dbt-ae-001', 4, 'E', '`drop_and_recreate`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-001-ans-0', 'card-dbt-ae-001', 'card-dbt-ae-001-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-001-ans-1', 'card-dbt-ae-001', 'card-dbt-ae-001-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-001-ans-2', 'card-dbt-ae-001', 'card-dbt-ae-001-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-001-ans-3', 'card-dbt-ae-001', 'card-dbt-ae-001-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-002', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の source 定義の `identifier` の効果は？
```yaml
sources:
  - name: stripe
    tables:
      - name: payments
        identifier: stripe_payments_raw
```', '`{{ source(''stripe'', ''payments'') }}` は**DWH上の `stripe_payments_raw` テーブル**を参照する。dbt内では `payments` という名前で扱うが、実際のクエリでは `stripe_payments_raw` が使われる。', 'https://docs.getdbt.com/docs/build/sources');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-003', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-1', 'dbt パッケージのインストール手順として、以下を正しい順序に並べよ。
ステップ:
- (a) プロジェクト内でパッケージのマクロやモデルを利用
- (b) `dbt deps` コマンドを実行
- (c) `packages.yml` にパッケージを定義', '**正解: c → b → a**
1. **(c)** `packages.yml` にパッケージを定義する
2. **(b)** `dbt deps` コマンドを実行してインストール
3. **(a)** プロジェクト内でパッケージのマクロやモデルを利用可能になる', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-003-opt-0', 'card-dbt-ae-003', 0, 'a', 'プロジェクト内でパッケージのマクロやモデルを利用', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-003-opt-1', 'card-dbt-ae-003', 1, 'b', '`dbt deps` コマンドを実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-003-opt-2', 'card-dbt-ae-003', 2, 'c', '`packages.yml` にパッケージを定義', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-003-ans-0', 'card-dbt-ae-003', 'card-dbt-ae-003-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-003-ans-1', 'card-dbt-ae-003', 'card-dbt-ae-003-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-003-ans-2', 'card-dbt-ae-003', 'card-dbt-ae-003-opt-0', NULL, 2);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-004', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の Jinja for ループの問題点は？
```sql
select
{% for col in [''id'', ''name'', ''email''] %}
  {{ col }},
{% endfor %}
from {{ ref(''stg_users'') }}
```', '**最後のカラム `email` の後にもカンマが付く**ため、SQLエラーになる。
修正: `{{ col }}{% if not loop.last %},{% endif %}` とするか、ループの後に固定カラムを追加する。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-005', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各 Jinja 構文（左列）を、その用途（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `{{ }}` | a. コメント（出力されない） |
| 2. `{% %}` | b. 式の評価と出力 |
| 3. `{# #}` | c. 文（制御構造、変数定義等） |', '**1-b, 2-c, 3-a**
| 構文 | 用途 |
|---|---|
| `{{ }}` → b | **式の評価と出力**（ref, source, 変数等） |
| `{% %}` → c | **文**（if, for, set, macro 等） |
| `{# #}` → a | **コメント**（コンパイル後のSQLに出力されない） |', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-005-opt-0', 'card-dbt-ae-005', 0, '1', '{{ }}', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-005-opt-1', 'card-dbt-ae-005', 1, '2', '{% %}', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-005-opt-2', 'card-dbt-ae-005', 2, '3', '{# #}', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-005-opt-3', 'card-dbt-ae-005', 3, 'a', 'コメント（出力されない）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-005-opt-4', 'card-dbt-ae-005', 4, 'b', '式の評価と出力', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-005-opt-5', 'card-dbt-ae-005', 5, 'c', '文（制御構造、変数定義等）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-005-ans-0', 'card-dbt-ae-005', 'card-dbt-ae-005-opt-0', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-005-ans-1', 'card-dbt-ae-005', 'card-dbt-ae-005-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-005-ans-2', 'card-dbt-ae-005', 'card-dbt-ae-005-opt-2', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-006', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のマクロの呼び出し方として正しいものは？
```sql
-- macros/cents_to_dollars.sql
{% macro cents_to_dollars(column_name) %}
    ({{ column_name }} / 100)::numeric(16, 2)
{% endmacro %}
```
- A. `{{ cents_to_dollars(''amount'') }}`
- B. `{% cents_to_dollars(''amount'') %}`
- C. `{{ call cents_to_dollars(''amount'') }}`
- D. `{% call cents_to_dollars(''amount'') %}`', '**正解: A**
マクロは `{{ }}` 内で関数のように呼び出す。結果（SQL断片）がそのまま出力に展開される。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-006-opt-0', 'card-dbt-ae-006', 0, 'A', '`{{ cents_to_dollars(''amount'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-006-opt-1', 'card-dbt-ae-006', 1, 'B', '`{% cents_to_dollars(''amount'') %}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-006-opt-2', 'card-dbt-ae-006', 2, 'C', '`{{ call cents_to_dollars(''amount'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-006-opt-3', 'card-dbt-ae-006', 3, 'D', '`{% call cents_to_dollars(''amount'') %}`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-006-ans-0', 'card-dbt-ae-006', 'card-dbt-ae-006-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-007', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --exclude my_model` の効果は？
- A. `my_model` のみを実行する
- B. `my_model` を除外して他のすべてのモデルを実行する
- C. `my_model` とその下流を除外する
- D. `my_model` を削除する', '**正解: B**
`--exclude` は指定したリソースを実行対象から除外する。`--select` と組み合わせて使用可能。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-007-opt-0', 'card-dbt-ae-007', 0, 'A', '`my_model` のみを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-007-opt-1', 'card-dbt-ae-007', 1, 'B', '`my_model` を除外して他のすべてのモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-007-opt-2', 'card-dbt-ae-007', 2, 'C', '`my_model` とその下流を除外する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-007-opt-3', 'card-dbt-ae-007', 3, 'D', '`my_model` を削除する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-007-ans-0', 'card-dbt-ae-007', 'card-dbt-ae-007-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-008', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt Cloud IDE の特徴として正し**くない**ものはどれか？
- A. ブラウザベースのSQLエディタ
- B. Git統合（ブランチ、PR作成）
- C. `dbt run` をローカルPCで実行
- D. DAGの可視化', '**正解: C**
dbt Cloud IDE は**クラウド上で**dbtコマンドを実行する。ローカルPCではなくdbt Cloudのインフラで処理される。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-008-opt-0', 'card-dbt-ae-008', 0, 'A', 'ブラウザベースのSQLエディタ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-008-opt-1', 'card-dbt-ae-008', 1, 'B', 'Git統合（ブランチ、PR作成）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-008-opt-2', 'card-dbt-ae-008', 2, 'C', '`dbt run` をローカルPCで実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-008-opt-3', 'card-dbt-ae-008', 3, 'D', 'DAGの可視化', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-008-ans-0', 'card-dbt-ae-008', 'card-dbt-ae-008-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-009', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'materialized view の特徴として正しいものを**2つ**選べ。
- A. DWH側でクエリ結果をキャッシュし、自動的に更新される
- B. dbt実行時に毎回再作成される
- C. すべてのDWHプラットフォームでサポートされている
- D. ビューのパフォーマンスとテーブルの鮮度を兼ね備える', '**正解: A, D**
materialized view はDWH側で結果をキャッシュし、ソースデータの変更に応じて自動更新される。全DWHでサポートされているわけではない。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-009-opt-0', 'card-dbt-ae-009', 0, 'A', 'DWH側でクエリ結果をキャッシュし、自動的に更新される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-009-opt-1', 'card-dbt-ae-009', 1, 'B', 'dbt実行時に毎回再作成される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-009-opt-2', 'card-dbt-ae-009', 2, 'C', 'すべてのDWHプラットフォームでサポートされている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-009-opt-3', 'card-dbt-ae-009', 3, 'D', 'ビューのパフォーマンスとテーブルの鮮度を兼ね備える', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-009-ans-0', 'card-dbt-ae-009', 'card-dbt-ae-009-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-009-ans-1', 'card-dbt-ae-009', 'card-dbt-ae-009-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-010', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各モデルレイヤー（左列）を、その命名規則（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. staging | a. `dim_` |
| 2. intermediate | b. `fct_` |
| 3. marts（ファクト） | c. `int_` |
| 4. marts（ディメンション） | d. `stg_` |', '**1-d, 2-c, 3-b, 4-a**
| レイヤー | 接頭辞 |
|---|---|
| **staging** → d | `stg_` |
| **intermediate** → c | `int_` |
| **marts（ファクト）** → b | `fct_` |
| **marts（ディメンション）** → a | `dim_` |', 'https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-0', 'card-dbt-ae-010', 0, '1', 'staging', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-1', 'card-dbt-ae-010', 1, '2', 'intermediate', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-2', 'card-dbt-ae-010', 2, '3', 'marts（ファクト）', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-3', 'card-dbt-ae-010', 3, '4', 'marts（ディメンション）', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-4', 'card-dbt-ae-010', 4, 'a', '`dim_`', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-5', 'card-dbt-ae-010', 5, 'b', '`fct_`', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-6', 'card-dbt-ae-010', 6, 'c', '`int_`', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-010-opt-7', 'card-dbt-ae-010', 7, 'd', '`stg_`', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-010-ans-0', 'card-dbt-ae-010', 'card-dbt-ae-010-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-010-ans-1', 'card-dbt-ae-010', 'card-dbt-ae-010-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-010-ans-2', 'card-dbt-ae-010', 'card-dbt-ae-010-opt-2', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-010-ans-3', 'card-dbt-ae-010', 'card-dbt-ae-010-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-011', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各 incremental_strategy（左列）を、その動作（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. append | a. `unique_key` の一致する行を削除してから挿入 |
| 2. merge | b. パーティション単位で上書き |
| 3. delete+insert | c. `unique_key` で既存行を更新、なければ挿入 |
| 4. insert_overwrite | d. 新規行を追加のみ（重複チェックなし） |', '**1-d, 2-c, 3-a, 4-b**
| strategy | 動作 |
|---|---|
| **append** → d | 新規行を追加のみ（重複チェックなし） |
| **merge** → c | `unique_key` で既存行を更新、なければ挿入 |
| **delete+insert** → a | `unique_key` の一致する行を削除してから挿入 |
| **insert_overwrite** → b | パーティション単位で上書き（BigQuery等） |', 'https://docs.getdbt.com/docs/build/incremental-strategy');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-0', 'card-dbt-ae-011', 0, '1', 'append', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-1', 'card-dbt-ae-011', 1, '2', 'merge', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-2', 'card-dbt-ae-011', 2, '3', 'delete+insert', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-3', 'card-dbt-ae-011', 3, '4', 'insert_overwrite', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-4', 'card-dbt-ae-011', 4, 'a', '`unique_key` の一致する行を削除してから挿入', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-5', 'card-dbt-ae-011', 5, 'b', 'パーティション単位で上書き', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-6', 'card-dbt-ae-011', 6, 'c', '`unique_key` で既存行を更新、なければ挿入', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-011-opt-7', 'card-dbt-ae-011', 7, 'd', '新規行を追加のみ（重複チェックなし）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-011-ans-0', 'card-dbt-ae-011', 'card-dbt-ae-011-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-011-ans-1', 'card-dbt-ae-011', 'card-dbt-ae-011-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-011-ans-2', 'card-dbt-ae-011', 'card-dbt-ae-011-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-011-ans-3', 'card-dbt-ae-011', 'card-dbt-ae-011-opt-3', NULL, 1);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-012', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の seed 設定の目的は？
```yaml
seeds:
  my_project:
    country_codes:
      +column_types:
        country_code: varchar(3)
```', '`country_code` カラムをvarchar(3)として強制する。**先頭ゼロや特殊な文字列が数値として誤って型推論されるのを防ぐ**。', 'https://docs.getdbt.com/docs/build/seeds');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-013', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'grants config の用途は？
- A. DWH上のテーブルに権限を付与する
- B. dbtプロジェクトのアクセス権を管理する
- C. Gitリポジトリの権限を設定する
- D. APIキーの権限を管理する', '**正解: A**
`grants: { select: [''analyst_role'', ''reporter_role''] }` のように、モデルのビルド後にDWH上のテーブルに自動的に権限を付与する。', 'https://docs.getdbt.com/reference/resource-configs/grants');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-013-opt-0', 'card-dbt-ae-013', 0, 'A', 'DWH上のテーブルに権限を付与する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-013-opt-1', 'card-dbt-ae-013', 1, 'B', 'dbtプロジェクトのアクセス権を管理する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-013-opt-2', 'card-dbt-ae-013', 2, 'C', 'Gitリポジトリの権限を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-013-opt-3', 'card-dbt-ae-013', 3, 'D', 'APIキーの権限を管理する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-013-ans-0', 'card-dbt-ae-013', 'card-dbt-ae-013-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-014', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のモデルで `--full-refresh` を実行すると何が起きるか？
```sql
{{ config(materialized=''incremental'', unique_key=''id'') }}
select * from {{ ref(''stg_orders'') }}
{% if is_incremental() %}
where updated_at > (select max(updated_at) from {{ this }})
{% endif %}
```', '`is_incremental()` が **False** を返すため、WHERE句が適用されず**全データが再処理**される。テーブルはDROPされてから再作成される。', 'https://docs.getdbt.com/docs/build/incremental-models');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-015', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`+` プレフィックス（例: `+materialized`）の意味は？
- A. 必須パラメータを示す
- B. dbt の config 値であることを示す
- C. 加算演算子
- D. コメント', '**正解: B**
`dbt_project.yml` 内で `+` はプロパティが config 値であることを示す。YAML のモデル/シード等のセクションで使用する。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-015-opt-0', 'card-dbt-ae-015', 0, 'A', '必須パラメータを示す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-015-opt-1', 'card-dbt-ae-015', 1, 'B', 'dbt の config 値であることを示す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-015-opt-2', 'card-dbt-ae-015', 2, 'C', '加算演算子', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-015-opt-3', 'card-dbt-ae-015', 3, 'D', 'コメント', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-015-ans-0', 'card-dbt-ae-015', 'card-dbt-ae-015-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-016', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt プロジェクトでの推奨 git ブランチ戦略は？
- A. feature branch ワークフロー（main + feature ブランチ + PR）
- B. trunk-based development（main に直接コミット）
- C. Gitflow（main / develop / release / feature / hotfix）
- D. 環境ごとにブランチを分ける（dev / staging / prod）', '**feature branch ワークフロー**:
1. `main` ブランチは常に本番デプロイ可能な状態を維持
2. 機能追加・修正は `feature/` ブランチで作業
3. PR を作成しコードレビューを受ける
4. CI 環境でテストを実行
5. マージ後に本番デプロイ
`main` への直接コミットは避ける。', 'https://docs.getdbt.com/docs/collaborate/git/version-control-basics');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-016-opt-0', 'card-dbt-ae-016', 0, 'A', 'feature branch ワークフロー（main + feature ブランチ + PR）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-016-opt-1', 'card-dbt-ae-016', 1, 'B', 'trunk-based development（main に直接コミット）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-016-opt-2', 'card-dbt-ae-016', 2, 'C', 'Gitflow（main / develop / release / feature / hotfix）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-016-opt-3', 'card-dbt-ae-016', 3, 'D', '環境ごとにブランチを分ける（dev / staging / prod）', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-017', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt parse` コマンドの主な用途は？
- A. SQLの構文解析を行う
- B. プロジェクトファイルを読み込み `manifest.json` を生成する
- C. CSV ファイルを解析する
- D. YAML ファイルのバリデーションを行う', '**正解: B**
プロジェクトのすべてのファイルを読み込んで解析し、`target/manifest.json` を生成する。`dbt compile` より軽量。', 'https://docs.getdbt.com/reference/commands/compile');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-017-opt-0', 'card-dbt-ae-017', 0, 'A', 'SQLの構文解析を行う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-017-opt-1', 'card-dbt-ae-017', 1, 'B', 'プロジェクトファイルを読み込み `manifest.json` を生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-017-opt-2', 'card-dbt-ae-017', 2, 'C', 'CSV ファイルを解析する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-017-opt-3', 'card-dbt-ae-017', 3, 'D', 'YAML ファイルのバリデーションを行う', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-017-ans-0', 'card-dbt-ae-017', 'card-dbt-ae-017-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-018', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'microbatch strategy の `batch_size` に設定できる値として**正しいもの**をすべて選べ。
- A. `hour`
- B. `day`
- C. `month`
- D. `year`
- E. `minute`', '**正解: A, B, C, D**
`hour`, `day`, `month`, `year` が設定可能。`minute` は粒度が細かすぎてサポートされていない。', 'https://docs.getdbt.com/docs/build/incremental-microbatch');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-018-opt-0', 'card-dbt-ae-018', 0, 'A', '`hour`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-018-opt-1', 'card-dbt-ae-018', 1, 'B', '`day`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-018-opt-2', 'card-dbt-ae-018', 2, 'C', '`month`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-018-opt-3', 'card-dbt-ae-018', 3, 'D', '`year`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-018-opt-4', 'card-dbt-ae-018', 4, 'E', '`minute`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-018-ans-0', 'card-dbt-ae-018', 'card-dbt-ae-018-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-018-ans-1', 'card-dbt-ae-018', 'card-dbt-ae-018-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-018-ans-2', 'card-dbt-ae-018', 'card-dbt-ae-018-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-018-ans-3', 'card-dbt-ae-018', 'card-dbt-ae-018-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-019', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `seed-paths` のデフォルト値は `____` である。
- A. `[''seeds'']`
- B. `[''data'']`
- C. `[''csv'']`
- D. `[''seed'']`', '**正解: `[''seeds'']`**
CSVファイルはデフォルトで `seeds/` ディレクトリに配置する。', 'https://docs.getdbt.com/docs/build/seeds');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-019-opt-0', 'card-dbt-ae-019', 0, 'A', '`[''seeds'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-019-opt-1', 'card-dbt-ae-019', 1, 'B', '`[''data'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-019-opt-2', 'card-dbt-ae-019', 2, 'C', '`[''csv'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-019-opt-3', 'card-dbt-ae-019', 3, 'D', '`[''seed'']`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-020', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'tags の設定方法として正しいものを**2つ**選べ。
- A. `dbt_project.yml` で `+tags: [''nightly'']`
- B. モデルのSQLで `{{ config(tags=[''nightly'']) }}`
- C. YAMLで `tags: [''nightly'']`（columns配下）
- D. `packages.yml` で `tags: [''nightly'']`', '**正解: A, B**
- `dbt_project.yml` でフォルダ単位に設定
- モデルのSQL内の `config()` で個別設定
packages.yml では tags は設定できない。カラムレベルでは v1.9+ で `config:` ブロック内に設定可能。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-020-opt-0', 'card-dbt-ae-020', 0, 'A', '`dbt_project.yml` で `+tags: [''nightly'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-020-opt-1', 'card-dbt-ae-020', 1, 'B', 'モデルのSQLで `{{ config(tags=[''nightly'']) }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-020-opt-2', 'card-dbt-ae-020', 2, 'C', 'YAMLで `tags: [''nightly'']`（columns配下）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-020-opt-3', 'card-dbt-ae-020', 3, 'D', '`packages.yml` で `tags: [''nightly'']`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-020-ans-0', 'card-dbt-ae-020', 'card-dbt-ae-020-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-020-ans-1', 'card-dbt-ae-020', 'card-dbt-ae-020-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-021', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', 'Jinja の `~` 演算子の用途は？
- A. 否定演算
- B. 文字列の連結
- C. 数値の丸め
- D. パターンマッチング', '**正解: B**
`{{ "Hello" ~ " " ~ "World" }}` → `Hello World`。Python の `+` と同様に文字列を連結する。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-022', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のJinja で `adapter.get_relation()` の用途は？
```sql
{% set rel = adapter.get_relation(
    database=target.database,
    schema=target.schema,
    identifier=''my_table''
) %}
{% if rel is not none %}
  -- テーブルが存在する
{% endif %}
```', '**DWH上にテーブル/ビューが存在するかどうかを確認**する。`adapter.get_relation()` はリレーションが存在すれば Relation オブジェクトを返し、存在しなければ `none` を返す。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-023', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のモデルをCTEを使ってリファクタリングする際の推奨パターンは？
```sql
select
    o.order_id,
    o.customer_id,
    c.customer_name,
    sum(p.amount) as total_amount
from {{ ref(''stg_orders'') }} o
join {{ ref(''stg_customers'') }} c on o.customer_id = c.customer_id
join {{ ref(''stg_payments'') }} p on o.order_id = p.order_id
group by 1, 2, 3
```', '**import CTE パターン**を使う:
```sql
with orders as (
    select * from {{ ref(''stg_orders'') }}
),
customers as (
    select * from {{ ref(''stg_customers'') }}
),
payments as (
    select * from {{ ref(''stg_payments'') }}
),
final as (
    select
        o.order_id,
        o.customer_id,
        c.customer_name,
        sum(p.amount) as total_amount
    from orders o
    join customers c on o.customer_id = c.customer_id
    join payments p on o.order_id = p.order_id
    group by 1, 2, 3
)
select * from final
```
各 `ref()` を import CTE に分離し、最後に `final` CTE で結合するのが dbt の推奨パターン。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-024', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --select my_model --full-refresh` と `dbt run --select my_model` の違いがあるのはどの materialization か？
- A. table
- B. view
- C. incremental
- D. ephemeral', '**正解: C**
`--full-refresh` は **incremental** モデルにのみ影響する。テーブルをDROPして全データを再処理する。table, view, ephemeral は通常実行と変わらない。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-024-opt-0', 'card-dbt-ae-024', 0, 'A', 'table', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-024-opt-1', 'card-dbt-ae-024', 1, 'B', 'view', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-024-opt-2', 'card-dbt-ae-024', 2, 'C', 'incremental', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-024-opt-3', 'card-dbt-ae-024', 3, 'D', 'ephemeral', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-024-ans-0', 'card-dbt-ae-024', 'card-dbt-ae-024-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-025', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'pre-hook と post-hook をモデルのSQLで設定する正しい方法は？
- A. `{{ config(pre_hook="SQL文") }}`
- B. `{% pre_hook %}SQL文{% endpre_hook %}`
- C. `-- pre-hook: SQL文`
- D. `{{ pre_hook("SQL文") }}`', '**正解: A**
`{{ config(pre_hook="GRANT SELECT ON ...", post_hook="ANALYZE TABLE ...") }}` のように config 内で設定する。リスト形式で複数指定も可能。', 'https://docs.getdbt.com/reference/dbt_project.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-025-opt-0', 'card-dbt-ae-025', 0, 'A', '`{{ config(pre_hook="SQL文") }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-025-opt-1', 'card-dbt-ae-025', 1, 'B', '`{% pre_hook %}SQL文{% endpre_hook %}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-025-opt-2', 'card-dbt-ae-025', 2, 'C', '`-- pre-hook: SQL文`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-025-opt-3', 'card-dbt-ae-025', 3, 'D', '`{{ pre_hook("SQL文") }}`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-025-ans-0', 'card-dbt-ae-025', 'card-dbt-ae-025-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-026', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt プロジェクトで `packages-install-path` のデフォルト値は `____` である。
- A. `dbt_packages`
- B. `packages`
- C. `node_modules`
- D. `lib`', '**正解: `dbt_packages`**
`dbt deps` でインストールされたパッケージは `dbt_packages/` ディレクトリに配置される。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-026-opt-0', 'card-dbt-ae-026', 0, 'A', '`dbt_packages`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-026-opt-1', 'card-dbt-ae-026', 1, 'B', '`packages`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-026-opt-2', 'card-dbt-ae-026', 2, 'C', '`node_modules`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-026-opt-3', 'card-dbt-ae-026', 3, 'D', '`lib`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-027', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'source の `identifier` 設定の用途は？
- A. ソースに一意のIDを付与する
- B. DWH上の実際のテーブル名が `name` と異なる場合に指定する
- C. ソーステーブルにエイリアスを設定する
- D. ソースのバージョンを指定する', '**正解: B**
`name` はdbt内での論理名、`identifier` はDWH上の実際のテーブル名。例: `name: orders` で `identifier: raw_orders_v2`。', 'https://docs.getdbt.com/reference/resource-properties/identifier');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-027-opt-0', 'card-dbt-ae-027', 0, 'A', 'ソースに一意のIDを付与する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-027-opt-1', 'card-dbt-ae-027', 1, 'B', 'DWH上の実際のテーブル名が `name` と異なる場合に指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-027-opt-2', 'card-dbt-ae-027', 2, 'C', 'ソーステーブルにエイリアスを設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-027-opt-3', 'card-dbt-ae-027', 3, 'D', 'ソースのバージョンを指定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-027-ans-0', 'card-dbt-ae-027', 'card-dbt-ae-027-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-028', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'seed の `column_types` 設定の用途は？
- A. カラムのデータ型を明示的に指定する
- B. カラムの表示順序を設定する
- C. カラムにインデックスを追加する
- D. カラムのデフォルト値を設定する', '**正解: A**
CSVのカラムに対してDWH上のデータ型を明示的に指定する。dbtの自動型推論が不適切な場合（例: 先頭ゼロ付き文字列がintと推論される）に使用。', 'https://docs.getdbt.com/docs/build/seeds');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-028-opt-0', 'card-dbt-ae-028', 0, 'A', 'カラムのデータ型を明示的に指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-028-opt-1', 'card-dbt-ae-028', 1, 'B', 'カラムの表示順序を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-028-opt-2', 'card-dbt-ae-028', 2, 'C', 'カラムにインデックスを追加する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-028-opt-3', 'card-dbt-ae-028', 3, 'D', 'カラムのデフォルト値を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-028-ans-0', 'card-dbt-ae-028', 'card-dbt-ae-028-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-029', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のモデルで `{{ config(alias=''customer_dim'') }}` を設定した効果は？
- A. モデルのファイル名を変更する
- B. DWH上のテーブル名を `customer_dim` にする
- C. モデルのDAG上の表示名を変更する
- D. `ref()` での参照名を `customer_dim` にする', '**正解: B**
`alias` はDWH上のテーブル/ビュー名をオーバーライドする。`ref()` では引き続きファイル名（モデル名）で参照する。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-029-opt-0', 'card-dbt-ae-029', 0, 'A', 'モデルのファイル名を変更する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-029-opt-1', 'card-dbt-ae-029', 1, 'B', 'DWH上のテーブル名を `customer_dim` にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-029-opt-2', 'card-dbt-ae-029', 2, 'C', 'モデルのDAG上の表示名を変更する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-029-opt-3', 'card-dbt-ae-029', 3, 'D', '`ref()` での参照名を `customer_dim` にする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-029-ans-0', 'card-dbt-ae-029', 'card-dbt-ae-029-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-030', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-1', 'dbt プロジェクトの推奨モデルレイヤー構成として、以下を正しい順序に並べよ（データフローの上流から下流）。
ステップ:
- (a) marts
- (b) staging
- (c) intermediate
- (d) sources（raw data）', '**正解: d → b → c → a**
1. **(d) sources** — 生データ
2. **(b) staging** — 1:1変換、クリーニング
3. **(c) intermediate** — ビジネスロジック、結合
4. **(a) marts** — 最終的な分析用テーブル', 'https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-030-opt-0', 'card-dbt-ae-030', 0, 'a', 'marts', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-030-opt-1', 'card-dbt-ae-030', 1, 'b', 'staging', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-030-opt-2', 'card-dbt-ae-030', 2, 'c', 'intermediate', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-030-opt-3', 'card-dbt-ae-030', 3, 'd', 'sources（raw data）', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-030-ans-0', 'card-dbt-ae-030', 'card-dbt-ae-030-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-030-ans-1', 'card-dbt-ae-030', 'card-dbt-ae-030-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-030-ans-2', 'card-dbt-ae-030', 'card-dbt-ae-030-opt-2', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-030-ans-3', 'card-dbt-ae-030', 'card-dbt-ae-030-opt-0', NULL, 3);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-031', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt モデルで CTE を使う利点は？（該当するものをすべて選択）
- A. 常にサブクエリより高速に実行される
- B. コードの再利用性が高まる（同じCTEを複数回参照）
- C. ロジックをステップごとに分解できる
- D. クエリの可読性が向上する', '**正解: B, C, D**
CTE はクエリを論理的なステップに分解し、可読性と保守性を向上させる。同じ CTE を複数回参照することでコードの重複を防ぐ。パフォーマンスはDWHの最適化に依存し、常に高速とは限らない。', 'https://docs.getdbt.com/best-practices/how-we-structure/2-staging');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-031-opt-0', 'card-dbt-ae-031', 0, 'A', '常にサブクエリより高速に実行される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-031-opt-1', 'card-dbt-ae-031', 1, 'B', 'コードの再利用性が高まる（同じCTEを複数回参照）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-031-opt-2', 'card-dbt-ae-031', 2, 'C', 'ロジックをステップごとに分解できる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-031-opt-3', 'card-dbt-ae-031', 3, 'D', 'クエリの可読性が向上する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-031-ans-0', 'card-dbt-ae-031', 'card-dbt-ae-031-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-031-ans-1', 'card-dbt-ae-031', 'card-dbt-ae-031-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-031-ans-2', 'card-dbt-ae-031', 'card-dbt-ae-031-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-032', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'packages.yml でパッケージを指定する3つの方法を**すべて**選べ。
- A. npm レジストリ（`npm:`）
- B. dbt Hub（`package: ''dbt-labs/dbt_utils''`）
- C. Git リポジトリ（`git:`）
- D. ローカルパス（`local:`）', '**正解: B, C, D**
- **Hub** — dbt Hub から公式パッケージ
- **Git** — GitHub等のリポジトリから直接
- **Local** — ローカルファイルシステムから
npm は dbt のパッケージ管理には使わない。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-032-opt-0', 'card-dbt-ae-032', 0, 'A', 'npm レジストリ（`npm:`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-032-opt-1', 'card-dbt-ae-032', 1, 'B', 'dbt Hub（`package: ''dbt-labs/dbt_utils''`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-032-opt-2', 'card-dbt-ae-032', 2, 'C', 'Git リポジトリ（`git:`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-032-opt-3', 'card-dbt-ae-032', 3, 'D', 'ローカルパス（`local:`）', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-032-ans-0', 'card-dbt-ae-032', 'card-dbt-ae-032-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-032-ans-1', 'card-dbt-ae-032', 'card-dbt-ae-032-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-032-ans-2', 'card-dbt-ae-032', 'card-dbt-ae-032-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-033', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt の `{{ target }}` 変数で取得できる情報を**3つ**選べ。
- A. `target.name`（ターゲット名: dev, prod等）
- B. `target.schema`（スキーマ名）
- C. `target.database`（データベース名）
- D. `target.password`（パスワード）', '**正解: A, B, C**
`target` オブジェクトには接続情報が含まれる。name, schema, database, type, threads 等。パスワードは含まれない。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/target');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-033-opt-0', 'card-dbt-ae-033', 0, 'A', '`target.name`（ターゲット名: dev, prod等）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-033-opt-1', 'card-dbt-ae-033', 1, 'B', '`target.schema`（スキーマ名）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-033-opt-2', 'card-dbt-ae-033', 2, 'C', '`target.database`（データベース名）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-033-opt-3', 'card-dbt-ae-033', 3, 'D', '`target.password`（パスワード）', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-033-ans-0', 'card-dbt-ae-033', 'card-dbt-ae-033-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-033-ans-1', 'card-dbt-ae-033', 'card-dbt-ae-033-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-033-ans-2', 'card-dbt-ae-033', 'card-dbt-ae-033-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-034', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run-operation` でマクロに引数を渡す構文は？
- A. `dbt run-operation my_macro --args ''{"key": "value"}''`
- B. `dbt run-operation my_macro key=value`
- C. `dbt run-operation my_macro --key value`
- D. `dbt run-operation my_macro(key=value)`', '**正解: A**
`--args` フラグでYAML/JSON形式の引数を渡す。例: `dbt run-operation grant_select --args ''{"role": "analyst"}''`', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-034-opt-0', 'card-dbt-ae-034', 0, 'A', '`dbt run-operation my_macro --args ''{"key": "value"}''`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-034-opt-1', 'card-dbt-ae-034', 1, 'B', '`dbt run-operation my_macro key=value`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-034-opt-2', 'card-dbt-ae-034', 2, 'C', '`dbt run-operation my_macro --key value`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-034-opt-3', 'card-dbt-ae-034', 3, 'D', '`dbt run-operation my_macro(key=value)`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-034-ans-0', 'card-dbt-ae-034', 'card-dbt-ae-034-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-035', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の `dbt_project.yml` 設定で、`models/staging/` のモデルが view、`models/marts/` が table になる理由は？
```yaml
models:
  my_project:
    staging:
      +materialized: view
    marts:
      +materialized: table
```', '**フォルダごとにデフォルト materialization を指定**している。`+` プレフィックスは config 値を示し、フォルダ構造に対応して適用される。', 'https://docs.getdbt.com/docs/build/materializations');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-036', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'semantic layer の metric を定義する場所は？
- A. `metrics/` ディレクトリのSQLファイル
- B. YAMLファイルの `semantic_models` と `metrics` セクション
- C. `dbt_project.yml` の `metrics` セクション
- D. Jinjaマクロ', '**正解: B**
dbt semantic layer では YAML ファイルで `semantic_models`（エンティティ、ディメンション、メジャーを定義）と `metrics`（メジャーを参照するメトリクス）を定義する。', 'https://docs.getdbt.com/docs/build/metrics-overview');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-036-opt-0', 'card-dbt-ae-036', 0, 'A', '`metrics/` ディレクトリのSQLファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-036-opt-1', 'card-dbt-ae-036', 1, 'B', 'YAMLファイルの `semantic_models` と `metrics` セクション', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-036-opt-2', 'card-dbt-ae-036', 2, 'C', '`dbt_project.yml` の `metrics` セクション', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-036-opt-3', 'card-dbt-ae-036', 3, 'D', 'Jinjaマクロ', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-036-ans-0', 'card-dbt-ae-036', 'card-dbt-ae-036-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-037', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'feature branch で作業中に head branch の変更を取り込むための正しい方法は？
- A. incremental モデルはデータの大部分が更新される場合に適している（無関係な選択肢）
- B. `git fetch` を使って全リモートブランチをローカルに取得する
- C. `git pull` を使って head branch と同期する
- D. マージコンフリクトは dbt Cloud IDE でのみ解決しなければならない', '**正解: C**
`git pull` は `git fetch`（リモートの変更をダウンロード）と `git merge`（現在のブランチにマージ）を実行する。', 'https://docs.getdbt.com/docs/collaborate/git/version-control-basics');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-037-opt-0', 'card-dbt-ae-037', 0, 'A', 'incremental モデルはデータの大部分が更新される場合に適している（無関係な選択肢）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-037-opt-1', 'card-dbt-ae-037', 1, 'B', '`git fetch` を使って全リモートブランチをローカルに取得する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-037-opt-2', 'card-dbt-ae-037', 2, 'C', '`git pull` を使って head branch と同期する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-037-opt-3', 'card-dbt-ae-037', 3, 'D', 'マージコンフリクトは dbt Cloud IDE でのみ解決しなければならない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-037-ans-0', 'card-dbt-ae-037', 'card-dbt-ae-037-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-038', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run-operation` コマンドの用途は何か？
- A. 全モデルを実行する
- B. 特定のマクロをモデル実行なしで直接呼び出す
- C. 失敗したモデルを再実行する
- D. データベース操作のログを出力する', '**正解: B**
例: `dbt run-operation grant_select --args ''{role: analyst}''`。モデルのビルドなしでマクロを実行したい場合に使う。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-038-opt-0', 'card-dbt-ae-038', 0, 'A', '全モデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-038-opt-1', 'card-dbt-ae-038', 1, 'B', '特定のマクロをモデル実行なしで直接呼び出す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-038-opt-2', 'card-dbt-ae-038', 2, 'C', '失敗したモデルを再実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-038-opt-3', 'card-dbt-ae-038', 3, 'D', 'データベース操作のログを出力する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-038-ans-0', 'card-dbt-ae-038', 'card-dbt-ae-038-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-039', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '各 dbt リソースの設定優先順位（低い順 → 高い順）を正しく並べよ。
ステップ:
- (a) モデルSQL内の `config()`
- (b) `dbt_project.yml` のプロジェクト設定
- (c) YAMLファイルのリソースプロパティ
- (d) コマンドラインフラグ', '**正解: b → c → a → d**
1. **(b) `dbt_project.yml`** — 最低優先度
2. **(c) YAMLプロパティ** — プロジェクト設定をオーバーライド
3. **(a) SQL内の `config()`** — YAMLをオーバーライド
4. **(d) コマンドラインフラグ** — 最高優先度', 'https://docs.getdbt.com/reference/dbt_project.yml');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-040', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各 materialization（左列）を、その特徴（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. view | a. 実体なし、CTEとして依存モデル内にインライン展開 |
| 2. table | b. 物理テーブルとして毎回DROP+CREATE、クエリ性能が良い |
| 3. incremental | c. 既存テーブルに新規データのみ追加、大量データ向け |
| 4. ephemeral | d. SQLビューとして作成、ストレージ不要、クエリ時に毎回実行 |', '**1-d, 2-b, 3-c, 4-a**
| materialization | 特徴 |
|---|---|
| **view** → d | SQLビューとして作成。ストレージ不要、クエリ時に毎回実行 |
| **table** → b | 物理テーブルとして毎回DROP+CREATE。クエリ性能が良い |
| **incremental** → c | 既存テーブルに新規データのみ追加。大量データ向け |
| **ephemeral** → a | 実体なし。CTEとして依存モデル内にインライン展開 |', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-0', 'card-dbt-ae-040', 0, '1', 'view', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-1', 'card-dbt-ae-040', 1, '2', 'table', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-2', 'card-dbt-ae-040', 2, '3', 'incremental', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-3', 'card-dbt-ae-040', 3, '4', 'ephemeral', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-4', 'card-dbt-ae-040', 4, 'a', '実体なし、CTEとして依存モデル内にインライン展開', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-5', 'card-dbt-ae-040', 5, 'b', '物理テーブルとして毎回DROP+CREATE、クエリ性能が良い', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-6', 'card-dbt-ae-040', 6, 'c', '既存テーブルに新規データのみ追加、大量データ向け', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-040-opt-7', 'card-dbt-ae-040', 7, 'd', 'SQLビューとして作成、ストレージ不要、クエリ時に毎回実行', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-040-ans-0', 'card-dbt-ae-040', 'card-dbt-ae-040-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-040-ans-1', 'card-dbt-ae-040', 'card-dbt-ae-040-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-040-ans-2', 'card-dbt-ae-040', 'card-dbt-ae-040-opt-2', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-040-ans-3', 'card-dbt-ae-040', 'card-dbt-ae-040-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-041', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` で `dispatch` を設定する例として正しいものは？
```yaml
dispatch:
  - macro_namespace: dbt_utils
    search_order: [''my_project'', ''dbt_utils'']
```
この設定の効果は？', '`dbt_utils` パッケージのマクロを呼び出す際、まず `my_project` 内のオーバーライドマクロを検索し、見つからなければ `dbt_utils` のデフォルト実装を使用する。**パッケージのマクロを自プロジェクトでカスタマイズ**するためのパターン。', 'https://docs.getdbt.com/docs/build/packages');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-042', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の Jinja の `{% if %}` ブロックの問題点は？
```sql
{% if target.name = ''prod'' %}
  select * from {{ ref(''fct_orders'') }}
{% endif %}
```', '**`=` が代入演算子になっている**。条件比較には `==` を使う必要がある。
修正: `{% if target.name == ''prod'' %}`', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-043', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt clean` コマンドが削除するのは？
- A. DWH上のテーブル
- B. `target/` と `dbt_packages/` ディレクトリ
- C. `logs/` ディレクトリのみ
- D. `.git/` ディレクトリ', '**正解: B**
`dbt_project.yml` の `clean-targets` で定義されたディレクトリを削除する。デフォルトは `target/` と `dbt_packages/`。', 'https://docs.getdbt.com/reference/commands/clean');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-043-opt-0', 'card-dbt-ae-043', 0, 'A', 'DWH上のテーブル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-043-opt-1', 'card-dbt-ae-043', 1, 'B', '`target/` と `dbt_packages/` ディレクトリ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-043-opt-2', 'card-dbt-ae-043', 2, 'C', '`logs/` ディレクトリのみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-043-opt-3', 'card-dbt-ae-043', 3, 'D', '`.git/` ディレクトリ', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-043-ans-0', 'card-dbt-ae-043', 'card-dbt-ae-043-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-044', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'snapshot が自動追加するメタカラムとして**正しいもの**をすべて選べ。
- A. `dbt_valid_from`
- B. `dbt_valid_to`
- C. `dbt_updated_at`
- D. `dbt_created_at`
- E. `dbt_scd_id`', '**正解: A, B, C, E**
- `dbt_valid_from` — レコードの有効開始日時
- `dbt_valid_to` — レコードの有効終了日時（現在有効なら NULL）
- `dbt_updated_at` — dbtが検出した更新日時
- `dbt_scd_id` — SCD Type 2 のサロゲートキー
`dbt_created_at` は存在しない。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-044-opt-0', 'card-dbt-ae-044', 0, 'A', '`dbt_valid_from`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-044-opt-1', 'card-dbt-ae-044', 1, 'B', '`dbt_valid_to`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-044-opt-2', 'card-dbt-ae-044', 2, 'C', '`dbt_updated_at`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-044-opt-3', 'card-dbt-ae-044', 3, 'D', '`dbt_created_at`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-044-opt-4', 'card-dbt-ae-044', 4, 'E', '`dbt_scd_id`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-044-ans-0', 'card-dbt-ae-044', 'card-dbt-ae-044-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-044-ans-1', 'card-dbt-ae-044', 'card-dbt-ae-044-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-044-ans-2', 'card-dbt-ae-044', 'card-dbt-ae-044-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-044-ans-3', 'card-dbt-ae-044', 'card-dbt-ae-044-opt-4', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-045', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'microbatch incremental strategy で必須の設定は何か？
- A. `unique_key`
- B. `event_time`
- C. `check_cols`
- D. `updated_at`', '**正解: B**
microbatch は `event_time` でデータをバッチ分割して処理する。時系列データに最適。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-045-opt-0', 'card-dbt-ae-045', 0, 'A', '`unique_key`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-045-opt-1', 'card-dbt-ae-045', 1, 'B', '`event_time`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-045-opt-2', 'card-dbt-ae-045', 2, 'C', '`check_cols`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-045-opt-3', 'card-dbt-ae-045', 3, 'D', '`updated_at`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-045-ans-0', 'card-dbt-ae-045', 'card-dbt-ae-045-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-046', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の `generate_schema_name` マクロの動作は？
```sql
{% macro generate_schema_name(custom_schema_name, node) %}
    {% if target.name == ''prod'' %}
        {{ custom_schema_name | trim }}
    {% else %}
        {{ target.schema }}_{{ custom_schema_name | trim }}
    {% endif %}
{% endmacro %}
```', '**prod環境**: `custom_schema_name` をそのまま使用（例: `analytics`）
**その他の環境**: `target.schema` + `_` + `custom_schema_name`（例: `dbt_user_analytics`）
本番と開発でスキーマ名のルールを分けるパターン。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-047', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --select my_model+2` の意味は？
- A. my_model と2ホップ先までの下流を実行する
- B. my_model を2回実行する
- C. my_model のv2を実行する
- D. 2つのモデルを実行する', '**正解: A**
`my_model+2` は my_model とその**2ホップ下流**までを選択する。`my_model+` は全下流。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-047-opt-0', 'card-dbt-ae-047', 0, 'A', 'my_model と2ホップ先までの下流を実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-047-opt-1', 'card-dbt-ae-047', 1, 'B', 'my_model を2回実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-047-opt-2', 'card-dbt-ae-047', 2, 'C', 'my_model のv2を実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-047-opt-3', 'card-dbt-ae-047', 3, 'D', '2つのモデルを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-047-ans-0', 'card-dbt-ae-047', 'card-dbt-ae-047-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-048', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の sources.yml でテーブルが4つあるのに source が4つ定義されている問題は？
```yaml
sources:
  - name: customers
    tables:
      - name: customers
  - name: orders
    tables:
      - name: orders
  - name: nations
    tables:
      - name: nations
  - name: regions
    tables:
      - name: regions
```
（すべて `sample_data.public` スキーマ配下）', '**1つの source に4つの tables としてまとめるべき**。source = database + schema の組み合わせ。
修正:
```yaml
sources:
  - name: sample_data
    schema: public
    tables:
      - name: customers
      - name: orders
      - name: nations
      - name: regions
```', 'https://docs.getdbt.com/docs/build/sources');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-049', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `model-paths` のデフォルト値は `____` である。
- A. `[''models'']`
- B. `[''src'']`
- C. `[''sql'']`
- D. `[''dbt_models'']`', '**正解: `[''models'']`**
デフォルトでは `models/` ディレクトリ以下のSQLファイルがモデルとして認識される。', 'https://docs.getdbt.com/reference/project-configs/model-paths');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-049-opt-0', 'card-dbt-ae-049', 0, 'A', '`[''models'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-049-opt-1', 'card-dbt-ae-049', 1, 'B', '`[''src'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-049-opt-2', 'card-dbt-ae-049', 2, 'C', '`[''sql'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-049-opt-3', 'card-dbt-ae-049', 3, 'D', '`[''dbt_models'']`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-050', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のモデルで `{{ target.name }}` を使う目的は？
```sql
{% if target.name == ''prod'' %}
  select * from {{ ref(''fct_orders'') }}
{% else %}
  select * from {{ ref(''fct_orders'') }} limit 1000
{% endif %}
```', '**環境ごとに異なるクエリを実行**する。本番では全データ、開発環境ではデータ量を制限する。`target.name` は `profiles.yml` のターゲット名。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-051', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `quoting` 設定の用途は？
- A. SQL内の文字列リテラルのクォート方法を設定する
- B. データベース名、スキーマ名、識別子名のクォートを制御する
- C. YAML内のクォート方法を設定する
- D. Jinjaテンプレート内のクォートを制御する', '**正解: B**
`quoting: { database: false, schema: false, identifier: false }` で、dbtが生成するSQLでテーブル名等をクォートするかを制御する。', 'https://docs.getdbt.com/reference/project-configs/quoting');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-051-opt-0', 'card-dbt-ae-051', 0, 'A', 'SQL内の文字列リテラルのクォート方法を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-051-opt-1', 'card-dbt-ae-051', 1, 'B', 'データベース名、スキーマ名、識別子名のクォートを制御する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-051-opt-2', 'card-dbt-ae-051', 2, 'C', 'YAML内のクォート方法を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-051-opt-3', 'card-dbt-ae-051', 3, 'D', 'Jinjaテンプレート内のクォートを制御する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-051-ans-0', 'card-dbt-ae-051', 'card-dbt-ae-051-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-052', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`on_schema_change` のデフォルト値は `____` である。
- A. `ignore`
- B. `fail`
- C. `append_new_columns`
- D. `sync_all_columns`', '**正解: `ignore`**
デフォルトではスキーマ変更を無視する。本番環境では `fail` を推奨する場合もある。', 'https://docs.getdbt.com/docs/build/incremental-models#what-if-the-columns-of-my-incremental-model-change');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-052-opt-0', 'card-dbt-ae-052', 0, 'A', '`ignore`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-052-opt-1', 'card-dbt-ae-052', 1, 'B', '`fail`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-052-opt-2', 'card-dbt-ae-052', 2, 'C', '`append_new_columns`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-052-opt-3', 'card-dbt-ae-052', 3, 'D', '`sync_all_columns`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-053', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --select path:models/staging` の効果は？
- A. staging ディレクトリ内のすべてのモデルを実行する
- B. staging という名前のモデルのみ実行する
- C. staging ソースを参照するモデルを実行する
- D. staging タグのモデルを実行する', '**正解: A**
`path:` セレクターは指定したディレクトリパス内のリソースを選択する。`models/staging/` 内の全モデルが実行される。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-053-opt-0', 'card-dbt-ae-053', 0, 'A', 'staging ディレクトリ内のすべてのモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-053-opt-1', 'card-dbt-ae-053', 1, 'B', 'staging という名前のモデルのみ実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-053-opt-2', 'card-dbt-ae-053', 2, 'C', 'staging ソースを参照するモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-053-opt-3', 'card-dbt-ae-053', 3, 'D', 'staging タグのモデルを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-053-ans-0', 'card-dbt-ae-053', 'card-dbt-ae-053-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-054', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の設定で `+schema: staging` の効果は？
```yaml
models:
  my_project:
    staging:
      +schema: staging
      +materialized: view
```
- A. staging フォルダのモデルのスキーマ名を `target_schema_staging` にする
- B. staging フォルダのモデルを `staging` スキーマに出力する
- C. デフォルトの `generate_schema_name` マクロでは `target_schema_staging` になる
- D. A と C は同じ意味', '**正解: D**
デフォルトの `generate_schema_name` マクロでは `target_schema` + `_` + `custom_schema` 形式になる。マクロをオーバーライドすれば `staging` そのままにもできる。', 'https://docs.getdbt.com/docs/build/custom-schemas');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-054-opt-0', 'card-dbt-ae-054', 0, 'A', 'staging フォルダのモデルのスキーマ名を `target_schema_staging` にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-054-opt-1', 'card-dbt-ae-054', 1, 'B', 'staging フォルダのモデルを `staging` スキーマに出力する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-054-opt-2', 'card-dbt-ae-054', 2, 'C', 'デフォルトの `generate_schema_name` マクロでは `target_schema_staging` になる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-054-opt-3', 'card-dbt-ae-054', 3, 'D', 'A と C は同じ意味', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-054-ans-0', 'card-dbt-ae-054', 'card-dbt-ae-054-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-055', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'Jinja の `{% set %}` タグの用途は？
- A. 変数を定義する
- B. 条件分岐を行う
- C. ループを実行する
- D. マクロを定義する', '**正解: A**
`{% set my_var = ''value'' %}` のように変数を定義する。リストやディクショナリも代入可能。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-055-opt-0', 'card-dbt-ae-055', 0, 'A', '変数を定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-055-opt-1', 'card-dbt-ae-055', 1, 'B', '条件分岐を行う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-055-opt-2', 'card-dbt-ae-055', 2, 'C', 'ループを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-055-opt-3', 'card-dbt-ae-055', 3, 'D', 'マクロを定義する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-055-ans-0', 'card-dbt-ae-055', 'card-dbt-ae-055-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-056', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` でプロジェクト全体のモデルの materialization をデフォルト設定する正しい方法は？
- A. `materialized: table`（トップレベル）
- B. `models: { +materialized: table }`
- C. `config: { materialized: table }`
- D. `defaults: { materialized: table }`', '**正解: B**
`models:` キー配下で `+materialized` のように `+` プレフィックスを付けてconfig値を指定する。フォルダごとに異なる設定も可能。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-056-opt-0', 'card-dbt-ae-056', 0, 'A', '`materialized: table`（トップレベル）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-056-opt-1', 'card-dbt-ae-056', 1, 'B', '`models: { +materialized: table }`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-056-opt-2', 'card-dbt-ae-056', 2, 'C', '`config: { materialized: table }`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-056-opt-3', 'card-dbt-ae-056', 3, 'D', '`defaults: { materialized: table }`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-056-ans-0', 'card-dbt-ae-056', 'card-dbt-ae-056-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-057', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --select my_model --vars ''{"date_filter": "2024-01-01"}''` で `date_filter` 変数を使う方法は？
- A. `{{ var(''date_filter'') }}`
- B. `{{ env_var(''date_filter'') }}`
- C. `{{ config.date_filter }}`
- D. `{{ args.date_filter }}`', '**正解: A**
`--vars` で渡した変数は `{{ var(''date_filter'') }}` で参照する。`env_var()` は環境変数用。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-057-opt-0', 'card-dbt-ae-057', 0, 'A', '`{{ var(''date_filter'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-057-opt-1', 'card-dbt-ae-057', 1, 'B', '`{{ env_var(''date_filter'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-057-opt-2', 'card-dbt-ae-057', 2, 'C', '`{{ config.date_filter }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-057-opt-3', 'card-dbt-ae-057', 3, 'D', '`{{ args.date_filter }}`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-057-ans-0', 'card-dbt-ae-057', 'card-dbt-ae-057-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-058', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run` のデフォルトの `--threads` 値はどこで決まるか？
- A. dbt のハードコーディング値（4）
- B. `profiles.yml` の `threads` 設定
- C. CPUのコア数
- D. `dbt_project.yml` の `threads` 設定', '**正解: B**
デフォルトでは `profiles.yml` のターゲット設定の `threads` 値が使用される。コマンドラインの `--threads` フラグでオーバーライド可能。', 'https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-058-opt-0', 'card-dbt-ae-058', 0, 'A', 'dbt のハードコーディング値（4）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-058-opt-1', 'card-dbt-ae-058', 1, 'B', '`profiles.yml` の `threads` 設定', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-058-opt-2', 'card-dbt-ae-058', 2, 'C', 'CPUのコア数', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-058-opt-3', 'card-dbt-ae-058', 3, 'D', '`dbt_project.yml` の `threads` 設定', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-058-ans-0', 'card-dbt-ae-058', 'card-dbt-ae-058-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-059', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental materialization に関して正しい記述はどれか？
- A. 数百万行のデータセットで、行が追加のみされ更新されない場合に最適である
- B. 実行のたびに常に全テーブルが再構築される
- C. 上流モデルのスキーマ変更後は必ずDROPして再構築しなければならない
- D. `is_incremental()` マクロを使う必要はない
- E. データセットの大部分が毎回更新されるケースに適している', '**正解: A**
大量の行があり、新しいデータのみが追加される（既存行は更新されない）データセットに最適。毎回全再構築ではなく、新規データのみ変換処理する。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-059-opt-0', 'card-dbt-ae-059', 0, 'A', '数百万行のデータセットで、行が追加のみされ更新されない場合に最適である', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-059-opt-1', 'card-dbt-ae-059', 1, 'B', '実行のたびに常に全テーブルが再構築される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-059-opt-2', 'card-dbt-ae-059', 2, 'C', '上流モデルのスキーマ変更後は必ずDROPして再構築しなければならない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-059-opt-3', 'card-dbt-ae-059', 3, 'D', '`is_incremental()` マクロを使う必要はない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-059-opt-4', 'card-dbt-ae-059', 4, 'E', 'データセットの大部分が毎回更新されるケースに適している', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-059-ans-0', 'card-dbt-ae-059', 'card-dbt-ae-059-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-060', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'CTE（Common Table Expression）を使う利点を**2つ**選べ。
- A. クエリの可読性が向上する
- B. クエリのパフォーマンスが必ず向上する
- C. 複雑なロジックを段階的に構築できる
- D. DWHのストレージを節約する', '**正解: A, C**
CTEはクエリの論理を段階的に構築し、可読性を向上させる。パフォーマンスの向上は保証されない（DWHの最適化に依存）。', 'https://docs.getdbt.com/best-practices/how-we-structure/2-staging');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-060-opt-0', 'card-dbt-ae-060', 0, 'A', 'クエリの可読性が向上する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-060-opt-1', 'card-dbt-ae-060', 1, 'B', 'クエリのパフォーマンスが必ず向上する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-060-opt-2', 'card-dbt-ae-060', 2, 'C', '複雑なロジックを段階的に構築できる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-060-opt-3', 'card-dbt-ae-060', 3, 'D', 'DWHのストレージを節約する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-060-ans-0', 'card-dbt-ae-060', 'card-dbt-ae-060-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-060-ans-1', 'card-dbt-ae-060', 'card-dbt-ae-060-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-061', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のコードで `{% do %}` タグの効果は？
```sql
{% do log("Processing model: " ~ this, info=True) %}
```', '`{% do %}` はJinja式を**評価するが出力はしない**。`log()` 関数を呼び出してメッセージを出力するが、SQLには何も追加されない。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-062', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt で DRY 原則を実現する方法を**2つ**選べ。
- A. Jinja テンプレートで動的SQL生成
- B. 全モデルを1つのSQLファイルにまとめる
- C. マクロで再利用可能なコードスニペットを作成
- D. ephemeral materialization ですべてのモデルを定義する', '**正解: A, C**
- **Jinja テンプレート** — 条件分岐やループで動的SQL生成
- **マクロ** — 再利用可能なSQL/Jinjaコードのスニペット
他に、パッケージの利用やモジュラーなモデル設計（staging → intermediate → marts）もDRY原則に貢献する。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-062-opt-0', 'card-dbt-ae-062', 0, 'A', 'Jinja テンプレートで動的SQL生成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-062-opt-1', 'card-dbt-ae-062', 1, 'B', '全モデルを1つのSQLファイルにまとめる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-062-opt-2', 'card-dbt-ae-062', 2, 'C', 'マクロで再利用可能なコードスニペットを作成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-062-opt-3', 'card-dbt-ae-062', 3, 'D', 'ephemeral materialization ですべてのモデルを定義する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-062-ans-0', 'card-dbt-ae-062', 'card-dbt-ae-062-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-062-ans-1', 'card-dbt-ae-062', 'card-dbt-ae-062-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-063', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental モデルのスキーマ変更後にテーブルを最初から再構築するフラグは `--____` である。
- A. `--full-refresh`
- B. `--rebuild`
- C. `--force`
- D. `--drop-and-create`', '**正解: `--full-refresh`**
既存テーブルをDROPし、全データを再処理する。このフラグが付くと `is_incremental()` は False を返す。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-063-opt-0', 'card-dbt-ae-063', 0, 'A', '`--full-refresh`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-063-opt-1', 'card-dbt-ae-063', 1, 'B', '`--rebuild`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-063-opt-2', 'card-dbt-ae-063', 2, 'C', '`--force`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-063-opt-3', 'card-dbt-ae-063', 3, 'D', '`--drop-and-create`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-064', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'Python モデルで使用できない materialization はどれか？
- A. table
- B. incremental
- C. view
- D. A と B の両方', '**正解: C**
Python モデルは `table` か `incremental` のみ。**view と ephemeral は不可**。`def model(dbt, session):` 関数を定義し DataFrame を返す。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-064-opt-0', 'card-dbt-ae-064', 0, 'A', 'table', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-064-opt-1', 'card-dbt-ae-064', 1, 'B', 'incremental', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-064-opt-2', 'card-dbt-ae-064', 2, 'C', 'view', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-064-opt-3', 'card-dbt-ae-064', 3, 'D', 'A と B の両方', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-064-ans-0', 'card-dbt-ae-064', 'card-dbt-ae-064-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-065', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', '`is_incremental()` マクロが True を返す条件を**すべて**選べ。
- A. materialization が `incremental` である
- B. ターゲットテーブルがDWHに存在する
- C. `--full-refresh` フラグが付いていない
- D. 前回の実行が成功している', '**正解: A, B, C**
3つ**すべて**が満たされたときに True を返す。前回の実行結果（D）は条件に含まれない。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-065-opt-0', 'card-dbt-ae-065', 0, 'A', 'materialization が `incremental` である', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-065-opt-1', 'card-dbt-ae-065', 1, 'B', 'ターゲットテーブルがDWHに存在する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-065-opt-2', 'card-dbt-ae-065', 2, 'C', '`--full-refresh` フラグが付いていない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-065-opt-3', 'card-dbt-ae-065', 3, 'D', '前回の実行が成功している', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-065-ans-0', 'card-dbt-ae-065', 'card-dbt-ae-065-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-065-ans-1', 'card-dbt-ae-065', 'card-dbt-ae-065-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-065-ans-2', 'card-dbt-ae-065', 'card-dbt-ae-065-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-066', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'モデルで `{{ config(database=''other_db'') }}` を設定した効果は？
- A. 他のデータベースからデータを読み込む
- B. モデルの出力先データベースを `other_db` に変更する
- C. データベース間のジョインを有効にする
- D. データベースのバックアップを作成する', '**正解: B**
デフォルトではターゲットのデータベースにテーブルが作成されるが、`database` config でモデルごとに出力先を変更できる。', 'https://docs.getdbt.com/reference/dbt_project.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-066-opt-0', 'card-dbt-ae-066', 0, 'A', '他のデータベースからデータを読み込む', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-066-opt-1', 'card-dbt-ae-066', 1, 'B', 'モデルの出力先データベースを `other_db` に変更する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-066-opt-2', 'card-dbt-ae-066', 2, 'C', 'データベース間のジョインを有効にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-066-opt-3', 'card-dbt-ae-066', 3, 'D', 'データベースのバックアップを作成する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-066-ans-0', 'card-dbt-ae-066', 'card-dbt-ae-066-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-067', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '他のdbtモデルを参照してDAG上の依存関係を自動構築するマクロは `{{ ____ }}` である。
- A. `ref()`
- B. `source()`
- C. `config()`
- D. `this`', '**正解: `ref()`** → `{{ ref(''model_name'') }}`
ハードコーディングされたテーブル名の代わりに必ず使う。dbtが `ref()` から依存関係を認識して正しい実行順序を決定する。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-067-opt-0', 'card-dbt-ae-067', 0, 'A', '`ref()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-067-opt-1', 'card-dbt-ae-067', 1, 'B', '`source()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-067-opt-2', 'card-dbt-ae-067', 2, 'C', '`config()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-067-opt-3', 'card-dbt-ae-067', 3, 'D', '`this`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-068', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt で custom schema を設定した場合の実際のスキーマ名は？
- A. `custom_schema` で指定した値のみ
- B. `target.schema + ''_'' + custom_schema`（デフォルトマクロの動作）
- C. `target.schema` のみ（custom_schema は無視される）
- D. `custom_schema + ''_'' + target.schema`', '**正解: B**
デフォルトの `generate_schema_name` マクロは `target_schema_custom_schema` の形式を生成する。マクロをオーバーライドしてカスタマイズ可能。', 'https://docs.getdbt.com/docs/build/custom-schemas');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-068-opt-0', 'card-dbt-ae-068', 0, 'A', '`custom_schema` で指定した値のみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-068-opt-1', 'card-dbt-ae-068', 1, 'B', '`target.schema + ''_'' + custom_schema`（デフォルトマクロの動作）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-068-opt-2', 'card-dbt-ae-068', 2, 'C', '`target.schema` のみ（custom_schema は無視される）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-068-opt-3', 'card-dbt-ae-068', 3, 'D', '`custom_schema + ''_'' + target.schema`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-068-ans-0', 'card-dbt-ae-068', 'card-dbt-ae-068-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-069', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `analysis-paths` のデフォルト値は `____` である。
- A. `[''analyses'']`
- B. `[''analysis'']`
- C. `[''queries'']`
- D. `[''sql'']`', '**正解: `[''analyses'']`**
analysis ファイルはデフォルトで `analyses/` ディレクトリに配置する。', 'https://docs.getdbt.com/docs/build/analyses');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-069-opt-0', 'card-dbt-ae-069', 0, 'A', '`[''analyses'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-069-opt-1', 'card-dbt-ae-069', 1, 'B', '`[''analysis'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-069-opt-2', 'card-dbt-ae-069', 2, 'C', '`[''queries'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-069-opt-3', 'card-dbt-ae-069', 3, 'D', '`[''sql'']`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-070', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の selector YAML 定義の用途は？
```yaml
selectors:
  - name: nightly_run
    definition:
      union:
        - method: tag
          value: nightly
        - method: source
          value: stripe
          children: true
```', '**名前付きセレクター**を定義している。`dbt run --selector nightly_run` で、`nightly` タグのモデルと stripe ソースの下流モデルの**和集合**を実行する。', 'https://docs.getdbt.com/reference/commands/run');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-071', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'snapshot 新しいYAML構文（v1.9+）の記述方法として正しいものは？
- A. `snapshots/` ディレクトリにYAMLファイルで定義する
- B. `models/` ディレクトリにYAMLファイルで定義する
- C. `dbt_project.yml` に直接定義する
- D. `profiles.yml` に定義する', '**正解: A**
v1.9以降では snapshot を SQL の `{% snapshot %}` ブロックではなく、YAML 形式で定義できる。`relation:` で参照先を指定し、`config:` で strategy 等を設定する。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-071-opt-0', 'card-dbt-ae-071', 0, 'A', '`snapshots/` ディレクトリにYAMLファイルで定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-071-opt-1', 'card-dbt-ae-071', 1, 'B', '`models/` ディレクトリにYAMLファイルで定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-071-opt-2', 'card-dbt-ae-071', 2, 'C', '`dbt_project.yml` に直接定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-071-opt-3', 'card-dbt-ae-071', 3, 'D', '`profiles.yml` に定義する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-071-ans-0', 'card-dbt-ae-071', 'card-dbt-ae-071-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-072', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'プロジェクト内の CSV ファイルをDWHにテーブルとしてロードするコマンドは `dbt ____` である。
- A. `seed`
- B. `load`
- C. `import`
- D. `run`', '**正解: `seed`** → `dbt seed`
小さな参照テーブル（マッピングテーブルなど）に適している。大量データのロードには使わない。', 'https://docs.getdbt.com/docs/build/seeds');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-072-opt-0', 'card-dbt-ae-072', 0, 'A', '`seed`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-072-opt-1', 'card-dbt-ae-072', 1, 'B', '`load`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-072-opt-2', 'card-dbt-ae-072', 2, 'C', '`import`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-072-opt-3', 'card-dbt-ae-072', 3, 'D', '`run`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-073', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の設定で seed の `quote_columns` の効果は？
```yaml
seeds:
  my_project:
    +quote_columns: true
```', '**CSVのカラム名をクォート付きで DWH テーブルに作成する**。大文字小文字の区別が必要な場合や、予約語をカラム名に使う場合に必要。', 'https://docs.getdbt.com/docs/build/seeds');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-074', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental モデルで自身のテーブルを参照するマクロは `{{ ____ }}` である。
- A. `this`
- B. `self`
- C. `current`
- D. `target`', '**正解: `this`** → `{{ this }}`
`select max(event_date) from {{ this }}` のように、現在のモデルが出力するテーブル/ビューを参照する。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-074-opt-0', 'card-dbt-ae-074', 0, 'A', '`this`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-074-opt-1', 'card-dbt-ae-074', 1, 'B', '`self`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-074-opt-2', 'card-dbt-ae-074', 2, 'C', '`current`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-074-opt-3', 'card-dbt-ae-074', 3, 'D', '`target`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-075', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'Jinja でコメントを記述する正しい構文は？
- A. `{# コメント #}`
- B. `<!-- コメント -->`
- C. `{% comment %} コメント {% endcomment %}`
- D. `{{ -- コメント -- }}`', '**正解: A**
`{# ... #}` がJinjaのコメント構文。コンパイル後のSQLには出力されない。SQLコメント `--` や `/* */` はそのまま出力される。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-075-opt-0', 'card-dbt-ae-075', 0, 'A', '`{# コメント #}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-075-opt-1', 'card-dbt-ae-075', 1, 'B', '`<!-- コメント -->`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-075-opt-2', 'card-dbt-ae-075', 2, 'C', '`{% comment %} コメント {% endcomment %}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-075-opt-3', 'card-dbt-ae-075', 3, 'D', '`{{ -- コメント -- }}`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-075-ans-0', 'card-dbt-ae-075', 'card-dbt-ae-075-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-076', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt パッケージのインストールに必要な手順を**2つ**選べ。
- A. `dbt_project.yml` にパッケージを追加する
- B. `packages.yml` にパッケージを定義する
- C. `dbt deps` コマンドを実行する
- D. `dbt install` コマンドを実行する', '**正解: B, C**
`packages.yml` に定義 → `dbt deps` でインストール。`dbt_project.yml` ではなく `packages.yml` を使う。`dbt install` は存在しないコマンド。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-076-opt-0', 'card-dbt-ae-076', 0, 'A', '`dbt_project.yml` にパッケージを追加する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-076-opt-1', 'card-dbt-ae-076', 1, 'B', '`packages.yml` にパッケージを定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-076-opt-2', 'card-dbt-ae-076', 2, 'C', '`dbt deps` コマンドを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-076-opt-3', 'card-dbt-ae-076', 3, 'D', '`dbt install` コマンドを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-076-ans-0', 'card-dbt-ae-076', 'card-dbt-ae-076-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-076-ans-1', 'card-dbt-ae-076', 'card-dbt-ae-076-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-077', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'snapshot のデフォルト `strategy` は？
- A. `timestamp`
- B. `check`
- C. デフォルトはなく必ず指定が必要
- D. `merge`', '**正解: C**
snapshot の `strategy` にデフォルト値はなく、必ず `timestamp` または `check` を指定する必要がある。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-077-opt-0', 'card-dbt-ae-077', 0, 'A', '`timestamp`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-077-opt-1', 'card-dbt-ae-077', 1, 'B', '`check`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-077-opt-2', 'card-dbt-ae-077', 2, 'C', 'デフォルトはなく必ず指定が必要', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-077-opt-3', 'card-dbt-ae-077', 3, 'D', '`merge`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-077-ans-0', 'card-dbt-ae-077', 'card-dbt-ae-077-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-078', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt で `ref()` のクロスプロジェクト参照（dbt Mesh）を行う場合の構文は？
- A. `{{ ref(''other_project'', ''model_name'') }}`
- B. `{{ ref(''model_name'', project=''other_project'') }}`
- C. `{{ cross_ref(''other_project'', ''model_name'') }}`
- D. `{{ ref(''other_project.model_name'') }}`', '**正解: A**
dbt Mesh では `{{ ref(''project_name'', ''model_name'') }}` の2引数形式でクロスプロジェクト参照を行う。参照先モデルは `access: public` である必要がある。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-078-opt-0', 'card-dbt-ae-078', 0, 'A', '`{{ ref(''other_project'', ''model_name'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-078-opt-1', 'card-dbt-ae-078', 1, 'B', '`{{ ref(''model_name'', project=''other_project'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-078-opt-2', 'card-dbt-ae-078', 2, 'C', '`{{ cross_ref(''other_project'', ''model_name'') }}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-078-opt-3', 'card-dbt-ae-078', 3, 'D', '`{{ ref(''other_project.model_name'') }}`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-078-ans-0', 'card-dbt-ae-078', 'card-dbt-ae-078-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-079', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各 node selection syntax（左列）を、その選択対象（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `+my_model` | a. パスで選択 |
| 2. `my_model+` | b. my_model とその下流すべて |
| 3. `tag:nightly` | c. タグで選択 |
| 4. `path:models/staging` | d. my_model とその上流すべて |', '**1-d, 2-b, 3-c, 4-a**
| syntax | 選択対象 |
|---|---|
| `+my_model` → d | my_model と**上流すべて** |
| `my_model+` → b | my_model と**下流すべて** |
| `tag:nightly` → c | **タグ**で選択 |
| `path:models/staging` → a | **パス**で選択 |', 'https://docs.getdbt.com/reference/node-selection/syntax');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-0', 'card-dbt-ae-079', 0, '1', '+my_model', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-1', 'card-dbt-ae-079', 1, '2', 'my_model+', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-2', 'card-dbt-ae-079', 2, '3', 'tag:nightly', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-3', 'card-dbt-ae-079', 3, '4', 'path:models/staging', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-4', 'card-dbt-ae-079', 4, 'a', 'パスで選択', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-5', 'card-dbt-ae-079', 5, 'b', 'my_model とその下流すべて', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-6', 'card-dbt-ae-079', 6, 'c', 'タグで選択', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-079-opt-7', 'card-dbt-ae-079', 7, 'd', 'my_model とその上流すべて', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-079-ans-0', 'card-dbt-ae-079', 'card-dbt-ae-079-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-079-ans-1', 'card-dbt-ae-079', 'card-dbt-ae-079-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-079-ans-2', 'card-dbt-ae-079', 'card-dbt-ae-079-opt-2', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-079-ans-3', 'card-dbt-ae-079', 'card-dbt-ae-079-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-080', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`{{ this }}` マクロは何を参照するか？
- A. 現在のdbtプロジェクト
- B. 現在のモデルが出力するテーブル/ビューのリレーション
- C. 直前に実行されたモデル
- D. `dbt_project.yml` の設定', '**正解: B**
incremental モデルで `select max(id) from {{ this }}` のように、自身のテーブルを参照する際に使う。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-080-opt-0', 'card-dbt-ae-080', 0, 'A', '現在のdbtプロジェクト', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-080-opt-1', 'card-dbt-ae-080', 1, 'B', '現在のモデルが出力するテーブル/ビューのリレーション', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-080-opt-2', 'card-dbt-ae-080', 2, 'C', '直前に実行されたモデル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-080-opt-3', 'card-dbt-ae-080', 3, 'D', '`dbt_project.yml` の設定', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-080-ans-0', 'card-dbt-ae-080', 'card-dbt-ae-080-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-081', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`{{ var(''my_var'', ''default_value'') }}` で第2引数の役割は？
- A. 変数の型を指定する
- B. 環境変数が未設定の場合のデフォルト値
- C. `vars` に `my_var` が未定義の場合のデフォルト値
- D. 変数のバリデーションルール', '**正解: C**
`var()` の第2引数はデフォルト値。`dbt_project.yml` の `vars` や `--vars` フラグで定義されていない場合に使用される。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/var');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-081-opt-0', 'card-dbt-ae-081', 0, 'A', '変数の型を指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-081-opt-1', 'card-dbt-ae-081', 1, 'B', '環境変数が未設定の場合のデフォルト値', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-081-opt-2', 'card-dbt-ae-081', 2, 'C', '`vars` に `my_var` が未定義の場合のデフォルト値', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-081-opt-3', 'card-dbt-ae-081', 3, 'D', '変数のバリデーションルール', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-081-ans-0', 'card-dbt-ae-081', 'card-dbt-ae-081-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-082', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の snapshot 設定の問題点は？
```yaml
snapshots:
  - name: orders_snapshot
    relation: source(''jaffle_shop'', ''orders'')
    config:
      strategy: timestamp
      check_cols:
        - status
```', '**`timestamp` strategy には `updated_at` が必要**だが、代わりに `check_cols` が指定されている。`check_cols` は `check` strategy 用。
修正: `check_cols` を削除し、`updated_at: updated_at_column` を追加する。', 'https://docs.getdbt.com/docs/build/snapshots');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-083', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'staging モデルの設計原則として正しいものを**2つ**選べ。
- A. ソーステーブルと1:1の対応とする
- B. 複数のソースをJOINして結合する
- C. カラムのリネーム、型キャスト、基本的なクリーニングを行う
- D. 複雑なビジネスロジックを実装する', '**正解: A, C**
staging はソースと1:1で、リネーム・型変換・クリーニングのみ。JOIN やビジネスロジックは intermediate 以降で行う。', 'https://docs.getdbt.com/best-practices/how-we-structure/1-guide-overview');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-083-opt-0', 'card-dbt-ae-083', 0, 'A', 'ソーステーブルと1:1の対応とする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-083-opt-1', 'card-dbt-ae-083', 1, 'B', '複数のソースをJOINして結合する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-083-opt-2', 'card-dbt-ae-083', 2, 'C', 'カラムのリネーム、型キャスト、基本的なクリーニングを行う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-083-opt-3', 'card-dbt-ae-083', 3, 'D', '複雑なビジネスロジックを実装する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-083-ans-0', 'card-dbt-ae-083', 'card-dbt-ae-083-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-083-ans-1', 'card-dbt-ae-083', 'card-dbt-ae-083-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-084', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'snapshot テーブルの現在有効なレコードを取得するWHERE条件は？
- A. `WHERE dbt_valid_to IS NULL`
- B. `WHERE dbt_valid_from IS NOT NULL`
- C. `WHERE dbt_updated_at = (SELECT MAX(dbt_updated_at))`
- D. `WHERE dbt_scd_id IS NOT NULL`', '**正解: A**
`dbt_valid_to IS NULL` のレコードは現在有効（まだ無効化されていない）なレコード。過去の履歴レコードは `dbt_valid_to` に値が入っている。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-084-opt-0', 'card-dbt-ae-084', 0, 'A', '`WHERE dbt_valid_to IS NULL`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-084-opt-1', 'card-dbt-ae-084', 1, 'B', '`WHERE dbt_valid_from IS NOT NULL`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-084-opt-2', 'card-dbt-ae-084', 2, 'C', '`WHERE dbt_updated_at = (SELECT MAX(dbt_updated_at))`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-084-opt-3', 'card-dbt-ae-084', 3, 'D', '`WHERE dbt_scd_id IS NOT NULL`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-084-ans-0', 'card-dbt-ae-084', 'card-dbt-ae-084-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-085', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のモデルでビルド順序が不正になる原因箇所は？
```sql
select
  a.account_id,
  a.account_name,
  o.total_amount
from dbt_user.stg_accounts a
left join dbt_user.stg_opportunities o
  on a.account_id = o.account_id
```', '**5行目と6行目**のハードコーディングされたテーブル名が原因。
修正: `from {{ ref(''stg_accounts'') }} a` / `left join {{ ref(''stg_opportunities'') }} o`
`ref()` を使わないとdbtは依存関係を認識できず、ビルド順序を正しく決定できない。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-086', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '外部パッケージをインストールするコマンドは `dbt ____` である。
- A. `deps`
- B. `install`
- C. `packages`
- D. `init`', '**正解: `deps`** → `dbt deps`
`packages.yml` に定義されたパッケージをダウンロードしてインストールする。`dbt install` は存在しないコマンド。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-086-opt-0', 'card-dbt-ae-086', 0, 'A', '`deps`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-086-opt-1', 'card-dbt-ae-086', 1, 'B', '`install`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-086-opt-2', 'card-dbt-ae-086', 2, 'C', '`packages`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-086-opt-3', 'card-dbt-ae-086', 3, 'D', '`init`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-087', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'DAG上でモデルが失敗した場合、その影響は？
- A. 上流と下流の両方がスキップされる
- B. 下流のすべてのモデルがスキップされる
- C. 影響はなく他のモデルは通常通り実行される
- D. 全モデルの実行が停止する', '**正解: B**
失敗したモデルの**下流すべてのモデルがスキップ**される。上流には影響しない。`--fail-fast` をつけると最初のエラーで全体が停止する。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-087-opt-0', 'card-dbt-ae-087', 0, 'A', '上流と下流の両方がスキップされる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-087-opt-1', 'card-dbt-ae-087', 1, 'B', '下流のすべてのモデルがスキップされる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-087-opt-2', 'card-dbt-ae-087', 2, 'C', '影響はなく他のモデルは通常通り実行される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-087-opt-3', 'card-dbt-ae-087', 3, 'D', '全モデルの実行が停止する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-087-ans-0', 'card-dbt-ae-087', 'card-dbt-ae-087-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-088', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --target prod` の効果は？
- A. 本番環境のDWHに対してモデルを実行する
- B. prod という名前のモデルのみを実行する
- C. profiles.yml の prod ターゲットの接続情報を使用する
- D. 本番環境への自動デプロイを行う', '**正解: C**
`--target` フラグで `profiles.yml` の特定のターゲット（接続先環境）を指定する。通常は dev がデフォルト。', 'https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-088-opt-0', 'card-dbt-ae-088', 0, 'A', '本番環境のDWHに対してモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-088-opt-1', 'card-dbt-ae-088', 1, 'B', 'prod という名前のモデルのみを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-088-opt-2', 'card-dbt-ae-088', 2, 'C', 'profiles.yml の prod ターゲットの接続情報を使用する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-088-opt-3', 'card-dbt-ae-088', 3, 'D', '本番環境への自動デプロイを行う', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-088-ans-0', 'card-dbt-ae-088', 'card-dbt-ae-088-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-089', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のコマンドで `--vars` フラグの効果は？
```bash
dbt run --vars ''{"start_date": "2024-06-01"}''
```', '**`dbt_project.yml` の `vars` で定義された `start_date` をオーバーライド**して `''2024-06-01''` に設定する。モデル内の `{{ var(''start_date'') }}` がこの値を返す。', 'https://docs.getdbt.com/reference/commands/run');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-090', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `clean-targets` の用途は？
- A. `dbt clean` コマンドで削除するディレクトリを指定する
- B. テーブルのクリーンアップ対象を指定する
- C. ログのクリーンアップ設定を行う
- D. 不要なモデルを自動削除する', '**正解: A**
`clean-targets: ["target", "dbt_packages"]` のように `dbt clean` で削除するディレクトリを指定する。', 'https://docs.getdbt.com/reference/commands/clean');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-090-opt-0', 'card-dbt-ae-090', 0, 'A', '`dbt clean` コマンドで削除するディレクトリを指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-090-opt-1', 'card-dbt-ae-090', 1, 'B', 'テーブルのクリーンアップ対象を指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-090-opt-2', 'card-dbt-ae-090', 2, 'C', 'ログのクリーンアップ設定を行う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-090-opt-3', 'card-dbt-ae-090', 3, 'D', '不要なモデルを自動削除する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-090-ans-0', 'card-dbt-ae-090', 'card-dbt-ae-090-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-091', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` で `on-run-start` にSQLを設定する例として正しいものは？
```yaml
on-run-start:
  - "CREATE SCHEMA IF NOT EXISTS {{ target.schema }}"
```
この設定の効果は？', '**dbt run 開始前に**ターゲットスキーマが存在しない場合に作成する。`on-run-start` はdbt実行の最初に実行されるフック。Jinjaテンプレートも使用可能。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-092', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'metric の `type` として有効なものをすべて選べ。
- A. `simple`
- B. `ratio`
- C. `cumulative`
- D. `average`
- E. `derived`', '**正解: A, B, C, E**
- `simple` — 単一メジャーの直接参照
- `ratio` — 2つのメトリクスの比率
- `cumulative` — 累積値
- `derived` — 他のメトリクスから導出
`average` は metric type ではなく、measure の `agg` タイプ。', 'https://docs.getdbt.com/docs/build/about-metricflow');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-092-opt-0', 'card-dbt-ae-092', 0, 'A', '`simple`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-092-opt-1', 'card-dbt-ae-092', 1, 'B', '`ratio`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-092-opt-2', 'card-dbt-ae-092', 2, 'C', '`cumulative`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-092-opt-3', 'card-dbt-ae-092', 3, 'D', '`average`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-092-opt-4', 'card-dbt-ae-092', 4, 'E', '`derived`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-092-ans-0', 'card-dbt-ae-092', 'card-dbt-ae-092-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-092-ans-1', 'card-dbt-ae-092', 'card-dbt-ae-092-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-092-ans-2', 'card-dbt-ae-092', 'card-dbt-ae-092-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-092-ans-3', 'card-dbt-ae-092', 'card-dbt-ae-092-opt-4', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-093', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_utils` パッケージの `generate_surrogate_key` マクロの用途は？
- A. 暗号化キーを生成する
- B. 複数カラムからハッシュベースのサロゲートキーを生成する
- C. 自動インクリメントのIDを生成する
- D. 外部キー制約を追加する', '**正解: B**
`{{ dbt_utils.generate_surrogate_key([''col1'', ''col2'']) }}` で複数カラムからユニークなハッシュキーを生成する。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-093-opt-0', 'card-dbt-ae-093', 0, 'A', '暗号化キーを生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-093-opt-1', 'card-dbt-ae-093', 1, 'B', '複数カラムからハッシュベースのサロゲートキーを生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-093-opt-2', 'card-dbt-ae-093', 2, 'C', '自動インクリメントのIDを生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-093-opt-3', 'card-dbt-ae-093', 3, 'D', '外部キー制約を追加する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-093-ans-0', 'card-dbt-ae-093', 'card-dbt-ae-093-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-094', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental モデルで重複排除に使うキーを指定する設定は `____` である。
- A. `unique_key`
- B. `primary_key`
- C. `merge_key`
- D. `dedup_key`', '**正解: `unique_key`**
`{{ config(materialized=''incremental'', unique_key=''id'') }}`
merge / delete+insert 戦略で、新データと既存データを一致させるカラムを指定する。', 'https://docs.getdbt.com/docs/build/incremental-strategy');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-094-opt-0', 'card-dbt-ae-094', 0, 'A', '`unique_key`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-094-opt-1', 'card-dbt-ae-094', 1, 'B', '`primary_key`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-094-opt-2', 'card-dbt-ae-094', 2, 'C', '`merge_key`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-094-opt-3', 'card-dbt-ae-094', 3, 'D', '`dedup_key`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-095', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各 profiles.yml のキー（左列）を、その設定内容（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `type` | a. デフォルトで使用するターゲット環境名 |
| 2. `threads` | b. DWH上のスキーマ名 |
| 3. `schema` | c. 並列実行数 |
| 4. `target` | d. DWHアダプターの種類（snowflake, bigquery等） |', '**1-d, 2-c, 3-b, 4-a**
| キー | 設定 |
|---|---|
| `type` → d | DWHアダプター（snowflake, bigquery等） |
| `threads` → c | 並列実行数 |
| `schema` → b | DWH上のスキーマ名 |
| `target` → a | デフォルトターゲット環境名 |', 'https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-0', 'card-dbt-ae-095', 0, '1', 'type', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-1', 'card-dbt-ae-095', 1, '2', 'threads', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-2', 'card-dbt-ae-095', 2, '3', 'schema', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-3', 'card-dbt-ae-095', 3, '4', 'target', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-4', 'card-dbt-ae-095', 4, 'a', 'デフォルトで使用するターゲット環境名', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-5', 'card-dbt-ae-095', 5, 'b', 'DWH上のスキーマ名', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-6', 'card-dbt-ae-095', 6, 'c', '並列実行数', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-095-opt-7', 'card-dbt-ae-095', 7, 'd', 'DWHアダプターの種類（snowflake, bigquery等）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-095-ans-0', 'card-dbt-ae-095', 'card-dbt-ae-095-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-095-ans-1', 'card-dbt-ae-095', 'card-dbt-ae-095-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-095-ans-2', 'card-dbt-ae-095', 'card-dbt-ae-095-opt-2', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-095-ans-3', 'card-dbt-ae-095', 'card-dbt-ae-095-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-096', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の post-hook 設定で、テーブルに対して行われる操作は？
```sql
{{ config(
    materialized=''table'',
    post_hook="GRANT SELECT ON {{ this }} TO ROLE reporter"
) }}
```', 'テーブルのビルド完了後に、`reporter` ロールに **SELECT 権限を付与**する。`{{ this }}` は現在のモデルのテーブル名に展開される。', 'https://docs.getdbt.com/docs/build/materializations');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-097', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のsnapshot YAML定義の各要素の役割を対応させよ。
```yaml
snapshots:
  - name: orders_snapshot
    relation: source(''jaffle_shop'', ''orders'')
    config:
      unique_key: id
      strategy: timestamp
      updated_at: updated_at
```
| 左列 | 右列 |
|---|---|
| 1. `relation` | a. 変更検出方法 |
| 2. `unique_key` | b. スナップショットのソースリレーション |
| 3. `strategy` | c. 各行を一意に識別するカラム |
| 4. `updated_at` | d. 変更検出に使うタイムスタンプカラム |', '**1-b, 2-c, 3-a, 4-d**
| 要素 | 役割 |
|---|---|
| `relation` → b | ソースリレーション |
| `unique_key` → c | 一意識別カラム |
| `strategy` → a | 変更検出方法 |
| `updated_at` → d | タイムスタンプカラム |', 'https://docs.getdbt.com/docs/build/snapshots');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-098', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'semantic model の3つの主要コンポーネントを**すべて**選べ。
- A. entities
- B. dimensions
- C. measures
- D. filters', '**正解: A, B, C**
- **entities** — ジョインキーとなるエンティティ
- **dimensions** — 分析軸（カテゴリ、時間等）
- **measures** — 集約計算（sum, count, average等）
filters は semantic model のコンポーネントではなくクエリ時のパラメータ。', 'https://docs.getdbt.com/docs/build/semantic-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-098-opt-0', 'card-dbt-ae-098', 0, 'A', 'entities', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-098-opt-1', 'card-dbt-ae-098', 1, 'B', 'dimensions', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-098-opt-2', 'card-dbt-ae-098', 2, 'C', 'measures', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-098-opt-3', 'card-dbt-ae-098', 3, 'D', 'filters', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-098-ans-0', 'card-dbt-ae-098', 'card-dbt-ae-098-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-098-ans-1', 'card-dbt-ae-098', 'card-dbt-ae-098-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-098-ans-2', 'card-dbt-ae-098', 'card-dbt-ae-098-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-099', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の incremental モデルの問題点は？
```sql
{{ config(
    materialized=''incremental'',
    incremental_strategy=''append''
) }}
select * from {{ ref(''stg_events'') }}
{% if is_incremental() %}
where event_date > (select max(event_date) from {{ this }})
{% endif %}
```', '`append` strategy は重複チェックを行わないため、**`unique_key` なしで WHERE 条件を使うと、境界値のデータが重複する可能性がある**。`merge` や `delete+insert` strategy で `unique_key` を指定するか、WHERE条件を `>=` ではなく厳密に管理する必要がある。', 'https://docs.getdbt.com/docs/build/incremental-strategy');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-100', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-1', 'incremental モデルの2回目以降の実行で起きることを、以下から正しい順序に並べよ。
ステップ:
- (a) `incremental_strategy` に従って INSERT/MERGE
- (b) `is_incremental()` が True を返す
- (c) WHERE句で新規データのみフィルタ
- (d) ターゲットテーブルの存在を確認', '**正解: d → b → c → a**
1. **(d)** ターゲットテーブルが**存在する**ことを確認
2. **(b)** `is_incremental()` が **True** を返す
3. **(c)** WHERE句で**新規データのみ**フィルタ
4. **(a)** `incremental_strategy` に従って INSERT/MERGE
※ 初回実行では (d) でテーブルが存在しないため `is_incremental()` は False → 全データを処理して CREATE。', 'https://docs.getdbt.com/docs/build/incremental-strategy');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-100-opt-0', 'card-dbt-ae-100', 0, 'a', '`incremental_strategy` に従って INSERT/MERGE', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-100-opt-1', 'card-dbt-ae-100', 1, 'b', '`is_incremental()` が True を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-100-opt-2', 'card-dbt-ae-100', 2, 'c', 'WHERE句で新規データのみフィルタ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-100-opt-3', 'card-dbt-ae-100', 3, 'd', 'ターゲットテーブルの存在を確認', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-100-ans-0', 'card-dbt-ae-100', 'card-dbt-ae-100-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-100-ans-1', 'card-dbt-ae-100', 'card-dbt-ae-100-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-100-ans-2', 'card-dbt-ae-100', 'card-dbt-ae-100-opt-2', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-100-ans-3', 'card-dbt-ae-100', 'card-dbt-ae-100-opt-0', NULL, 3);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-101', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', '`method:` セレクターの種類として正しいものを**3つ**選べ。
- A. `tag:`
- B. `source:`
- C. `config.materialized:`
- D. `schema:`', '**正解: A, B, C**
- `tag:nightly` — タグで選択
- `source:stripe` — ソースで選択
- `config.materialized:incremental` — config値で選択
`schema:` は有効なセレクターメソッドではない。なお `file:` と `path:` はどちらも有効。', 'https://docs.getdbt.com/reference/node-selection/methods');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-101-opt-0', 'card-dbt-ae-101', 0, 'A', '`tag:`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-101-opt-1', 'card-dbt-ae-101', 1, 'B', '`source:`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-101-opt-2', 'card-dbt-ae-101', 2, 'C', '`config.materialized:`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-101-opt-3', 'card-dbt-ae-101', 3, 'D', '`schema:`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-101-ans-0', 'card-dbt-ae-101', 'card-dbt-ae-101-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-101-ans-1', 'card-dbt-ae-101', 'card-dbt-ae-101-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-101-ans-2', 'card-dbt-ae-101', 'card-dbt-ae-101-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-102', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の grants 設定で付与される権限は？
```yaml
models:
  - name: fct_orders
    config:
      grants:
        select: [''analyst_role'']
        insert: [''etl_role'']
```', '- `analyst_role` に **SELECT** 権限を付与
- `etl_role` に **INSERT** 権限を付与
モデルのビルド後に自動的にGRANT文が実行される。', 'https://docs.getdbt.com/reference/resource-configs/grants');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-103', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下の Jinja コードで `{% if execute %}` ガードが必要な理由は？
```sql
{% set results = run_query("select distinct status from " ~ ref(''orders'')) %}
```', '**dbtの parse フェーズでは `run_query` が実行できない**ため、`{% if execute %}` で実行フェーズでのみクエリを実行するようガードする必要がある。parse フェーズでは DWH 接続がない。', 'https://docs.getdbt.com/docs/build/jinja-macros');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-104', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-1', '各 dbt フック（左列）を、その実行タイミング（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `on_run_start` | a. 個別モデルの実行後 |
| 2. `on_run_end` | b. dbt run の完了後 |
| 3. `pre-hook` | c. dbt run の開始前 |
| 4. `post-hook` | d. 個別モデルの実行前 |', '**1-c, 2-b, 3-d, 4-a**
| フック | タイミング |
|---|---|
| `on_run_start` → c | dbt run の**開始前**（例: 権限設定、一時テーブル作成） |
| `on_run_end` → b | dbt run の**完了後**（例: クリーンアップ、通知） |
| `pre-hook` → d | 個別モデルの**実行前** |
| `post-hook` → a | 個別モデルの**実行後** |', 'https://docs.getdbt.com/reference/resource-configs/pre-hook-post-hook');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-0', 'card-dbt-ae-104', 0, '1', 'on_run_start', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-1', 'card-dbt-ae-104', 1, '2', 'on_run_end', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-2', 'card-dbt-ae-104', 2, '3', 'pre-hook', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-3', 'card-dbt-ae-104', 3, '4', 'post-hook', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-4', 'card-dbt-ae-104', 4, 'a', '個別モデルの実行後', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-5', 'card-dbt-ae-104', 5, 'b', 'dbt run の完了後', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-6', 'card-dbt-ae-104', 6, 'c', 'dbt run の開始前', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-104-opt-7', 'card-dbt-ae-104', 7, 'd', '個別モデルの実行前', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-104-ans-0', 'card-dbt-ae-104', 'card-dbt-ae-104-opt-0', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-104-ans-1', 'card-dbt-ae-104', 'card-dbt-ae-104-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-104-ans-2', 'card-dbt-ae-104', 'card-dbt-ae-104-opt-2', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-104-ans-3', 'card-dbt-ae-104', 'card-dbt-ae-104-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-105', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のYAMLはどのdbt機能の定義か？
```yaml
semantic_models:
  - name: orders
    model: ref(''fct_orders'')
    entities:
      - name: order_id
        type: primary
    dimensions:
      - name: order_date
        type: time
    measures:
      - name: total_revenue
        agg: sum
        expr: amount
```', '**semantic model** の定義。エンティティ（ジョインキー）、ディメンション（分析軸）、メジャー（集約指標）を定義し、dbt semantic layer でメトリクスを構築するための基盤。', 'https://docs.getdbt.com/docs/build/semantic-models');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-106', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'window 関数を使ったモデルで、最新レコードのみを取得する dbt の一般的なパターンは？
- A. `ROW_NUMBER()` で番号を振り `WHERE row_num = 1` でフィルタ
- B. `FIRST_VALUE()` で最新行を取得
- C. `DISTINCT ON` で重複排除
- D. `GROUP BY` + `MAX()` で最新タイムスタンプを取得', '**ROW_NUMBER + qualify/where パターン**:
```sql
with ranked as (
    select *,
        row_number() over (
            partition by user_id
            order by updated_at desc
        ) as row_num
    from {{ ref(''stg_events'') }}
)
select * from ranked where row_num = 1
```
SCD Type 2 の代替として、最新のレコードだけを取得するデデュープパターン。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-106-opt-0', 'card-dbt-ae-106', 0, 'A', '`ROW_NUMBER()` で番号を振り `WHERE row_num = 1` でフィルタ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-106-opt-1', 'card-dbt-ae-106', 1, 'B', '`FIRST_VALUE()` で最新行を取得', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-106-opt-2', 'card-dbt-ae-106', 2, 'C', '`DISTINCT ON` で重複排除', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-106-opt-3', 'card-dbt-ae-106', 3, 'D', '`GROUP BY` + `MAX()` で最新タイムスタンプを取得', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-107', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt の node selection syntax で正しいものを**3つ**選べ。
- A. `dbt run --select +my_model` — my_modelとその上流すべて
- B. `dbt run --select my_model+` — my_modelとその下流すべて
- C. `dbt run --select my_model*` — my_modelとワイルドカード一致
- D. `dbt run --select tag:nightly` — タグで選択', '**正解: A, B, D**
`+` は上流（前置）と下流（後置）を示す。`*` はワイルドカードセレクターとしては使わない。他にも `path:` でパス指定が可能。', 'https://docs.getdbt.com/reference/node-selection/syntax');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-107-opt-0', 'card-dbt-ae-107', 0, 'A', '`dbt run --select +my_model` — my_modelとその上流すべて', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-107-opt-1', 'card-dbt-ae-107', 1, 'B', '`dbt run --select my_model+` — my_modelとその下流すべて', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-107-opt-2', 'card-dbt-ae-107', 2, 'C', '`dbt run --select my_model*` — my_modelとワイルドカード一致', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-107-opt-3', 'card-dbt-ae-107', 3, 'D', '`dbt run --select tag:nightly` — タグで選択', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-107-ans-0', 'card-dbt-ae-107', 'card-dbt-ae-107-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-107-ans-1', 'card-dbt-ae-107', 'card-dbt-ae-107-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-107-ans-2', 'card-dbt-ae-107', 'card-dbt-ae-107-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-108', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `name` フィールドの制約は？
- A. ハイフンは使用できず、アルファベットとアンダースコアのみ
- B. 任意の文字列が使用可能
- C. 数字で始まる必要がある
- D. 大文字のみ使用可能', '**正解: A**
プロジェクト名はPythonの識別子規則に従い、アルファベット・数字・アンダースコアのみ使用可能。ハイフンは不可。', 'https://docs.getdbt.com/reference/project-configs/name');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-108-opt-0', 'card-dbt-ae-108', 0, 'A', 'ハイフンは使用できず、アルファベットとアンダースコアのみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-108-opt-1', 'card-dbt-ae-108', 1, 'B', '任意の文字列が使用可能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-108-opt-2', 'card-dbt-ae-108', 2, 'C', '数字で始まる必要がある', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-108-opt-3', 'card-dbt-ae-108', 3, 'D', '大文字のみ使用可能', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-108-ans-0', 'card-dbt-ae-108', 'card-dbt-ae-108-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-109', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental モデルで `merge` strategy を使用する場合、DWH側で必要な機能は？
- A. MERGE INTO 文のサポート
- B. パーティショニング機能
- C. マテリアライズドビュー機能
- D. ストリーミング挿入機能', '**正解: A**
`merge` strategy は DWH の `MERGE INTO` 文（UPSERT）を使用する。Snowflake, BigQuery, Databricks 等でサポートされている。', 'https://docs.getdbt.com/docs/build/incremental-strategy');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-109-opt-0', 'card-dbt-ae-109', 0, 'A', 'MERGE INTO 文のサポート', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-109-opt-1', 'card-dbt-ae-109', 1, 'B', 'パーティショニング機能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-109-opt-2', 'card-dbt-ae-109', 2, 'C', 'マテリアライズドビュー機能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-109-opt-3', 'card-dbt-ae-109', 3, 'D', 'ストリーミング挿入機能', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-109-ans-0', 'card-dbt-ae-109', 'card-dbt-ae-109-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-110', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '以下のコードで使われている Jinja フィルタの効果は？
```sql
{{ column_name | upper }}
```
- A. カラム名を大文字に変換して出力する
- B. カラムの値を大文字にするSQL関数を生成する
- C. カラムをソート基準にする
- D. カラムに上限値を設定する', '**正解: A**
Jinja フィルタ `| upper` はテンプレート展開時に文字列を大文字に変換する。SQL関数ではなくJinja処理。`column_name` が `"status"` なら `STATUS` が出力される。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-110-opt-0', 'card-dbt-ae-110', 0, 'A', 'カラム名を大文字に変換して出力する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-110-opt-1', 'card-dbt-ae-110', 1, 'B', 'カラムの値を大文字にするSQL関数を生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-110-opt-2', 'card-dbt-ae-110', 2, 'C', 'カラムをソート基準にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-110-opt-3', 'card-dbt-ae-110', 3, 'D', 'カラムに上限値を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-110-ans-0', 'card-dbt-ae-110', 'card-dbt-ae-110-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-111', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'snapshot で使用可能な strategy を**2つ**選べ。
- A. timestamp
- B. check
- C. merge
- D. append', '**正解: A, B**
- **timestamp** — `updated_at` カラムで変更を検出
- **check** — `check_cols` で指定したカラムの値変化を検出
merge や append は incremental strategy であり、snapshot strategy ではない。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-111-opt-0', 'card-dbt-ae-111', 0, 'A', 'timestamp', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-111-opt-1', 'card-dbt-ae-111', 1, 'B', 'check', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-111-opt-2', 'card-dbt-ae-111', 2, 'C', 'merge', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-111-opt-3', 'card-dbt-ae-111', 3, 'D', 'append', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-111-ans-0', 'card-dbt-ae-111', 'card-dbt-ae-111-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-111-ans-1', 'card-dbt-ae-111', 'card-dbt-ae-111-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-112', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt で環境変数を参照するマクロは `{{ ____ }}` である。
- A. `env_var()`
- B. `get_env()`
- C. `os.environ()`
- D. `env()`', '**正解: `env_var()`** → `{{ env_var(''DBT_TARGET'') }}`
`profiles.yml` や `dbt_project.yml` 内でも使用可能。デフォルト値を第2引数で指定できる: `{{ env_var(''MY_VAR'', ''default'') }}`', 'https://docs.getdbt.com/reference/dbt-jinja-functions/env_var');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-112-opt-0', 'card-dbt-ae-112', 0, 'A', '`env_var()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-112-opt-1', 'card-dbt-ae-112', 1, 'B', '`get_env()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-112-opt-2', 'card-dbt-ae-112', 2, 'C', '`os.environ()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-112-opt-3', 'card-dbt-ae-112', 3, 'D', '`env()`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-113', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental モデルで大量データのパフォーマンスを最適化するための `where` 句パターンは？
- A. `{% if is_incremental() %}` で新規データのみ処理し `{{ this }}` で現在のテーブルを参照
- B. `WHERE _load_date = CURRENT_DATE` で当日分のみ処理
- C. `LIMIT` 句で処理行数を制限
- D. `WHERE` 句は不要、`incremental_strategy` が自動的に最適化する', '**`is_incremental()` マクロ**を使って新規データのみを処理する:
```sql
select * from {{ source(''events'', ''raw'') }}
{% if is_incremental() %}
where event_date > (select max(event_date) from {{ this }})
{% endif %}
```
`{{ this }}` は現在のモデルのテーブルを参照する。フルリフレッシュ時は WHERE 句がスキップされる。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-113-opt-0', 'card-dbt-ae-113', 0, 'A', '`{% if is_incremental() %}` で新規データのみ処理し `{{ this }}` で現在のテーブルを参照', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-113-opt-1', 'card-dbt-ae-113', 1, 'B', '`WHERE _load_date = CURRENT_DATE` で当日分のみ処理', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-113-opt-2', 'card-dbt-ae-113', 2, 'C', '`LIMIT` 句で処理行数を制限', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-113-opt-3', 'card-dbt-ae-113', 3, 'D', '`WHERE` 句は不要、`incremental_strategy` が自動的に最適化する', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-114', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'microbatch strategy の `lookback` パラメータの役割は？
- A. 過去のバッチ数を指定して再処理する
- B. 将来のバッチ数を先読みする
- C. バッチサイズを制限する
- D. タイムアウト時間を設定する', '**正解: A**
遅延データ（late-arriving data）に対応するため、指定した数の過去バッチも再処理する。', 'https://docs.getdbt.com/docs/build/incremental-microbatch');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-114-opt-0', 'card-dbt-ae-114', 0, 'A', '過去のバッチ数を指定して再処理する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-114-opt-1', 'card-dbt-ae-114', 1, 'B', '将来のバッチ数を先読みする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-114-opt-2', 'card-dbt-ae-114', 2, 'C', 'バッチサイズを制限する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-114-opt-3', 'card-dbt-ae-114', 3, 'D', 'タイムアウト時間を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-114-ans-0', 'card-dbt-ae-114', 'card-dbt-ae-114-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-115', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'Jinja フィルタ `| trim` の効果は？
- A. 文字列の先頭と末尾の空白を除去する
- B. 文字列を切り詰める
- C. NULL値を空文字に変換する
- D. 文字列の大文字小文字を変換する', '**正解: A**
`{{ " hello " | trim }}` → `hello`。Python の `str.strip()` と同様。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-115-opt-0', 'card-dbt-ae-115', 0, 'A', '文字列の先頭と末尾の空白を除去する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-115-opt-1', 'card-dbt-ae-115', 1, 'B', '文字列を切り詰める', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-115-opt-2', 'card-dbt-ae-115', 2, 'C', 'NULL値を空文字に変換する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-115-opt-3', 'card-dbt-ae-115', 3, 'D', '文字列の大文字小文字を変換する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-115-ans-0', 'card-dbt-ae-115', 'card-dbt-ae-115-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-116', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`insert_overwrite` strategy が特に効果的なDWHとユースケースは？
- A. Snowflake での少量データ更新
- B. BigQuery でのパーティションテーブルの部分更新
- C. Redshift での全テーブル再作成
- D. PostgreSQL でのストリーミング挿入', '**正解: B**
`insert_overwrite` はパーティション単位で上書きするため、BigQuery のパーティションテーブルで特に効果的。対象パーティションのみ再処理される。', 'https://docs.getdbt.com/docs/build/incremental-strategy');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-116-opt-0', 'card-dbt-ae-116', 0, 'A', 'Snowflake での少量データ更新', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-116-opt-1', 'card-dbt-ae-116', 1, 'B', 'BigQuery でのパーティションテーブルの部分更新', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-116-opt-2', 'card-dbt-ae-116', 2, 'C', 'Redshift での全テーブル再作成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-116-opt-3', 'card-dbt-ae-116', 3, 'D', 'PostgreSQL でのストリーミング挿入', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-116-ans-0', 'card-dbt-ae-116', 'card-dbt-ae-116-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-117', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'snapshot が実現するデータモデリングパターンは何か？
- A. SCD Type 1（上書き）
- B. SCD Type 2（履歴保持）
- C. SCD Type 3（前回値カラム追加）
- D. SCD Type 6（ハイブリッド）', '**正解: B**
snapshot は**SCD Type 2**を実現する。変更があった行を新しいレコードとして追加し、古いレコードの `dbt_valid_to` を設定して履歴を保持する。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-117-opt-0', 'card-dbt-ae-117', 0, 'A', 'SCD Type 1（上書き）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-117-opt-1', 'card-dbt-ae-117', 1, 'B', 'SCD Type 2（履歴保持）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-117-opt-2', 'card-dbt-ae-117', 2, 'C', 'SCD Type 3（前回値カラム追加）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-117-opt-3', 'card-dbt-ae-117', 3, 'D', 'SCD Type 6（ハイブリッド）', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-117-ans-0', 'card-dbt-ae-117', 'card-dbt-ae-117-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-118', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `require-dbt-version` 設定の目的は？
- A. 特定のdbtバージョンでのみプロジェクトを実行可能にする
- B. dbtの自動アップデートを設定する
- C. dbtのバージョンをログに記録する
- D. パッケージのバージョンを固定する', '**正解: A**
`require-dbt-version: [">=1.7.0", "<2.0.0"]` のようにバージョン範囲を指定して、互換性のないdbtバージョンでの実行を防ぐ。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-118-opt-0', 'card-dbt-ae-118', 0, 'A', '特定のdbtバージョンでのみプロジェクトを実行可能にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-118-opt-1', 'card-dbt-ae-118', 1, 'B', 'dbtの自動アップデートを設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-118-opt-2', 'card-dbt-ae-118', 2, 'C', 'dbtのバージョンをログに記録する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-118-opt-3', 'card-dbt-ae-118', 3, 'D', 'パッケージのバージョンを固定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-118-ans-0', 'card-dbt-ae-118', 'card-dbt-ae-118-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-119', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'CI環境で変更された incremental モデルとその下流のみをクローンするコマンドは？
- A. `dbt clone --select state:modified+,config.materialized:incremental,state:old --state path/to/artifacts`
- B. `dbt clone --select state:modified --state path/to/artifacts`
- C. `dbt run --select state:modified+ --full-refresh --state path/to/artifacts`
- D. `dbt clone --all --state path/to/artifacts`', '```bash
dbt clone --select state:modified+,config.materialized:incremental,state:old --state path/to/artifacts
```
`state:modified+` で変更モデル+下流、`config.materialized:incremental` で incremental のみ、`state:old` で以前から存在するモデルに絞る。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-119-opt-0', 'card-dbt-ae-119', 0, 'A', '`dbt clone --select state:modified+,config.materialized:incremental,state:old --state path/to/artifacts`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-119-opt-1', 'card-dbt-ae-119', 1, 'B', '`dbt clone --select state:modified --state path/to/artifacts`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-119-opt-2', 'card-dbt-ae-119', 2, 'C', '`dbt run --select state:modified+ --full-refresh --state path/to/artifacts`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-119-opt-3', 'card-dbt-ae-119', 3, 'D', '`dbt clone --all --state path/to/artifacts`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-120', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'snapshot を定義するファイルの格納先ディレクトリは `____` である。
- A. `snapshots/`
- B. `models/`
- C. `tests/`
- D. `macros/`', '**正解: `snapshots/`**
デフォルトでは `snapshots/` ディレクトリに配置する。`dbt_project.yml` の `snapshot-paths` でカスタマイズ可能。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-120-opt-0', 'card-dbt-ae-120', 0, 'A', '`snapshots/`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-120-opt-1', 'card-dbt-ae-120', 1, 'B', '`models/`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-120-opt-2', 'card-dbt-ae-120', 2, 'C', '`tests/`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-120-opt-3', 'card-dbt-ae-120', 3, 'D', '`macros/`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-121', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt ls` コマンドの用途は？
- A. ファイルシステムの内容を一覧表示する
- B. プロジェクト内のリソース（モデル、テスト等）を一覧表示する
- C. DWH上のテーブルを一覧表示する
- D. 実行ログを一覧表示する', '**正解: B**
`dbt ls` (`dbt list`) はプロジェクト内のリソースをセレクターでフィルタして一覧表示する。`--select` や `--resource-type` でフィルタ可能。', 'https://docs.getdbt.com/reference/commands/list');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-121-opt-0', 'card-dbt-ae-121', 0, 'A', 'ファイルシステムの内容を一覧表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-121-opt-1', 'card-dbt-ae-121', 1, 'B', 'プロジェクト内のリソース（モデル、テスト等）を一覧表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-121-opt-2', 'card-dbt-ae-121', 2, 'C', 'DWH上のテーブルを一覧表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-121-opt-3', 'card-dbt-ae-121', 3, 'D', '実行ログを一覧表示する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-121-ans-0', 'card-dbt-ae-121', 'card-dbt-ae-121-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-122', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run --select @my_model` の `@` 演算子の意味は？
- A. my_model のみを実行
- B. my_model の上流と下流すべてを実行
- C. my_model を参照する他のモデルのテストも含めて実行
- D. my_model をバックグラウンドで実行', '**正解: B**
`@` は対象モデルの**上流と下流すべて**に加え、下流の祖先（下流モデルのビルドに必要な全モデル）も選択する。CI環境でスキーマにまだ存在しない上流モデルも含めてビルドする場合に便利。', 'https://docs.getdbt.com/reference/node-selection/graph-operators');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-122-opt-0', 'card-dbt-ae-122', 0, 'A', 'my_model のみを実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-122-opt-1', 'card-dbt-ae-122', 1, 'B', 'my_model の上流と下流すべてを実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-122-opt-2', 'card-dbt-ae-122', 2, 'C', 'my_model を参照する他のモデルのテストも含めて実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-122-opt-3', 'card-dbt-ae-122', 3, 'D', 'my_model をバックグラウンドで実行', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-122-ans-0', 'card-dbt-ae-122', 'card-dbt-ae-122-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-123', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt show` コマンドの用途は？
- A. モデルの設定を表示する
- B. モデルのSQLを実行し、結果をターミナルにプレビュー表示する
- C. DAGを表示する
- D. テスト結果を表示する', '**正解: B**
`dbt show --select my_model` でモデルを実行し、結果の最初の数行をターミナルに表示する。開発中のクイックプレビューに便利。', 'https://docs.getdbt.com/reference/node-selection/syntax');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-123-opt-0', 'card-dbt-ae-123', 0, 'A', 'モデルの設定を表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-123-opt-1', 'card-dbt-ae-123', 1, 'B', 'モデルのSQLを実行し、結果をターミナルにプレビュー表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-123-opt-2', 'card-dbt-ae-123', 2, 'C', 'DAGを表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-123-opt-3', 'card-dbt-ae-123', 3, 'D', 'テスト結果を表示する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-123-ans-0', 'card-dbt-ae-123', 'card-dbt-ae-123-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-124', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt build --select +fct_orders` が実行するリソースの範囲は？
- A. fct_orders のみ
- B. fct_orders とその上流のモデル、テスト、シード
- C. fct_orders とその下流すべて
- D. 全モデル', '**正解: B**
`+fct_orders` は fct_orders とその**上流すべて**を選択。`dbt build` なので選択されたリソースの seeds, models, snapshots, tests がDAG順に実行される。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-124-opt-0', 'card-dbt-ae-124', 0, 'A', 'fct_orders のみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-124-opt-1', 'card-dbt-ae-124', 1, 'B', 'fct_orders とその上流のモデル、テスト、シード', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-124-opt-2', 'card-dbt-ae-124', 2, 'C', 'fct_orders とその下流すべて', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-124-opt-3', 'card-dbt-ae-124', 3, 'D', '全モデル', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-124-ans-0', 'card-dbt-ae-124', 'card-dbt-ae-124-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-125', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`{% if execute %}` と `{% if is_incremental() %}` の違いは？
- A. 同じ条件を判定する
- B. `execute` はdbtの実行フェーズかどうか、`is_incremental()` は incremental モデルの2回目以降かどうか
- C. `execute` はテスト用、`is_incremental()` はモデル用
- D. `execute` は非推奨', '**正解: B**
- `execute` — dbt が SQL を実際に実行するフェーズかどうか（parse vs execute）
- `is_incremental()` — incremental モデルで、テーブルが存在し、full-refresh でない場合に True', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-125-opt-0', 'card-dbt-ae-125', 0, 'A', '同じ条件を判定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-125-opt-1', 'card-dbt-ae-125', 1, 'B', '`execute` はdbtの実行フェーズかどうか、`is_incremental()` は incremental モデルの2回目以降かどうか', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-125-opt-2', 'card-dbt-ae-125', 2, 'C', '`execute` はテスト用、`is_incremental()` はモデル用', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-125-opt-3', 'card-dbt-ae-125', 3, 'D', '`execute` は非推奨', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-125-ans-0', 'card-dbt-ae-125', 'card-dbt-ae-125-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-126', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt build` の実行方法として正しいものは？
- A. seeds → models → snapshots → tests の順に、リソースタイプごとにまとめて実行
- B. すべてのリソースを DAG 順にインターリーブして実行し、各ノードの直後にそのテストを実行
- C. models のみを実行し、seeds と snapshots は別コマンドで実行する必要がある
- D. テストはすべてのモデル完了後にまとめて実行', '**正解: B**
`dbt build` は seeds, models, snapshots, tests を**リソースタイプ別ではなく DAG 順にインターリーブ**して実行する。各ノード（model/seed/snapshot）の直後にそのノードのテストが実行される。テストが失敗すると、そのノードの下流はスキップされる。', 'https://docs.getdbt.com/reference/commands/build');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-126-opt-0', 'card-dbt-ae-126', 0, 'A', 'seeds → models → snapshots → tests の順に、リソースタイプごとにまとめて実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-126-opt-1', 'card-dbt-ae-126', 1, 'B', 'すべてのリソースを DAG 順にインターリーブして実行し、各ノードの直後にそのテストを実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-126-opt-2', 'card-dbt-ae-126', 2, 'C', 'models のみを実行し、seeds と snapshots は別コマンドで実行する必要がある', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-126-opt-3', 'card-dbt-ae-126', 3, 'D', 'テストはすべてのモデル完了後にまとめて実行', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-126-ans-0', 'card-dbt-ae-126', 'card-dbt-ae-126-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-127', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'Jinja の `{% macro %}` ブロックで定義したマクロの格納先ディレクトリは？
- A. `models/`
- B. `macros/`
- C. `tests/`
- D. `analyses/`', '**正解: B**
カスタムマクロは `macros/` ディレクトリに `.sql` ファイルとして配置する。プロジェクト内のどのモデルやテストからも `{{ my_macro() }}` で呼び出せる。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-127-opt-0', 'card-dbt-ae-127', 0, 'A', '`models/`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-127-opt-1', 'card-dbt-ae-127', 1, 'B', '`macros/`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-127-opt-2', 'card-dbt-ae-127', 2, 'C', '`tests/`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-127-opt-3', 'card-dbt-ae-127', 3, 'D', '`analyses/`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-127-ans-0', 'card-dbt-ae-127', 'card-dbt-ae-127-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-128', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt run` と `dbt build` の両方で実行されるリソースタイプを**すべて**選べ。
- A. models
- B. seeds
- C. snapshots
- D. tests', '**正解: A**
`dbt run` は**モデルのみ**。`dbt build` は seeds, models, snapshots, tests のすべてを DAG 順に実行する。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-128-opt-0', 'card-dbt-ae-128', 0, 'A', 'models', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-128-opt-1', 'card-dbt-ae-128', 1, 'B', 'seeds', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-128-opt-2', 'card-dbt-ae-128', 2, 'C', 'snapshots', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-128-opt-3', 'card-dbt-ae-128', 3, 'D', 'tests', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-128-ans-0', 'card-dbt-ae-128', 'card-dbt-ae-128-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-129', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`meta` config の用途は？
- A. モデルのメタデータ（任意のキーバリュー）を付与する
- B. モデルのテスト設定を行う
- C. モデルの materialization を設定する
- D. モデルの description を設定する', '**正解: A**
`meta` には任意のキーバリューペアを設定できる。`manifest.json` に出力されるため、外部ツールとの連携に利用可能。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-129-opt-0', 'card-dbt-ae-129', 0, 'A', 'モデルのメタデータ（任意のキーバリュー）を付与する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-129-opt-1', 'card-dbt-ae-129', 1, 'B', 'モデルのテスト設定を行う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-129-opt-2', 'card-dbt-ae-129', 2, 'C', 'モデルの materialization を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-129-opt-3', 'card-dbt-ae-129', 3, 'D', 'モデルの description を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-129-ans-0', 'card-dbt-ae-129', 'card-dbt-ae-129-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-130', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'source で `database` と `schema` をオーバーライドする用途は？
- A. テスト用の別データを参照する
- B. 環境ごとに異なるDWHの場所を指定する
- C. ソーステーブルの名前を変更する
- D. データのバックアップ先を指定する', '**正解: B**
dev環境とprod環境でデータベースやスキーマが異なる場合、`database` や `schema` をオーバーライドして環境に合わせる。', 'https://docs.getdbt.com/docs/build/sources#source-properties');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-130-opt-0', 'card-dbt-ae-130', 0, 'A', 'テスト用の別データを参照する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-130-opt-1', 'card-dbt-ae-130', 1, 'B', '環境ごとに異なるDWHの場所を指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-130-opt-2', 'card-dbt-ae-130', 2, 'C', 'ソーステーブルの名前を変更する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-130-opt-3', 'card-dbt-ae-130', 3, 'D', 'データのバックアップ先を指定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-130-ans-0', 'card-dbt-ae-130', 'card-dbt-ae-130-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-131', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'incremental モデルで `incremental_predicates` 設定の用途は？
- A. DWH側のパーティションプルーニングを活用してmerge性能を向上させる
- B. テスト条件を追加する
- C. モデルの実行順序を制御する
- D. スキーマ変更の検出条件を設定する', '**正解: A**
`incremental_predicates` でDWH側のパーティションフィルタを追加し、merge文のパフォーマンスを向上させる。BigQuery等でパーティションプルーニングに活用。', 'https://docs.getdbt.com/docs/build/incremental-strategy');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-131-opt-0', 'card-dbt-ae-131', 0, 'A', 'DWH側のパーティションプルーニングを活用してmerge性能を向上させる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-131-opt-1', 'card-dbt-ae-131', 1, 'B', 'テスト条件を追加する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-131-opt-2', 'card-dbt-ae-131', 2, 'C', 'モデルの実行順序を制御する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-131-opt-3', 'card-dbt-ae-131', 3, 'D', 'スキーマ変更の検出条件を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-131-ans-0', 'card-dbt-ae-131', 'card-dbt-ae-131-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-132', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt プロジェクトで `.sqlfluff` ファイルの役割は？
- A. dbtの設定ファイル
- B. SQL リンターの設定ファイル
- C. テスト設定ファイル
- D. デプロイ設定ファイル', '**正解: B**
SQLFluff は SQL リンター/フォーマッターで、`.sqlfluff` はその設定ファイル。dbt プロジェクトではコードスタイルの統一に使用される。dbt 固有のファイルではない。', 'https://docs.getdbt.com/best-practices/how-we-style/0-how-we-style-our-dbt-projects');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-132-opt-0', 'card-dbt-ae-132', 0, 'A', 'dbtの設定ファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-132-opt-1', 'card-dbt-ae-132', 1, 'B', 'SQL リンターの設定ファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-132-opt-2', 'card-dbt-ae-132', 2, 'C', 'テスト設定ファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-132-opt-3', 'card-dbt-ae-132', 3, 'D', 'デプロイ設定ファイル', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-132-ans-0', 'card-dbt-ae-132', 'card-dbt-ae-132-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-133', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt ls --resource-type model --output json` の出力形式は？
- A. モデル名の一覧をJSON配列で出力
- B. 各モデルの詳細情報をJSONで出力
- C. DAGをJSON形式で出力
- D. テスト結果をJSON形式で出力', '**正解: B**
`--output json` で各リソースの詳細（name, config, tags等）をJSON行で出力する。スクリプトやCI/CDパイプラインでの活用に便利。', 'https://docs.getdbt.com/reference/commands/list');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-133-opt-0', 'card-dbt-ae-133', 0, 'A', 'モデル名の一覧をJSON配列で出力', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-133-opt-1', 'card-dbt-ae-133', 1, 'B', '各モデルの詳細情報をJSONで出力', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-133-opt-2', 'card-dbt-ae-133', 2, 'C', 'DAGをJSON形式で出力', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-133-opt-3', 'card-dbt-ae-133', 3, 'D', 'テスト結果をJSON形式で出力', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-133-ans-0', 'card-dbt-ae-133', 'card-dbt-ae-133-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-134', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt Mesh とは何か？
- A. dbtのテスト自動化フレームワーク
- B. 複数のdbtプロジェクトを相互に連携させるアーキテクチャ
- C. dbtのビジュアルDAGエディタ
- D. dbtのパッケージ管理システム', '**正解: B**
`access` と `contract` を使って、プロジェクト間の安全なモデル参照を実現する。public モデルが他プロジェクトへのインターフェースとなる。', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-134-opt-0', 'card-dbt-ae-134', 0, 'A', 'dbtのテスト自動化フレームワーク', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-134-opt-1', 'card-dbt-ae-134', 1, 'B', '複数のdbtプロジェクトを相互に連携させるアーキテクチャ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-134-opt-2', 'card-dbt-ae-134', 2, 'C', 'dbtのビジュアルDAGエディタ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-134-opt-3', 'card-dbt-ae-134', 3, 'D', 'dbtのパッケージ管理システム', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-134-ans-0', 'card-dbt-ae-134', 'card-dbt-ae-134-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-135', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`generate_schema_name` マクロをオーバーライドする目的は？
- A. 本番環境では `custom_schema` をそのまま使い、開発環境ではプレフィックスを付ける
- B. スキーマ名を暗号化する
- C. スキーマの自動作成を無効にする
- D. テスト用のスキーマを生成する', '**正解: A**
典型的なパターン: prod環境では `analytics`、dev環境では `dbt_user_analytics` のように環境ごとにスキーマ名の生成ルールを変える。', 'https://docs.getdbt.com/docs/build/custom-schemas');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-135-opt-0', 'card-dbt-ae-135', 0, 'A', '本番環境では `custom_schema` をそのまま使い、開発環境ではプレフィックスを付ける', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-135-opt-1', 'card-dbt-ae-135', 1, 'B', 'スキーマ名を暗号化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-135-opt-2', 'card-dbt-ae-135', 2, 'C', 'スキーマの自動作成を無効にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-135-opt-3', 'card-dbt-ae-135', 3, 'D', 'テスト用のスキーマを生成する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-135-ans-0', 'card-dbt-ae-135', 'card-dbt-ae-135-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-136', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt_project.yml` の `vars` セクションの用途は？
- A. 環境変数を定義する
- B. プロジェクト変数を定義し `{{ var() }}` で参照する
- C. Jinja変数を宣言する
- D. テスト用のモックデータを定義する', '**正解: B**
`vars: { start_date: ''2024-01-01'' }` と定義し、モデル内で `{{ var(''start_date'') }}` で参照する。`--vars` フラグで実行時にオーバーライド可能。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-136-opt-0', 'card-dbt-ae-136', 0, 'A', '環境変数を定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-136-opt-1', 'card-dbt-ae-136', 1, 'B', 'プロジェクト変数を定義し `{{ var() }}` で参照する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-136-opt-2', 'card-dbt-ae-136', 2, 'C', 'Jinja変数を宣言する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-136-opt-3', 'card-dbt-ae-136', 3, 'D', 'テスト用のモックデータを定義する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-136-ans-0', 'card-dbt-ae-136', 'card-dbt-ae-136-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-137', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt のフックの種類を**2つ**選べ。
- A. `on_run_start`
- B. `on_model_start`
- C. `on_run_end`
- D. `on_test_end`', '**正解: A, C**
- `on_run_start` — dbt run の開始前に実行
- `on_run_end` — dbt run の完了後に実行
`on_model_start` や `on_test_end` は存在しない（pre-hook/post-hook はモデルレベル）。', 'https://docs.getdbt.com/reference/resource-configs/pre-hook-post-hook');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-137-opt-0', 'card-dbt-ae-137', 0, 'A', '`on_run_start`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-137-opt-1', 'card-dbt-ae-137', 1, 'B', '`on_model_start`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-137-opt-2', 'card-dbt-ae-137', 2, 'C', '`on_run_end`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-137-opt-3', 'card-dbt-ae-137', 3, 'D', '`on_test_end`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-137-ans-0', 'card-dbt-ae-137', 'card-dbt-ae-137-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-137-ans-1', 'card-dbt-ae-137', 'card-dbt-ae-137-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-138', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt snapshot` コマンドの実行結果として正しいものは？
- A. ソーステーブルの現在の状態を snapshot テーブルに記録する
- B. モデルのバックアップを作成する
- C. DWHのスキーマをキャプチャする
- D. テスト結果のスナップショットを保存する', '**正解: A**
ソースデータの現在の状態をキャプチャし、過去の変更履歴を SCD Type 2 形式で保持する。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-138-opt-0', 'card-dbt-ae-138', 0, 'A', 'ソーステーブルの現在の状態を snapshot テーブルに記録する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-138-opt-1', 'card-dbt-ae-138', 1, 'B', 'モデルのバックアップを作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-138-opt-2', 'card-dbt-ae-138', 2, 'C', 'DWHのスキーマをキャプチャする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-138-opt-3', 'card-dbt-ae-138', 3, 'D', 'テスト結果のスナップショットを保存する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-138-ans-0', 'card-dbt-ae-138', 'card-dbt-ae-138-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-139', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '`dbt show --select my_model --limit 50` の効果は？
- A. my_model を実行し、最初の50行をターミナルに表示する
- B. my_model のソースコードの最初の50行を表示する
- C. my_model のテスト結果を50件表示する
- D. my_model の最初の50カラムを表示する', '**正解: A**
`dbt show` はモデルを実行して結果をプレビュー表示する。`--limit` で表示行数を制限する。デフォルトは5行。', 'https://docs.getdbt.com/reference/commands/show');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-139-opt-0', 'card-dbt-ae-139', 0, 'A', 'my_model を実行し、最初の50行をターミナルに表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-139-opt-1', 'card-dbt-ae-139', 1, 'B', 'my_model のソースコードの最初の50行を表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-139-opt-2', 'card-dbt-ae-139', 2, 'C', 'my_model のテスト結果を50件表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-139-opt-3', 'card-dbt-ae-139', 3, 'D', 'my_model の最初の50カラムを表示する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-139-ans-0', 'card-dbt-ae-139', 'card-dbt-ae-139-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-140', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', 'dbt のリソースタイプとして存在し**ない**ものはどれか？
- A. model
- B. test
- C. view
- D. seed', '**正解: C**
`view` は materialization の一種であり、リソースタイプではない。リソースタイプは model, test, seed, snapshot, source, exposure, metric, analysis 等。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-140-opt-0', 'card-dbt-ae-140', 0, 'A', 'model', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-140-opt-1', 'card-dbt-ae-140', 1, 'B', 'test', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-140-opt-2', 'card-dbt-ae-140', 2, 'C', 'view', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-140-opt-3', 'card-dbt-ae-140', 3, 'D', 'seed', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-140-ans-0', 'card-dbt-ae-140', 'card-dbt-ae-140-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-141', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-1', '直前の実行で失敗またはスキップされたモデルのみを再実行するコマンドは `dbt ____` である。
- A. `retry`
- B. `rerun`
- C. `resume`
- D. `restart`', '**正解: `retry`** → `dbt retry`
`run_results.json` を参照して、**error** または **skipped** のステータスだったリソースのみを再実行する。', 'https://docs.getdbt.com/reference/commands/retry');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-141-opt-0', 'card-dbt-ae-141', 0, 'A', '`retry`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-141-opt-1', 'card-dbt-ae-141', 1, 'B', '`rerun`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-141-opt-2', 'card-dbt-ae-141', 2, 'C', '`resume`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-141-opt-3', 'card-dbt-ae-141', 3, 'D', '`restart`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-142', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-1', 'dbt Cloud の CI ジョブで自動的に行われることを**2つ**選べ。
- A. PR作成時にトリガーされる
- B. 変更されたモデルのみをビルド・テストする
- C. 本番環境にデプロイする
- D. Git リポジトリをフォークする', '**正解: A, B**
dbt Cloud CI は PR 作成/更新時にトリガーされ、`state:modified+` で変更モデルとその下流のみをビルド・テストする（Slim CI）。本番デプロイはしない。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-142-opt-0', 'card-dbt-ae-142', 0, 'A', 'PR作成時にトリガーされる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-142-opt-1', 'card-dbt-ae-142', 1, 'B', '変更されたモデルのみをビルド・テストする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-142-opt-2', 'card-dbt-ae-142', 2, 'C', '本番環境にデプロイする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-142-opt-3', 'card-dbt-ae-142', 3, 'D', 'Git リポジトリをフォークする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-142-ans-0', 'card-dbt-ae-142', 'card-dbt-ae-142-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-142-ans-1', 'card-dbt-ae-142', 'card-dbt-ae-142-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-143', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-2', '以下のモデルで `{{ adapter.dispatch(''my_macro'') }}` が解決する問題は？
- A. マクロのバージョン管理
- B. 異なるDWHプラットフォーム間のSQL構文の違い
- C. マクロの実行順序
- D. マクロのキャッシュ管理', '**正解: B**
例えば Snowflake では `DATEADD()`、BigQuery では `DATE_ADD()` のように、DWH間で異なる関数をアダプターごとに切り替える。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-143-opt-0', 'card-dbt-ae-143', 0, 'A', 'マクロのバージョン管理', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-143-opt-1', 'card-dbt-ae-143', 1, 'B', '異なるDWHプラットフォーム間のSQL構文の違い', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-143-opt-2', 'card-dbt-ae-143', 2, 'C', 'マクロの実行順序', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-143-opt-3', 'card-dbt-ae-143', 3, 'D', 'マクロのキャッシュ管理', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-143-ans-0', 'card-dbt-ae-143', 'card-dbt-ae-143-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-144', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-2', '`access: public` を設定すべきモデルの条件を**2つ**選べ。
- A. 他のチームやプロジェクトから参照されるmart層モデル
- B. staging層のすべてのモデル
- C. 安定したインターフェースとして公開するモデル
- D. ephemeral materialization のモデル', '**正解: A, C**
public は他プロジェクトからも `ref()` 可能。mart層の dim_/fct_ などの安定モデルに設定する。staging は通常 protected で十分。', 'https://docs.getdbt.com/docs/collaborate/govern/model-access');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-144-opt-0', 'card-dbt-ae-144', 0, 'A', '他のチームやプロジェクトから参照されるmart層モデル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-144-opt-1', 'card-dbt-ae-144', 1, 'B', 'staging層のすべてのモデル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-144-opt-2', 'card-dbt-ae-144', 2, 'C', '安定したインターフェースとして公開するモデル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-144-opt-3', 'card-dbt-ae-144', 3, 'D', 'ephemeral materialization のモデル', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-144-ans-0', 'card-dbt-ae-144', 'card-dbt-ae-144-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-144-ans-1', 'card-dbt-ae-144', 'card-dbt-ae-144-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-145', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-2', 'dbt Mesh でクロスプロジェクト参照するために参照先モデルに**必須**の設定は？
- A. `access: public`
- B. `contract: { enforced: true }`
- C. `materialized: table`
- D. `tags: [''shared'']`', '**正解: A**
クロスプロジェクト参照には `access: public`（他プロジェクトに公開）が必須。`contract: { enforced: true }` はスキーマの安定性を保証するための**推奨設定**だが、`ref()` の動作には技術的に不要。', 'https://docs.getdbt.com/docs/collaborate/govern/model-contracts');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-145-opt-0', 'card-dbt-ae-145', 0, 'A', '`access: public`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-145-opt-1', 'card-dbt-ae-145', 1, 'B', '`contract: { enforced: true }`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-145-opt-2', 'card-dbt-ae-145', 2, 'C', '`materialized: table`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-145-opt-3', 'card-dbt-ae-145', 3, 'D', '`tags: [''shared'']`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-145-ans-0', 'card-dbt-ae-145', 'card-dbt-ae-145-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-146', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-2', '各モデルアクセスレベル（左列）を、その参照可能範囲（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. public | a. 同じ group 内からのみ |
| 2. protected | b. 同じプロジェクト内からのみ |
| 3. private | c. どのプロジェクトからでも `ref()` 可能 |', '**1-c, 2-b, 3-a**
| アクセスレベル | 参照可能範囲 |
|---|---|
| **public** → c | どのプロジェクトからでも `ref()` 可能 |
| **protected**（デフォルト）→ b | 同じ**プロジェクト**内からのみ |
| **private** → a | 同じ **group** 内からのみ |', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-146-opt-0', 'card-dbt-ae-146', 0, '1', 'public', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-146-opt-1', 'card-dbt-ae-146', 1, '2', 'protected', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-146-opt-2', 'card-dbt-ae-146', 2, '3', 'private', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-146-opt-3', 'card-dbt-ae-146', 3, 'a', '同じ group 内からのみ', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-146-opt-4', 'card-dbt-ae-146', 4, 'b', '同じプロジェクト内からのみ', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-146-opt-5', 'card-dbt-ae-146', 5, 'c', 'どのプロジェクトからでも `ref()` 可能', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-146-ans-0', 'card-dbt-ae-146', 'card-dbt-ae-146-opt-0', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-146-ans-1', 'card-dbt-ae-146', 'card-dbt-ae-146-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-146-ans-2', 'card-dbt-ae-146', 'card-dbt-ae-146-opt-2', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-147', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-2', 'model contract の `enforced: true` が検証するものを**2つ**選べ。
- A. カラム名
- B. データ型
- C. カラムの値の範囲
- D. NULLの有無', '**正解: A, B**
contract はモデルの出力の**カラム名**と**データ型**が定義と一致するかを検証する。値の範囲やNULLチェックはテスト（data_tests）の役割。', 'https://docs.getdbt.com/docs/collaborate/govern/model-contracts');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-147-opt-0', 'card-dbt-ae-147', 0, 'A', 'カラム名', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-147-opt-1', 'card-dbt-ae-147', 1, 'B', 'データ型', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-147-opt-2', 'card-dbt-ae-147', 2, 'C', 'カラムの値の範囲', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-147-opt-3', 'card-dbt-ae-147', 3, 'D', 'NULLの有無', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-147-ans-0', 'card-dbt-ae-147', 'card-dbt-ae-147-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-147-ans-1', 'card-dbt-ae-147', 'card-dbt-ae-147-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-148', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-2', 'model の `group` と `access: private` の関係として正しいものは？
- A. `private` モデルは同じ `group` 内からのみ `ref()` 可能
- B. `private` モデルは同じフォルダ内からのみ参照可能
- C. `group` を設定すると自動的に `private` になる
- D. `private` モデルは `group` の設定が不要', '**正解: A**
`access: private` のモデルは同じ `group` に属するモデルからのみ `ref()` で参照できる。グループ外からの参照はエラーになる。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-148-opt-0', 'card-dbt-ae-148', 0, 'A', '`private` モデルは同じ `group` 内からのみ `ref()` 可能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-148-opt-1', 'card-dbt-ae-148', 1, 'B', '`private` モデルは同じフォルダ内からのみ参照可能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-148-opt-2', 'card-dbt-ae-148', 2, 'C', '`group` を設定すると自動的に `private` になる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-148-opt-3', 'card-dbt-ae-148', 3, 'D', '`private` モデルは `group` の設定が不要', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-148-ans-0', 'card-dbt-ae-148', 'card-dbt-ae-148-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-149', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-2', '`dbt_project.yml` の `version` フィールドの用途は？
- A. dbt のバージョンを指定する
- B. プロジェクトのバージョンを定義する（v1.5以降はオプション）
- C. パッケージのバージョンを固定する
- D. モデルのバージョンを設定する', '**正解: B**
`version: ''1.0.0''` はプロジェクト自体のバージョン。v1.5以降ではオプションフィールド。`require-dbt-version` とは別のフィールド。', 'https://docs.getdbt.com/reference/dbt_project.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-149-opt-0', 'card-dbt-ae-149', 0, 'A', 'dbt のバージョンを指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-149-opt-1', 'card-dbt-ae-149', 1, 'B', 'プロジェクトのバージョンを定義する（v1.5以降はオプション）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-149-opt-2', 'card-dbt-ae-149', 2, 'C', 'パッケージのバージョンを固定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-149-opt-3', 'card-dbt-ae-149', 3, 'D', 'モデルのバージョンを設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-149-ans-0', 'card-dbt-ae-149', 'card-dbt-ae-149-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-150', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-2', 'モデルのアクセスレベルのデフォルト値は `access: ____` である。
- A. `protected`
- B. `public`
- C. `private`
- D. `internal`', '**正解: `protected`**
同じプロジェクト内からのみ `ref()` で参照可能。`public` は他プロジェクトからも参照可、`private` は同じ group 内のみ。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-150-opt-0', 'card-dbt-ae-150', 0, 'A', '`protected`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-150-opt-1', 'card-dbt-ae-150', 1, 'B', '`public`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-150-opt-2', 'card-dbt-ae-150', 2, 'C', '`private`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-150-opt-3', 'card-dbt-ae-150', 3, 'D', '`internal`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-151', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-2', 'モデルバージョンの移行手順として、以下を正しい順序に並べよ。
ステップ:
- (a) 下流が `ref(''model'', v=2)` に切り替え
- (b) 旧バージョンに `deprecation_date` を設定
- (c) deprecation_date 経過後に旧バージョンを削除
- (d) YAMLで `latest_version: 2` に更新
- (e) 新しいバージョン（v2）のモデルを作成
- (f) 下流の利用者に移行を通知', '**正解: e → d → b → f → a → c**
1. **(e)** 新しいバージョン（v2）の**モデルを作成**
2. **(d)** YAMLで **`latest_version: 2`** に更新
3. **(b)** 旧バージョンに **`deprecation_date`** を設定
4. **(f)** 下流の利用者に**移行を通知**
5. **(a)** 下流が `ref(''model'', v=2)` に**切り替え**
6. **(c)** deprecation_date 経過後に**旧バージョンを削除**', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-151-opt-0', 'card-dbt-ae-151', 0, 'a', '下流が `ref(''model'', v=2)` に切り替え', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-151-opt-1', 'card-dbt-ae-151', 1, 'b', '旧バージョンに `deprecation_date` を設定', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-151-opt-2', 'card-dbt-ae-151', 2, 'c', 'deprecation_date 経過後に旧バージョンを削除', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-151-opt-3', 'card-dbt-ae-151', 3, 'd', 'YAMLで `latest_version: 2` に更新', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-151-opt-4', 'card-dbt-ae-151', 4, 'e', '新しいバージョン（v2）のモデルを作成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-151-opt-5', 'card-dbt-ae-151', 5, 'f', '下流の利用者に移行を通知', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-151-ans-0', 'card-dbt-ae-151', 'card-dbt-ae-151-opt-4', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-151-ans-1', 'card-dbt-ae-151', 'card-dbt-ae-151-opt-3', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-151-ans-2', 'card-dbt-ae-151', 'card-dbt-ae-151-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-151-ans-3', 'card-dbt-ae-151', 'card-dbt-ae-151-opt-5', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-151-ans-4', 'card-dbt-ae-151', 'card-dbt-ae-151-opt-0', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-151-ans-5', 'card-dbt-ae-151', 'card-dbt-ae-151-opt-2', NULL, 5);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-152', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-2', 'dbt の `invocation_id` の用途は？
- A. 各dbt実行に付与されるユニークID
- B. モデルのバージョン管理ID
- C. テスト結果のID
- D. ユーザーのセッションID', '**正解: A**
`{{ invocation_id }}` で取得可能。各dbt実行に一意のUUIDが付与される。ログやメタデータの追跡に利用可能。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/invocation_id');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-152-opt-0', 'card-dbt-ae-152', 0, 'A', '各dbt実行に付与されるユニークID', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-152-opt-1', 'card-dbt-ae-152', 1, 'B', 'モデルのバージョン管理ID', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-152-opt-2', 'card-dbt-ae-152', 2, 'C', 'テスト結果のID', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-152-opt-3', 'card-dbt-ae-152', 3, 'D', 'ユーザーのセッションID', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-152-ans-0', 'card-dbt-ae-152', 'card-dbt-ae-152-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-153', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-3', '各 `on_schema_change` 設定（左列）を、その動作（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `ignore` | a. 新カラム追加、古いカラムも維持 |
| 2. `fail` | b. スキーマ変更を無視し、既存スキーマで処理 |
| 3. `append_new_columns` | c. カラムの追加と削除を完全同期 |
| 4. `sync_all_columns` | d. スキーマ変更検出時にエラーで停止 |', '**1-b, 2-d, 3-a, 4-c**
| 設定 | 動作 |
|---|---|
| **ignore** → b | スキーマ変更を**無視** |
| **fail** → d | スキーマ変更時に**エラーで停止** |
| **append_new_columns** → a | 新カラム**追加のみ**（削除しない） |
| **sync_all_columns** → c | カラムの**追加と削除を完全同期** |', 'https://docs.getdbt.com/docs/build/incremental-models#what-if-the-columns-of-my-incremental-model-change');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-0', 'card-dbt-ae-153', 0, '1', 'ignore', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-1', 'card-dbt-ae-153', 1, '2', 'fail', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-2', 'card-dbt-ae-153', 2, '3', 'append_new_columns', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-3', 'card-dbt-ae-153', 3, '4', 'sync_all_columns', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-4', 'card-dbt-ae-153', 4, 'a', '新カラム追加、古いカラムも維持', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-5', 'card-dbt-ae-153', 5, 'b', 'スキーマ変更を無視し、既存スキーマで処理', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-6', 'card-dbt-ae-153', 6, 'c', 'カラムの追加と削除を完全同期', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-153-opt-7', 'card-dbt-ae-153', 7, 'd', 'スキーマ変更検出時にエラーで停止', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-153-ans-0', 'card-dbt-ae-153', 'card-dbt-ae-153-opt-0', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-153-ans-1', 'card-dbt-ae-153', 'card-dbt-ae-153-opt-1', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-153-ans-2', 'card-dbt-ae-153', 'card-dbt-ae-153-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-153-ans-3', 'card-dbt-ae-153', 'card-dbt-ae-153-opt-3', NULL, 2);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-154', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のエラーの原因として最も可能性が高いものは？
```
Database Error in model my_model
  001003 (42000): SQL compilation error:
  syntax error line 1 at position 0 unexpected ''WITH''.
```
- A. Jinjaの構文エラー
- B. DWH上でSQL直接実行すれば解決する問題
- C. `ephemeral` モデルがCTEの中でCTEを生成している
- D. `ref()` の参照先モデルが存在しない', '**正解: C**
ephemeral モデルはCTEとして展開されるため、呼び出し元のクエリがすでにCTEを使っている場合にネストされたWITH句が発生し、構文エラーになることがある。', 'https://docs.getdbt.com/docs/build/materializations#ephemeral');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-154-opt-0', 'card-dbt-ae-154', 0, 'A', 'Jinjaの構文エラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-154-opt-1', 'card-dbt-ae-154', 1, 'B', 'DWH上でSQL直接実行すれば解決する問題', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-154-opt-2', 'card-dbt-ae-154', 2, 'C', '`ephemeral` モデルがCTEの中でCTEを生成している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-154-opt-3', 'card-dbt-ae-154', 3, 'D', '`ref()` の参照先モデルが存在しない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-154-ans-0', 'card-dbt-ae-154', 'card-dbt-ae-154-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-155', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のJinjaコードの出力として正しいものは？
```sql
{% set colors = [''red'', ''green'', ''blue''] %}
{% for color in colors %}
  ''{{ color }}''{% if not loop.last %},{% endif %}
{% endfor %}
```
- A. `''red'', ''green'', ''blue''`
- B. `red, green, blue`
- C. `[''red'', ''green'', ''blue'']`
- D. エラーが発生する', '**正解: A**
Jinja の `for` ループで各要素をシングルクォート付きで出力し、`loop.last` で最後の要素以外にカンマを付加する。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-155-opt-0', 'card-dbt-ae-155', 0, 'A', '`''red'', ''green'', ''blue''`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-155-opt-1', 'card-dbt-ae-155', 1, 'B', '`red, green, blue`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-155-opt-2', 'card-dbt-ae-155', 2, 'C', '`[''red'', ''green'', ''blue'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-155-opt-3', 'card-dbt-ae-155', 3, 'D', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-155-ans-0', 'card-dbt-ae-155', 'card-dbt-ae-155-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-156', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt run --select 1+my_model` と `dbt run --select +my_model` の違いは？
- A. `1+` は1つ上の直接の上流のみ、`+` は上流すべて
- B. 同じ動作をする
- C. `1+` はエラーになる
- D. `+` は1つ上のみ、`1+` は上流すべて', '**正解: A**
`1+my_model` は**1ホップ上流**のみ。`2+my_model` は2ホップ上流まで。`+my_model`（数字なし）は**上流すべて**。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-156-opt-0', 'card-dbt-ae-156', 0, 'A', '`1+` は1つ上の直接の上流のみ、`+` は上流すべて', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-156-opt-1', 'card-dbt-ae-156', 1, 'B', '同じ動作をする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-156-opt-2', 'card-dbt-ae-156', 2, 'C', '`1+` はエラーになる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-156-opt-3', 'card-dbt-ae-156', 3, 'D', '`+` は1つ上のみ、`1+` は上流すべて', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-156-ans-0', 'card-dbt-ae-156', 'card-dbt-ae-156-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-157', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のモデルバージョン定義で、`ref(''dim_customers'')` がv1を返してしまう原因は？
```yaml
models:
  - name: dim_customers
    versions:
      - v: 1
      - v: 2
```', '**`latest_version` が未設定**。デフォルトでは最初のバージョンが使われる可能性がある。
修正: `latest_version: 2` を追加する。
```yaml
models:
  - name: dim_customers
    latest_version: 2
    versions:
      - v: 1
      - v: 2
```', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-158', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下の contract 設定でビルドエラーになる原因は？
```yaml
models:
  - name: dim_products
    config:
      contract:
        enforced: true
    columns:
      - name: product_id
      - name: product_name
```', 'contract が `enforced: true` の場合、各カラムに **`data_type` の指定が必須**。
修正:
```yaml
    columns:
      - name: product_id
        data_type: int
      - name: product_name
        data_type: varchar(100)
```', 'https://docs.getdbt.com/docs/collaborate/govern/model-contracts');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-159', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下の incremental モデルで2回目以降の実行で全データが処理されてしまう原因は？
```sql
{{ config(materialized=''incremental'', unique_key=''id'') }}
select *
from {{ ref(''stg_events'') }}
```', '**`is_incremental()` による WHERE 句がない**ため、毎回全データが処理される。
修正:
```sql
{% if is_incremental() %}
where event_date > (select max(event_date) from {{ this }})
{% endif %}
```', 'https://docs.getdbt.com/docs/build/incremental-models');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-160', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`materialized=''table''` のモデルに `--full-refresh` を付けて実行した場合の違いは？
- A. 通常実行と全く同じ動作をする
- B. キャッシュをクリアして再作成する
- C. エラーが発生する
- D. ビューとして再作成される', '**正解: A**
table materialization は常にDROP+CREATEするため、`--full-refresh` を付けても動作は変わらない。このフラグは incremental モデルでのみ意味がある。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-160-opt-0', 'card-dbt-ae-160', 0, 'A', '通常実行と全く同じ動作をする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-160-opt-1', 'card-dbt-ae-160', 1, 'B', 'キャッシュをクリアして再作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-160-opt-2', 'card-dbt-ae-160', 2, 'C', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-160-opt-3', 'card-dbt-ae-160', 3, 'D', 'ビューとして再作成される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-160-ans-0', 'card-dbt-ae-160', 'card-dbt-ae-160-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-161', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`{{ return(adapter.dispatch(''my_macro'')()) }}` の動作は？
- A. アダプター固有のマクロ実装を呼び出して結果を返す
- B. マクロの定義を返す
- C. エラーが発生する
- D. マクロの一覧を返す', '**正解: A**
`adapter.dispatch()` でアダプターに応じたマクロ実装を取得し、`()` で呼び出して `return()` で結果を返す。クロスプラットフォーム対応のパターン。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-161-opt-0', 'card-dbt-ae-161', 0, 'A', 'アダプター固有のマクロ実装を呼び出して結果を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-161-opt-1', 'card-dbt-ae-161', 1, 'B', 'マクロの定義を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-161-opt-2', 'card-dbt-ae-161', 2, 'C', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-161-opt-3', 'card-dbt-ae-161', 3, 'D', 'マクロの一覧を返す', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-161-ans-0', 'card-dbt-ae-161', 'card-dbt-ae-161-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-162', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt run --select my_model --exclude my_model+` の結果は？
- A. my_model のみを実行
- B. my_model とその下流を実行
- C. 何も実行されない
- D. エラーが発生する', '**正解: C**
`--select my_model` で my_model を選択し、`--exclude my_model+` で除外。`my_model+` は my_model 自身とその下流すべてを含むため、my_model 自体も除外される。結果として何も実行されない。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-162-opt-0', 'card-dbt-ae-162', 0, 'A', 'my_model のみを実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-162-opt-1', 'card-dbt-ae-162', 1, 'B', 'my_model とその下流を実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-162-opt-2', 'card-dbt-ae-162', 2, 'C', '何も実行されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-162-opt-3', 'card-dbt-ae-162', 3, 'D', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-162-ans-0', 'card-dbt-ae-162', 'card-dbt-ae-162-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-163', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'Jinjaテンプレートが展開されたSQLの出力先ディレクトリは `target/____/` である。
- A. `compiled`
- B. `run`
- C. `generated`
- D. `output`', '**正解: `compiled`** → `target/compiled/`
`dbt compile` で生成。`target/run/` にはDDL文のラッパーを含む実行済みSQLが格納される。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-163-opt-0', 'card-dbt-ae-163', 0, 'A', '`compiled`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-163-opt-1', 'card-dbt-ae-163', 1, 'B', '`run`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-163-opt-2', 'card-dbt-ae-163', 2, 'C', '`generated`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-163-opt-3', 'card-dbt-ae-163', 3, 'D', '`output`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-164', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'snapshot の `invalidate_hard_deletes` 設定の効果は？
- A. ソースから削除された行の `dbt_valid_to` を設定する
- B. 削除された行をsnapshotテーブルからも物理削除する
- C. 削除を検出した場合にエラーを発生させる
- D. 削除された行を別テーブルに移動する', '**正解: A**
`invalidate_hard_deletes: true` を設定すると、ソースから削除された行の `dbt_valid_to` に現在のタイムスタンプを設定して無効化する。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-164-opt-0', 'card-dbt-ae-164', 0, 'A', 'ソースから削除された行の `dbt_valid_to` を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-164-opt-1', 'card-dbt-ae-164', 1, 'B', '削除された行をsnapshotテーブルからも物理削除する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-164-opt-2', 'card-dbt-ae-164', 2, 'C', '削除を検出した場合にエラーを発生させる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-164-opt-3', 'card-dbt-ae-164', 3, 'D', '削除された行を別テーブルに移動する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-164-ans-0', 'card-dbt-ae-164', 'card-dbt-ae-164-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-165', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のモデルで `ambiguous column name` エラーが発生する原因は？
```sql
select
  customer_id,
  name,
  total_amount
from {{ ref(''stg_customers'') }} c
left join {{ ref(''stg_orders'') }} o
  on c.customer_id = o.customer_id
```', '**2行目 `customer_id`** にテーブルエイリアスがない。両テーブルに `customer_id` が存在するため曖昧。
修正: `c.customer_id` のようにエイリアスを付ける。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-166', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-3', '`.yml` ファイルのコンパイルエラーの一般的な原因を**3つ**選べ。
- A. インデント不正
- B. コロン後のスペース不足
- C. モデルのSQL構文エラー
- D. 特殊文字のクォート不足
- E. `ref()` マクロの未使用', '**正解: A, B, D**
YAMLはインデントに厳密で、`name:value` ではなく `name: value` が必要。値に `:` や `#` を含む場合はクォートが必要。SQL構文エラーや `ref()` はYAMLコンパイルとは無関係。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-166-opt-0', 'card-dbt-ae-166', 0, 'A', 'インデント不正', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-166-opt-1', 'card-dbt-ae-166', 1, 'B', 'コロン後のスペース不足', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-166-opt-2', 'card-dbt-ae-166', 2, 'C', 'モデルのSQL構文エラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-166-opt-3', 'card-dbt-ae-166', 3, 'D', '特殊文字のクォート不足', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-166-opt-4', 'card-dbt-ae-166', 4, 'E', '`ref()` マクロの未使用', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-166-ans-0', 'card-dbt-ae-166', 'card-dbt-ae-166-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-166-ans-1', 'card-dbt-ae-166', 'card-dbt-ae-166-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-166-ans-2', 'card-dbt-ae-166', 'card-dbt-ae-166-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-167', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'dbt の YAML ファイルで `version: 2` を省略するとどうなるか？
- A. エラーが発生する
- B. 自動的に version 2 が適用される
- C. version 1 のスキーマとしてパースされる
- D. ファイルが無視される', '**正解: B**
dbt v1.5+ では `version: 2` はオプションとなり、省略しても自動的に v2 として解釈される。ただし明示的に記述するのがベストプラクティス。', 'https://docs.getdbt.com/reference/dbt_project.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-167-opt-0', 'card-dbt-ae-167', 0, 'A', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-167-opt-1', 'card-dbt-ae-167', 1, 'B', '自動的に version 2 が適用される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-167-opt-2', 'card-dbt-ae-167', 2, 'C', 'version 1 のスキーマとしてパースされる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-167-opt-3', 'card-dbt-ae-167', 3, 'D', 'ファイルが無視される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-167-ans-0', 'card-dbt-ae-167', 'card-dbt-ae-167-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-168', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`target/compiled/` にSQLが生成されていない場合、エラーの種類は？
- A. SQLランタイムエラー
- B. Jinjaコンパイルエラー
- C. DWH接続エラー
- D. YAMLバリデーションエラー', '**正解: B**
JinjaコンパイルエラーではdbtがSQL生成に失敗するため `target/compiled` にファイルが出力されない。ランタイムエラーの場合はSQLは存在する。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-168-opt-0', 'card-dbt-ae-168', 0, 'A', 'SQLランタイムエラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-168-opt-1', 'card-dbt-ae-168', 1, 'B', 'Jinjaコンパイルエラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-168-opt-2', 'card-dbt-ae-168', 2, 'C', 'DWH接続エラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-168-opt-3', 'card-dbt-ae-168', 3, 'D', 'YAMLバリデーションエラー', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-168-ans-0', 'card-dbt-ae-168', 'card-dbt-ae-168-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-169', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'incremental モデルの `unique_key` にリスト（複数カラム）を指定した場合の動作は？
- A. エラーが発生する
- B. 複合キーとして複数カラムの組み合わせで一致判定する
- C. 最初のカラムのみが使用される
- D. 各カラムが独立したキーとして使用される', '**正解: B**
`unique_key=[''user_id'', ''event_date'']` のように複数カラムを指定すると、複合キーとして一致判定する。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-169-opt-0', 'card-dbt-ae-169', 0, 'A', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-169-opt-1', 'card-dbt-ae-169', 1, 'B', '複合キーとして複数カラムの組み合わせで一致判定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-169-opt-2', 'card-dbt-ae-169', 2, 'C', '最初のカラムのみが使用される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-169-opt-3', 'card-dbt-ae-169', 3, 'D', '各カラムが独立したキーとして使用される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-169-ans-0', 'card-dbt-ae-169', 'card-dbt-ae-169-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-170', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のモデルで `Compilation Error: ''source'' is undefined` が発生する原因は？
```sql
select *
from source(''stripe'', ''payments'')
```', '**Jinja の二重波括弧 `{{ }}` が欠けている**。
修正: `from {{ source(''stripe'', ''payments'') }}`
`source()` はJinjaマクロなので `{{ }}` 内で呼び出す必要がある。`ref()` も同様。', 'https://docs.getdbt.com/docs/build/sources');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-171', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt_project.yml` の `flags` セクションで設定できるものは？
- A. `require_explicit_package_overrides_for_builtin_materializations`
- B. `warn_error`
- C. `full_refresh`
- D. 上記すべて', '**正解: D**
`flags` セクションは動作変更フラグに加え、`warn_error`、`full_refresh`、`fail_fast`、`send_anonymous_usage_stats` 等の汎用グローバルフラグもプロジェクトレベルで設定可能。CLI フラグや環境変数の代わりにバージョン管理されたデフォルト値として使える。', 'https://docs.getdbt.com/reference/global-configs/about-global-configs');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-171-opt-0', 'card-dbt-ae-171', 0, 'A', '`require_explicit_package_overrides_for_builtin_materializations`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-171-opt-1', 'card-dbt-ae-171', 1, 'B', '`warn_error`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-171-opt-2', 'card-dbt-ae-171', 2, 'C', '`full_refresh`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-171-opt-3', 'card-dbt-ae-171', 3, 'D', '上記すべて', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-171-ans-0', 'card-dbt-ae-171', 'card-dbt-ae-171-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-172', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'dbt で `--no-partial-parse` フラグの効果は？
- A. 部分的な解析を無効化し、全ファイルを再解析する
- B. 解析をスキップする
- C. エラーのあるファイルのみ解析する
- D. 並列解析を無効化する', '**正解: A**
通常のpartial parseは変更のあったファイルのみ再解析するが、`--no-partial-parse` は全ファイルを最初から解析する。キャッシュ関連の問題解決に使用。', 'https://docs.getdbt.com/reference/global-configs/parsing');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-172-opt-0', 'card-dbt-ae-172', 0, 'A', '部分的な解析を無効化し、全ファイルを再解析する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-172-opt-1', 'card-dbt-ae-172', 1, 'B', '解析をスキップする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-172-opt-2', 'card-dbt-ae-172', 2, 'C', 'エラーのあるファイルのみ解析する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-172-opt-3', 'card-dbt-ae-172', 3, 'D', '並列解析を無効化する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-172-ans-0', 'card-dbt-ae-172', 'card-dbt-ae-172-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-173', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt debug --config-dir` の出力内容は？
- A. profiles.yml の場所を表示する
- B. dbt の設定内容をすべて表示する
- C. プロジェクトの構成を検証する
- D. 環境変数の値を表示する', '**正解: A**
`profiles.yml` が配置されているディレクトリパスを表示する。`~/.dbt/` がデフォルト。', 'https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-173-opt-0', 'card-dbt-ae-173', 0, 'A', 'profiles.yml の場所を表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-173-opt-1', 'card-dbt-ae-173', 1, 'B', 'dbt の設定内容をすべて表示する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-173-opt-2', 'card-dbt-ae-173', 2, 'C', 'プロジェクトの構成を検証する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-173-opt-3', 'card-dbt-ae-173', 3, 'D', '環境変数の値を表示する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-173-ans-0', 'card-dbt-ae-173', 'card-dbt-ae-173-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-174', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'incremental モデルの初回実行時の動作は？
- A. エラーが発生する
- B. テーブルが存在しないため `CREATE TABLE AS` で全データを処理する
- C. 空のテーブルが作成される
- D. view として作成される', '**正解: B**
初回実行時はテーブルが存在しないため `is_incremental()` が False を返し、WHERE句がスキップされて全データが処理される。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-174-opt-0', 'card-dbt-ae-174', 0, 'A', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-174-opt-1', 'card-dbt-ae-174', 1, 'B', 'テーブルが存在しないため `CREATE TABLE AS` で全データを処理する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-174-opt-2', 'card-dbt-ae-174', 2, 'C', '空のテーブルが作成される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-174-opt-3', 'card-dbt-ae-174', 3, 'D', 'view として作成される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-174-ans-0', 'card-dbt-ae-174', 'card-dbt-ae-174-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-175', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-3', 'エラーがSQLの問題かdbtの問題かを切り分ける手順として、以下を正しい順序に並べよ。
ステップ:
- (a) DWHでもエラーなら純粋なSQL問題と判断
- (b) `target/compiled/` のSQLファイルを確認
- (c) そのSQLをDWHに直接貼り付けて実行
- (d) `dbt compile` でコンパイル済みSQLを取得
- (e) DWHでは成功ならdbt固有の問題と判断', '**正解: d → b → c → a/e**
1. **(d)** `dbt compile` で**コンパイル済みSQL**を取得
2. **(b)** `target/compiled/` の**SQLファイルを確認**
3. **(c)** そのSQLを**DWHに直接貼り付けて実行**
4. **(a) DWHでもエラー** → 純粋な**SQL問題**
5. **(e) DWHでは成功** → **dbt固有の問題**（Jinja, config, materialization等）', 'https://docs.getdbt.com/docs/guides/debug-errors');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-175-opt-0', 'card-dbt-ae-175', 0, 'a', 'DWHでもエラーなら純粋なSQL問題と判断', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-175-opt-1', 'card-dbt-ae-175', 1, 'b', '`target/compiled/` のSQLファイルを確認', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-175-opt-2', 'card-dbt-ae-175', 2, 'c', 'そのSQLをDWHに直接貼り付けて実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-175-opt-3', 'card-dbt-ae-175', 3, 'd', '`dbt compile` でコンパイル済みSQLを取得', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-175-opt-4', 'card-dbt-ae-175', 4, 'e', 'DWHでは成功ならdbt固有の問題と判断', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-175-ans-0', 'card-dbt-ae-175', 'card-dbt-ae-175-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-175-ans-1', 'card-dbt-ae-175', 'card-dbt-ae-175-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-175-ans-2', 'card-dbt-ae-175', 'card-dbt-ae-175-opt-2', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-175-ans-3', 'card-dbt-ae-175', 'card-dbt-ae-175-opt-0', NULL, 3);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-176', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'model contract の `enforced: true` 設定時に `materialized: view` を使った場合は？
- A. 正常に動作する
- B. エラーが発生する（contract は table/incremental のみ対応）
- C. 警告が出るが動作する
- D. 自動的に table に変更される', '**正解: A**
view でも contract は動作する（カラム名とデータ型の検証のみ）。ただし `constraints`（NOT NULL 等）は view では強制されない。table/incremental では constraints も含めてフルサポートされる。', 'https://docs.getdbt.com/docs/collaborate/govern/model-contracts');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-176-opt-0', 'card-dbt-ae-176', 0, 'A', '正常に動作する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-176-opt-1', 'card-dbt-ae-176', 1, 'B', 'エラーが発生する（contract は table/incremental のみ対応）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-176-opt-2', 'card-dbt-ae-176', 2, 'C', '警告が出るが動作する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-176-opt-3', 'card-dbt-ae-176', 3, 'D', '自動的に table に変更される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-176-ans-0', 'card-dbt-ae-176', 'card-dbt-ae-176-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-177', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'エラーが純粋なSQL問題かdbt固有の問題かを切り分ける最も効果的な方法は？
- A. `dbt debug` を実行する
- B. `logs/dbt.log` を確認する
- C. `target/compiled/` のSQLをDWHに直接貼り付けて実行する
- D. モデルの materialization を変更して再実行する', '**正解: C**
DWHでもエラー → 純粋なSQL問題。DWHでは成功 → dbt固有の問題（Jinja, config, materialization等）。', 'https://docs.getdbt.com/docs/guides/debug-errors');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-177-opt-0', 'card-dbt-ae-177', 0, 'A', '`dbt debug` を実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-177-opt-1', 'card-dbt-ae-177', 1, 'B', '`logs/dbt.log` を確認する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-177-opt-2', 'card-dbt-ae-177', 2, 'C', '`target/compiled/` のSQLをDWHに直接貼り付けて実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-177-opt-3', 'card-dbt-ae-177', 3, 'D', 'モデルの materialization を変更して再実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-177-ans-0', 'card-dbt-ae-177', 'card-dbt-ae-177-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-178', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のエラーの原因は？
```
Compilation Error in model my_model
  Could not find a matching unique_key column in the target table
```
- A. `unique_key` で指定したカラムがターゲットテーブルに存在しない
- B. `unique_key` の値が重複している
- C. `unique_key` が NULL を含んでいる
- D. `unique_key` のデータ型が一致しない', '**正解: A**
incremental モデルで `unique_key` に指定したカラム名がDWH上のターゲットテーブルのスキーマに存在しない場合に発生する。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-178-opt-0', 'card-dbt-ae-178', 0, 'A', '`unique_key` で指定したカラムがターゲットテーブルに存在しない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-178-opt-1', 'card-dbt-ae-178', 1, 'B', '`unique_key` の値が重複している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-178-opt-2', 'card-dbt-ae-178', 2, 'C', '`unique_key` が NULL を含んでいる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-178-opt-3', 'card-dbt-ae-178', 3, 'D', '`unique_key` のデータ型が一致しない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-178-ans-0', 'card-dbt-ae-178', 'card-dbt-ae-178-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-179', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下の YAML エラーメッセージの原因として最も考えられるものは？
```
Compilation Error: Did not find any resources in the schema.yml
```
- A. ファイル名が正しくない
- B. YAML のルートキーが間違っている（例: `model:` instead of `models:`）
- C. ファイルが空である
- D. dbt_project.yml にパスが登録されていない', '**正解: B**
YAML のルートキーが正しくない場合（例: 単数形 `model:` や typo）、dbt はリソースを認識できずこのエラーを出す。正しくは `models:`, `sources:`, `seeds:` などの複数形。', 'https://docs.getdbt.com/reference/dbt_project.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-179-opt-0', 'card-dbt-ae-179', 0, 'A', 'ファイル名が正しくない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-179-opt-1', 'card-dbt-ae-179', 1, 'B', 'YAML のルートキーが間違っている（例: `model:` instead of `models:`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-179-opt-2', 'card-dbt-ae-179', 2, 'C', 'ファイルが空である', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-179-opt-3', 'card-dbt-ae-179', 3, 'D', 'dbt_project.yml にパスが登録されていない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-179-ans-0', 'card-dbt-ae-179', 'card-dbt-ae-179-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-180', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt run --select tag:daily --exclude tag:deprecated` の効果は？
- A. daily タグのモデルから deprecated タグのモデルを除外して実行する
- B. daily タグと deprecated タグの両方を持つモデルのみ実行する
- C. エラーが発生する
- D. すべてのモデルを実行する', '**正解: A**
`--select` で daily タグのモデルを選択し、`--exclude` で deprecated タグのモデルを除外する。集合演算の差集合。', 'https://docs.getdbt.com/reference/node-selection/exclude');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-180-opt-0', 'card-dbt-ae-180', 0, 'A', 'daily タグのモデルから deprecated タグのモデルを除外して実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-180-opt-1', 'card-dbt-ae-180', 1, 'B', 'daily タグと deprecated タグの両方を持つモデルのみ実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-180-opt-2', 'card-dbt-ae-180', 2, 'C', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-180-opt-3', 'card-dbt-ae-180', 3, 'D', 'すべてのモデルを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-180-ans-0', 'card-dbt-ae-180', 'card-dbt-ae-180-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-181', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt --warn-error` フラグの効果は？
- A. 警告メッセージを非表示にする
- B. 通常の警告をエラーに昇格させる
- C. エラーを警告にダウングレードする
- D. 警告のみをログに出力する', '**正解: B**
CI/CD環境で厳密なチェックを行う場合に有用。警告（WARN）をエラー（ERROR）に昇格させてビルドを停止する。', 'https://docs.getdbt.com/reference/global-configs/warnings');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-181-opt-0', 'card-dbt-ae-181', 0, 'A', '警告メッセージを非表示にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-181-opt-1', 'card-dbt-ae-181', 1, 'B', '通常の警告をエラーに昇格させる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-181-opt-2', 'card-dbt-ae-181', 2, 'C', 'エラーを警告にダウングレードする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-181-opt-3', 'card-dbt-ae-181', 3, 'D', '警告のみをログに出力する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-181-ans-0', 'card-dbt-ae-181', 'card-dbt-ae-181-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-182', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-3', '`dbt debug` コマンドが確認する項目は？（該当するものをすべて選択）
- A. 全モデルのコンパイル
- B. `dbt_project.yml` の存在
- C. DWHへの接続
- D. 必要な依存パッケージ
- E. `profiles.yml` の存在と設定', '**正解: B, C, E**
`dbt debug` はプロジェクトの基本設定と接続を検証する。モデルのコンパイルやパッケージの確認は行わない。', 'https://docs.getdbt.com/reference/commands/debug');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-182-opt-0', 'card-dbt-ae-182', 0, 'A', '全モデルのコンパイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-182-opt-1', 'card-dbt-ae-182', 1, 'B', '`dbt_project.yml` の存在', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-182-opt-2', 'card-dbt-ae-182', 2, 'C', 'DWHへの接続', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-182-opt-3', 'card-dbt-ae-182', 3, 'D', '必要な依存パッケージ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-182-opt-4', 'card-dbt-ae-182', 4, 'E', '`profiles.yml` の存在と設定', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-182-ans-0', 'card-dbt-ae-182', 'card-dbt-ae-182-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-182-ans-1', 'card-dbt-ae-182', 'card-dbt-ae-182-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-182-ans-2', 'card-dbt-ae-182', 'card-dbt-ae-182-opt-4', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-183', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のエラーの原因は？
```
Compilation Error
  Recursion detected in model ''my_model'': circular reference
```
- A. モデルが自身を `ref()` で参照している
- B. 2つ以上のモデルが循環参照している
- C. A または B
- D. `{{ this }}` の使用が原因', '**正解: C**
DAG上で循環参照が検出された場合に発生する。モデルAがBを参照し、BがAを参照するケースなど。`{{ this }}` は自身のテーブル参照で循環ではない。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/this');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-183-opt-0', 'card-dbt-ae-183', 0, 'A', 'モデルが自身を `ref()` で参照している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-183-opt-1', 'card-dbt-ae-183', 1, 'B', '2つ以上のモデルが循環参照している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-183-opt-2', 'card-dbt-ae-183', 2, 'C', 'A または B', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-183-opt-3', 'card-dbt-ae-183', 3, 'D', '`{{ this }}` の使用が原因', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-183-ans-0', 'card-dbt-ae-183', 'card-dbt-ae-183-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-184', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のモデルで `grants` が適用されない原因は？
```yaml
models:
  - name: dim_customers
    grants:
      select: [''analyst_role'']
```', '**`grants` は `config:` の下に入れるべき**。
修正:
```yaml
models:
  - name: dim_customers
    config:
      grants:
        select: [''analyst_role'']
```', 'https://docs.getdbt.com/reference/resource-configs/grants');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-185', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下のエラーの原因と解決策は？
```
Runtime Error: Database error while listing schemas
```', '**DWH への接続に問題がある**。考えられる原因:
1. `profiles.yml` の認証情報（パスワード、キーペア等）が正しくない
2. DWH がダウンしているかネットワークの問題
3. 指定された role/warehouse に権限がない
解決: `dbt debug` で接続を確認し、`profiles.yml` の設定を見直す。', 'https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-186', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-3', '各ディレクトリ/ファイル（左列）を、その格納内容（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `target/compiled/` | a. 各モデルの実行結果（status, timing等） |
| 2. `target/run/` | b. 実行時の詳細ログ |
| 3. `target/run_results.json` | c. DDLラッパー付きの実行済みSQL（CREATE TABLE AS等） |
| 4. `logs/dbt.log` | d. Jinjaが展開された純粋なSQL（SELECT文） |', '**1-d, 2-c, 3-a, 4-b**
| ディレクトリ | 内容 |
|---|---|
| `target/compiled/` → d | Jinjaが展開された**純粋なSQL**（SELECT文） |
| `target/run/` → c | DDLラッパー付きの**実行済みSQL**（CREATE TABLE AS等） |
| `target/run_results.json` → a | 各モデルの**実行結果**（status, timing等） |
| `logs/dbt.log` → b | 実行時の**詳細ログ** |', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-0', 'card-dbt-ae-186', 0, '1', 'target/compiled/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-1', 'card-dbt-ae-186', 1, '2', 'target/run/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-2', 'card-dbt-ae-186', 2, '3', 'target/run_results.json', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-3', 'card-dbt-ae-186', 3, '4', 'logs/dbt.log', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-4', 'card-dbt-ae-186', 4, 'a', '各モデルの実行結果（status, timing等）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-5', 'card-dbt-ae-186', 5, 'b', '実行時の詳細ログ', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-6', 'card-dbt-ae-186', 6, 'c', 'DDLラッパー付きの実行済みSQL（CREATE TABLE AS等）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-186-opt-7', 'card-dbt-ae-186', 7, 'd', 'Jinjaが展開された純粋なSQL（SELECT文）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-186-ans-0', 'card-dbt-ae-186', 'card-dbt-ae-186-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-186-ans-1', 'card-dbt-ae-186', 'card-dbt-ae-186-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-186-ans-2', 'card-dbt-ae-186', 'card-dbt-ae-186-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-186-ans-3', 'card-dbt-ae-186', 'card-dbt-ae-186-opt-3', NULL, 1);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-187', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '以下の config 設定で Python モデルのビルドが失敗する原因は？
```python
def model(dbt, session):
    dbt.config(materialized=''view'')
    df = dbt.ref(''stg_orders'')
    return df.group_by(''customer_id'').agg(count(''order_id''))
```', '**`materialized=''view''`** が原因。Python モデルは `table` か `incremental` のみ対応。
修正: `dbt.config(materialized=''table'')`
view と ephemeral は Python モデルでは使用不可。', 'https://docs.getdbt.com/docs/build/incremental-models');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-188', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-3', 'dbt プロジェクトの新規セットアップ手順として、以下を正しい順序に並べよ。
ステップ:
- (a) `dbt run`
- (b) `dbt init`
- (c) `profiles.yml` 設定
- (d) `dbt debug`
- (e) `dbt deps`', '**正解: b → c → d → e → a**
1. **(b) `dbt init`** — プロジェクトの雛形を作成
2. **(c) `profiles.yml` 設定** — DWH接続情報を設定
3. **(d) `dbt debug`** — 接続テスト
4. **(e) `dbt deps`** — パッケージをインストール
5. **(a) `dbt run`** — モデルを実行', 'https://docs.getdbt.com/docs/build/packages');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-188-opt-0', 'card-dbt-ae-188', 0, 'a', '`dbt run`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-188-opt-1', 'card-dbt-ae-188', 1, 'b', '`dbt init`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-188-opt-2', 'card-dbt-ae-188', 2, 'c', '`profiles.yml` 設定', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-188-opt-3', 'card-dbt-ae-188', 3, 'd', '`dbt debug`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-188-opt-4', 'card-dbt-ae-188', 4, 'e', '`dbt deps`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-188-ans-0', 'card-dbt-ae-188', 'card-dbt-ae-188-opt-1', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-188-ans-1', 'card-dbt-ae-188', 'card-dbt-ae-188-opt-2', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-188-ans-2', 'card-dbt-ae-188', 'card-dbt-ae-188-opt-3', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-188-ans-3', 'card-dbt-ae-188', 'card-dbt-ae-188-opt-4', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-188-ans-4', 'card-dbt-ae-188', 'card-dbt-ae-188-opt-0', NULL, 4);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-189', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt debug` コマンドが検証**しない**ものはどれか？
- A. profiles.yml の設定
- B. DWHへの接続
- C. dbtのバージョン情報
- D. モデルのSQL構文エラー', '**正解: D**
`dbt debug` はプロファイル設定、接続テスト、バージョン、`dbt_project.yml` の妥当性を検証するが、**モデルのSQL問題は検出しない**。', 'https://docs.getdbt.com/docs/core/connect-data-platform/profiles.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-189-opt-0', 'card-dbt-ae-189', 0, 'A', 'profiles.yml の設定', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-189-opt-1', 'card-dbt-ae-189', 1, 'B', 'DWHへの接続', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-189-opt-2', 'card-dbt-ae-189', 2, 'C', 'dbtのバージョン情報', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-189-opt-3', 'card-dbt-ae-189', 3, 'D', 'モデルのSQL構文エラー', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-189-ans-0', 'card-dbt-ae-189', 'card-dbt-ae-189-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-190', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`dbt run --select +my_model+ --exclude my_model` の効果は？
- A. my_model の上流と下流を実行するが、my_model 自体は実行しない
- B. 何も実行されない
- C. my_model のみ実行する
- D. エラーが発生する', '**正解: A**
`+my_model+` で上流+my_model+下流を選択し、`--exclude my_model` で my_model 自体を除外。結果として上流と下流のみ実行される。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-190-opt-0', 'card-dbt-ae-190', 0, 'A', 'my_model の上流と下流を実行するが、my_model 自体は実行しない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-190-opt-1', 'card-dbt-ae-190', 1, 'B', '何も実行されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-190-opt-2', 'card-dbt-ae-190', 2, 'C', 'my_model のみ実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-190-opt-3', 'card-dbt-ae-190', 3, 'D', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-190-ans-0', 'card-dbt-ae-190', 'card-dbt-ae-190-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-191', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-3', '各エラーメッセージ（左列）を、その原因（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `Relation does not exist` | a. ゼロ除算 |
| 2. `ambiguous column name` | b. Jinja変数またはマクロの未定義 |
| 3. `division by zero` | c. JOINで同名カラムが複数存在 |
| 4. `Compilation Error: ''xxx'' is undefined` | d. 参照先テーブルが未作成またはスキーマ違い |', '**1-d, 2-c, 3-a, 4-b**
| エラーメッセージ | 原因 |
|---|---|
| `Relation does not exist` → d | 参照先テーブルが**未作成**またはスキーマ違い |
| `ambiguous column name` → c | JOINで**同名カラム**が複数存在 |
| `division by zero` → a | **ゼロ除算** |
| `Compilation Error: ''xxx'' is undefined` → b | Jinja変数または**マクロの未定義** |', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-0', 'card-dbt-ae-191', 0, '1', 'Relation does not exist', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-1', 'card-dbt-ae-191', 1, '2', 'ambiguous column name', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-2', 'card-dbt-ae-191', 2, '3', 'division by zero', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-3', 'card-dbt-ae-191', 3, '4', 'Compilation Error: ''xxx'' is undefined', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-4', 'card-dbt-ae-191', 4, 'a', 'ゼロ除算', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-5', 'card-dbt-ae-191', 5, 'b', 'Jinja変数またはマクロの未定義', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-6', 'card-dbt-ae-191', 6, 'c', 'JOINで同名カラムが複数存在', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-191-opt-7', 'card-dbt-ae-191', 7, 'd', '参照先テーブルが未作成またはスキーマ違い', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-191-ans-0', 'card-dbt-ae-191', 'card-dbt-ae-191-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-191-ans-1', 'card-dbt-ae-191', 'card-dbt-ae-191-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-191-ans-2', 'card-dbt-ae-191', 'card-dbt-ae-191-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-191-ans-3', 'card-dbt-ae-191', 'card-dbt-ae-191-opt-3', NULL, 1);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-192', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', 'snapshot の `check` strategy で `check_cols: ''all''` を設定した場合の動作は？
- A. すべてのカラムの変更を監視する
- B. unique_key カラムのみ監視する
- C. エラーが発生する
- D. updated_at カラムのみ監視する', '**正解: A**
`check_cols: ''all''` は全カラムの値を比較して変更を検出する。カラム数が多いとパフォーマンスに影響する可能性がある。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-192-opt-0', 'card-dbt-ae-192', 0, 'A', 'すべてのカラムの変更を監視する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-192-opt-1', 'card-dbt-ae-192', 1, 'B', 'unique_key カラムのみ監視する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-192-opt-2', 'card-dbt-ae-192', 2, 'C', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-192-opt-3', 'card-dbt-ae-192', 3, 'D', 'updated_at カラムのみ監視する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-192-ans-0', 'card-dbt-ae-192', 'card-dbt-ae-192-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-193', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`--defer` フラグの役割は？
- A. モデルの実行を延期する
- B. 未実行のモデルの `ref()` を別環境のアーティファクトで解決する
- C. テスト実行を後回しにする
- D. エラー発生時に実行を延期する', '**正解: B**
CIで変更モデルのみ実行する際、未ビルドの上流モデルを**本番テーブルで代替**する。state と組み合わせて使用する。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/ref');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-193-opt-0', 'card-dbt-ae-193', 0, 'A', 'モデルの実行を延期する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-193-opt-1', 'card-dbt-ae-193', 1, 'B', '未実行のモデルの `ref()` を別環境のアーティファクトで解決する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-193-opt-2', 'card-dbt-ae-193', 2, 'C', 'テスト実行を後回しにする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-193-opt-3', 'card-dbt-ae-193', 3, 'D', 'エラー発生時に実行を延期する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-193-ans-0', 'card-dbt-ae-193', 'card-dbt-ae-193-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-194', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-3', '`log()` 関数の用途は？
- A. DWHにログテーブルを作成する
- B. Jinjaコンパイル時にメッセージを出力する
- C. テスト結果をログファイルに保存する
- D. モデルの実行時間を記録する', '**正解: B**
`{{ log("Debug: variable = " ~ my_var, info=True) }}` でコンパイル時にメッセージを出力する。デバッグに有用。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-194-opt-0', 'card-dbt-ae-194', 0, 'A', 'DWHにログテーブルを作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-194-opt-1', 'card-dbt-ae-194', 1, 'B', 'Jinjaコンパイル時にメッセージを出力する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-194-opt-2', 'card-dbt-ae-194', 2, 'C', 'テスト結果をログファイルに保存する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-194-opt-3', 'card-dbt-ae-194', 3, 'D', 'モデルの実行時間を記録する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-194-ans-0', 'card-dbt-ae-194', 'card-dbt-ae-194-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-195', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-3', '各テスト severity（左列）を、ビルドへの影響（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. error | a. テスト失敗でも警告のみ、ビルドは続行 |
| 2. warn | b. テスト失敗でエラー発生、`dbt build` では下流モデルがスキップされる |', '**1-b, 2-a**
| severity | 動作 |
|---|---|
| **error**（デフォルト）→ b | テスト失敗でエラー発生。`dbt build` では下流モデルが**スキップされる** |
| **warn** → a | テスト失敗でも警告のみ。ビルドは**続行**される |', 'https://docs.getdbt.com/reference/resource-configs/severity');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-195-opt-0', 'card-dbt-ae-195', 0, '1', 'error', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-195-opt-1', 'card-dbt-ae-195', 1, '2', 'warn', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-195-opt-2', 'card-dbt-ae-195', 2, 'a', 'テスト失敗でも警告のみ、ビルドは続行', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-195-opt-3', 'card-dbt-ae-195', 3, 'b', 'テスト失敗でエラー発生、`dbt build` では下流モデルがスキップされる', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-195-ans-0', 'card-dbt-ae-195', 'card-dbt-ae-195-opt-0', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-195-ans-1', 'card-dbt-ae-195', 'card-dbt-ae-195-opt-1', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-196', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', '`dbt clone` でゼロコピークローンが利用できないプラットフォームの場合、何が作成されるか？
- A. ポインタービュー（`select * from <source_object>`）
- B. テーブルの完全コピー
- C. マテリアライズドビュー
- D. エラーが発生してスキップされる', '**ポインタービュー**（`select * from <source_object>`）が作成される。データのコピーは行われず、元オブジェクトを参照するビューが作られる。', 'https://docs.getdbt.com/reference/commands/clone');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-196-opt-0', 'card-dbt-ae-196', 0, 'A', 'ポインタービュー（`select * from <source_object>`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-196-opt-1', 'card-dbt-ae-196', 1, 'B', 'テーブルの完全コピー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-196-opt-2', 'card-dbt-ae-196', 2, 'C', 'マテリアライズドビュー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-196-opt-3', 'card-dbt-ae-196', 3, 'D', 'エラーが発生してスキップされる', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-197', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', 'オーケストレーター（Airflow等）から dbt を実行した際にジョブが失敗した。最初に確認すべきことは？
- A. Airflow のログを確認する
- B. dbt のログ（`logs/dbt.log`）を確認する
- C. DWH のクエリ履歴を確認する
- D. `dbt debug` を実行する', '**正解: B**
dbt のログファイル（`logs/dbt.log`）に詳細なエラーメッセージとスタックトレースが記録される。オーケストレーターのログは dbt の出力の一部しか表示しないことが多い。', 'https://docs.getdbt.com/reference/commands/debug');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-197-opt-0', 'card-dbt-ae-197', 0, 'A', 'Airflow のログを確認する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-197-opt-1', 'card-dbt-ae-197', 1, 'B', 'dbt のログ（`logs/dbt.log`）を確認する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-197-opt-2', 'card-dbt-ae-197', 2, 'C', 'DWH のクエリ履歴を確認する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-197-opt-3', 'card-dbt-ae-197', 3, 'D', '`dbt debug` を実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-197-ans-0', 'card-dbt-ae-197', 'card-dbt-ae-197-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-198', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', '`dbt clone` コマンドで、既存のリレーションを上書きしてクローンし直すには何が必要か？
- A. `--force` フラグ
- B. `--full-refresh` フラグ
- C. `--overwrite` フラグ
- D. デフォルトで上書きされる', '**正解: B**
デフォルトでは既存リレーションを再作成しない。`dbt clone --state path/to/artifacts --full-refresh` で上書きする。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-198-opt-0', 'card-dbt-ae-198', 0, 'A', '`--force` フラグ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-198-opt-1', 'card-dbt-ae-198', 1, 'B', '`--full-refresh` フラグ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-198-opt-2', 'card-dbt-ae-198', 2, 'C', '`--overwrite` フラグ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-198-opt-3', 'card-dbt-ae-198', 3, 'D', 'デフォルトで上書きされる', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-198-ans-0', 'card-dbt-ae-198', 'card-dbt-ae-198-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-199', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', 'CI/CD で `dbt clone` と `--defer` のどちらを使うべきか、以下の説明から正しいものを選べ。
- A. `dbt clone` はオブジェクトを実際にコピーし、`--defer` は実行時に未ビルドのモデルを別環境で代替する
- B. 両者は同じ機能の別名である
- C. `--defer` はオブジェクトをコピーし、`dbt clone` は実行時に代替する
- D. どちらもゼロコピークローンを使用する', '**正解: A**
`dbt clone` はスキーマ間でオブジェクトをコピー（永続化）する。`--defer` は実行時にビルドされていないモデルを別の環境（通常は本番）のテーブルで代替する参照解決の仕組み。', 'https://docs.getdbt.com/reference/node-selection/defer');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-199-opt-0', 'card-dbt-ae-199', 0, 'A', '`dbt clone` はオブジェクトを実際にコピーし、`--defer` は実行時に未ビルドのモデルを別環境で代替する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-199-opt-1', 'card-dbt-ae-199', 1, 'B', '両者は同じ機能の別名である', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-199-opt-2', 'card-dbt-ae-199', 2, 'C', '`--defer` はオブジェクトをコピーし、`dbt clone` は実行時に代替する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-199-opt-3', 'card-dbt-ae-199', 3, 'D', 'どちらもゼロコピークローンを使用する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-199-ans-0', 'card-dbt-ae-199', 'card-dbt-ae-199-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-200', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', '`dbt clone` の実行を高速化するために使えるフラグは？
- A. `--threads`
- B. `--parallel`
- C. `--concurrency`
- D. `--workers`', '**`--threads` フラグ**。各クローン文は独立しているため、並列数を増やせる。
例: `dbt clone --state path/to/artifacts --threads 50`', 'https://docs.getdbt.com/reference/commands/clone');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-200-opt-0', 'card-dbt-ae-200', 0, 'A', '`--threads`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-200-opt-1', 'card-dbt-ae-200', 1, 'B', '`--parallel`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-200-opt-2', 'card-dbt-ae-200', 2, 'C', '`--concurrency`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-200-opt-3', 'card-dbt-ae-200', 3, 'D', '`--workers`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-201', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-4', '`dbt clone` が対応する DWH プラットフォームはどれか？（該当するものをすべて選択）
- A. Redshift
- B. BigQuery
- C. Databricks
- D. Snowflake
- E. PostgreSQL', '**正解: B, C, D**
Snowflake, BigQuery, Databricks はゼロコピークローンに対応。非対応プラットフォームでは `select * from` のポインタービューが作成される。', 'https://docs.getdbt.com/reference/commands/clone');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-201-opt-0', 'card-dbt-ae-201', 0, 'A', 'Redshift', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-201-opt-1', 'card-dbt-ae-201', 1, 'B', 'BigQuery', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-201-opt-2', 'card-dbt-ae-201', 2, 'C', 'Databricks', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-201-opt-3', 'card-dbt-ae-201', 3, 'D', 'Snowflake', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-201-opt-4', 'card-dbt-ae-201', 4, 'E', 'PostgreSQL', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-201-ans-0', 'card-dbt-ae-201', 'card-dbt-ae-201-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-201-ans-1', 'card-dbt-ae-201', 'card-dbt-ae-201-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-201-ans-2', 'card-dbt-ae-201', 'card-dbt-ae-201-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-202', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', '開発環境を高速にセットアップするために `dbt clone` を使う場合の正しいコマンドは？
```bash
dbt clone ______ path/to/prod-artifacts
```', '**正解: `--state`**
`dbt clone --state path/to/prod-artifacts` で本番環境のアーティファクトを参照し、全モデルをゼロコピークローンする。', 'https://docs.getdbt.com/reference/commands/clone');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-203', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', '`dbt clone` コマンドの主な用途は？
- A. Gitリポジトリをクローンする
- B. データをコピーせずにゼロコピークローンを作成する
- C. モデルのバックアップを作成する
- D. テスト用のデータセットを複製する', '**正解: B**
DWH側の機能（Snowflakeのclone等）を活用して、データをコピーせず開発環境へ本番データを素早くクローンする。', 'https://docs.getdbt.com/reference/commands/clone');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-203-opt-0', 'card-dbt-ae-203', 0, 'A', 'Gitリポジトリをクローンする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-203-opt-1', 'card-dbt-ae-203', 1, 'B', 'データをコピーせずにゼロコピークローンを作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-203-opt-2', 'card-dbt-ae-203', 2, 'C', 'モデルのバックアップを作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-203-opt-3', 'card-dbt-ae-203', 3, 'D', 'テスト用のデータセットを複製する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-203-ans-0', 'card-dbt-ae-203', 'card-dbt-ae-203-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-204', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-4', 'Airflow で `BashOperator` から `dbt run` を実行し、dbt のエラーコード（非ゼロ）を受け取った。失敗したモデルのみを再実行するには？
- A. `dbt retry`
- B. `dbt run --select result:error --state ./target`
- C. `dbt run --retry-failed`
- D. `dbt rerun`', '**`dbt retry`** を使用する。前回の実行結果（`target/run_results.json`）を参照し、失敗したノードのみを再実行する。
Airflow 側で `dbt retry` を後続タスクとして設定しておくパターンが一般的。', 'https://docs.getdbt.com/reference/commands/retry');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-204-opt-0', 'card-dbt-ae-204', 0, 'A', '`dbt retry`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-204-opt-1', 'card-dbt-ae-204', 1, 'B', '`dbt run --select result:error --state ./target`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-204-opt-2', 'card-dbt-ae-204', 2, 'C', '`dbt run --retry-failed`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-204-opt-3', 'card-dbt-ae-204', 3, 'D', '`dbt rerun`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-205', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'テストで `store_failures: true` を設定すると何が起きるか？
- A. テスト失敗行がDWHのテーブルに保存される
- B. テスト結果がログファイルに出力される
- C. テスト失敗時にSlack通知が送られる
- D. テスト失敗行がCSVファイルにエクスポートされる', 'テスト失敗時に、**失敗した行がDWHのテーブルに保存される**。デフォルトで `<target_schema>_dbt_test__audit` スキーマにテーブルが作成される。
これにより失敗の原因を後からクエリして詳細に調査できる。', 'https://docs.getdbt.com/reference/resource-configs/store_failures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-205-opt-0', 'card-dbt-ae-205', 0, 'A', 'テスト失敗行がDWHのテーブルに保存される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-205-opt-1', 'card-dbt-ae-205', 1, 'B', 'テスト結果がログファイルに出力される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-205-opt-2', 'card-dbt-ae-205', 2, 'C', 'テスト失敗時にSlack通知が送られる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-205-opt-3', 'card-dbt-ae-205', 3, 'D', 'テスト失敗行がCSVファイルにエクスポートされる', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-206', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt run --empty` フラグの効果は？
- A. 空のテーブルを作成する（スキーマのみ）
- B. 空のモデルファイルを生成する
- C. 実行結果を表示しない
- D. テストをスキップする', '**正解: A**
`--empty` は `LIMIT 0` を追加してスキーマのみのテーブルを作成する。CI環境でスキーマの検証に使用。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-206-opt-0', 'card-dbt-ae-206', 0, 'A', '空のテーブルを作成する（スキーマのみ）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-206-opt-1', 'card-dbt-ae-206', 1, 'B', '空のモデルファイルを生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-206-opt-2', 'card-dbt-ae-206', 2, 'C', '実行結果を表示しない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-206-opt-3', 'card-dbt-ae-206', 3, 'D', 'テストをスキップする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-206-ans-0', 'card-dbt-ae-206', 'card-dbt-ae-206-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-207', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'model group の用途は？
- A. モデルを物理的にフォルダ分けする
- B. モデルの論理的なオーナーシップグループを定義する
- C. モデルの実行順序をグループ化する
- D. テストをグループ化して一括実行する', '**正解: B**
`group` はモデルの論理的なオーナーシップを定義する。`access: private` と組み合わせて、同じグループ内のモデルのみが参照可能にする。', 'https://docs.getdbt.com/docs/build/groups');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-207-opt-0', 'card-dbt-ae-207', 0, 'A', 'モデルを物理的にフォルダ分けする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-207-opt-1', 'card-dbt-ae-207', 1, 'B', 'モデルの論理的なオーナーシップグループを定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-207-opt-2', 'card-dbt-ae-207', 2, 'C', 'モデルの実行順序をグループ化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-207-opt-3', 'card-dbt-ae-207', 3, 'D', 'テストをグループ化して一括実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-207-ans-0', 'card-dbt-ae-207', 'card-dbt-ae-207-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-208', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-5', 'dbt の4つの組み込み generic test を**すべて**選べ。
- A. unique
- B. not_null
- C. positive_value
- D. accepted_values
- E. relationships
F. row_count', '**正解: A, B, D, E**
1. **unique** — カラムの全値がユニーク
2. **not_null** — NULL値がない
3. **accepted_values** — 値が指定リスト内
4. **relationships** — 外部キーの参照整合性
`positive_value` や `row_count` は組み込みではない（カスタムで作成可能）。', 'https://docs.getdbt.com/docs/build/data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-208-opt-0', 'card-dbt-ae-208', 0, 'A', 'unique', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-208-opt-1', 'card-dbt-ae-208', 1, 'B', 'not_null', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-208-opt-2', 'card-dbt-ae-208', 2, 'C', 'positive_value', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-208-opt-3', 'card-dbt-ae-208', 3, 'D', 'accepted_values', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-208-opt-4', 'card-dbt-ae-208', 4, 'E', 'relationships', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-208-ans-0', 'card-dbt-ae-208', 'card-dbt-ae-208-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-208-ans-1', 'card-dbt-ae-208', 'card-dbt-ae-208-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-208-ans-2', 'card-dbt-ae-208', 'card-dbt-ae-208-opt-3', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-208-ans-3', 'card-dbt-ae-208', 'card-dbt-ae-208-opt-4', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-209', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt run --full-refresh --select tag:daily` が実行する内容は？
- A. `daily` タグの incremental モデルのみを全再構築する
- B. すべてのモデルを全再構築する
- C. `daily` タグのすべてのモデルを全再構築する
- D. `daily` タグのモデルのテストのみ実行する', '**正解: C**
`tag:daily` で選択されたモデルすべてに `--full-refresh` が適用される。incremental モデルはDROP+再作成、table モデルは通常通りDROP+CREATE。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-209-opt-0', 'card-dbt-ae-209', 0, 'A', '`daily` タグの incremental モデルのみを全再構築する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-209-opt-1', 'card-dbt-ae-209', 1, 'B', 'すべてのモデルを全再構築する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-209-opt-2', 'card-dbt-ae-209', 2, 'C', '`daily` タグのすべてのモデルを全再構築する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-209-opt-3', 'card-dbt-ae-209', 3, 'D', '`daily` タグのモデルのテストのみ実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-209-ans-0', 'card-dbt-ae-209', 'card-dbt-ae-209-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-210', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下の設定でテストが最大10件の失敗まで警告、100件を超えるとエラーになる理由は？
```yaml
data_tests:
  - not_null:
      config:
        error_if: ">100"
        warn_if: ">10"
        severity: error
```', '- `warn_if: ">10"` — 失敗行が10件を超えると**警告**
- `error_if: ">100"` — 失敗行が100件を超えると**エラー**
10件以下は PASS、11-100件は WARN、101件以上は ERROR。`severity` は `error_if`/`warn_if` がない場合のフォールバック。', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-211', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下の YAML でエラーが発生する原因は？
```yaml
models:
  - name: dim_customers
    columns:
    - name: customer_id
      data_tests:
        - unique
        - not_null
```', '**インデントエラー**。`columns` の子要素はインデントが必要:
```yaml
models:
  - name: dim_customers
    columns:
      - name: customer_id
        data_tests:
          - unique
          - not_null
```
YAML ではインデントが構造を定義するため、正確なスペース数が重要。', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-212', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`ephemeral` モデルのデバッグが困難な理由は？
- A. ログが出力されない
- B. DWH上に実体がないため直接クエリで結果を確認できない
- C. `dbt compile` でSQLが生成されない
- D. テストを定義できない', '**正解: B**
ephemeral はCTEとして展開されるため、DWH上にテーブルやビューが存在しない。デバッグ時は一時的に `table` に変更して実体化すると確認しやすい。', 'https://docs.getdbt.com/docs/build/materializations#ephemeral');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-212-opt-0', 'card-dbt-ae-212', 0, 'A', 'ログが出力されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-212-opt-1', 'card-dbt-ae-212', 1, 'B', 'DWH上に実体がないため直接クエリで結果を確認できない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-212-opt-2', 'card-dbt-ae-212', 2, 'C', '`dbt compile` でSQLが生成されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-212-opt-3', 'card-dbt-ae-212', 3, 'D', 'テストを定義できない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-212-ans-0', 'card-dbt-ae-212', 'card-dbt-ae-212-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-213', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下のテスト設定で `accepted_values` テストが警告のみで失敗しない理由は？
```yaml
columns:
  - name: status
    data_tests:
      - accepted_values:
          values: [''active'', ''inactive'']
          config:
            severity: warn
```', '**`severity: warn`** が設定されているため、テスト失敗時にエラーではなく警告のみ発生する。ビルドは停止しない。', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-214', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下の singular test で問題となる箇所は？
```sql
-- tests/check_valid_orders.sql
select count(*)
from {{ ref(''fct_orders'') }}
where total_amount < 0
```', '**`select count(*)`** が問題。singular test は**失敗するレコード自体**を返すべき。
修正:
```sql
select order_id, total_amount
from {{ ref(''fct_orders'') }}
where total_amount < 0
```
`count(*)` だと常に1行（数値）が返り、テストが常に失敗する。', 'https://docs.getdbt.com/docs/build/data-tests#singular-data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-215', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'analysis ファイルの特徴として正しいものは？
- A. `dbt run` で実行されDWHにテーブルが作成される
- B. `dbt compile` でSQLに変換されるがDWHには実行されない
- C. テストの一種として実行される
- D. `dbt build` でのみ実行される', '**正解: B**
analysis は `analyses/` ディレクトリに配置され、`ref()` や Jinja を使えるが、`dbt run` では実行されない。`dbt compile` でSQLに変換され、手動で実行するアドホッククエリ向け。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-215-opt-0', 'card-dbt-ae-215', 0, 'A', '`dbt run` で実行されDWHにテーブルが作成される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-215-opt-1', 'card-dbt-ae-215', 1, 'B', '`dbt compile` でSQLに変換されるがDWHには実行されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-215-opt-2', 'card-dbt-ae-215', 2, 'C', 'テストの一種として実行される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-215-opt-3', 'card-dbt-ae-215', 3, 'D', '`dbt build` でのみ実行される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-215-ans-0', 'card-dbt-ae-215', 'card-dbt-ae-215-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-216', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-5', '各テストの種類（左列）を、その定義場所と特徴（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. generic test | a. `macros/` ディレクトリ。`{% test %}` マクロとして定義 |
| 2. singular test | b. YAMLファイル。モックデータでSQL変換ロジックを検証（v1.8+） |
| 3. custom generic test | c. `tests/` ディレクトリのSQLファイル。特定のビジネスロジック向けカスタムクエリ |
| 4. unit test | d. YAMLファイル。再利用可能、パラメータ化（unique, not_null等） |', '**1-d, 2-c, 3-a, 4-b**
| テスト種類 | 定義場所・特徴 |
|---|---|
| **generic test** → d | YAMLファイル。再利用可能、パラメータ化（unique, not_null等） |
| **singular test** → c | `tests/` ディレクトリのSQLファイル。特定のビジネスロジック向けカスタムクエリ |
| **custom generic test** → a | `macros/` ディレクトリ。`{% test %}` マクロとして定義、YAMLから利用 |
| **unit test** → b | YAMLファイル。モックデータでSQL変換ロジックを検証（v1.8+） |', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-0', 'card-dbt-ae-216', 0, '1', 'generic test', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-1', 'card-dbt-ae-216', 1, '2', 'singular test', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-2', 'card-dbt-ae-216', 2, '3', 'custom generic test', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-3', 'card-dbt-ae-216', 3, '4', 'unit test', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-4', 'card-dbt-ae-216', 4, 'a', '`macros/` ディレクトリ。`{% test %}` マクロとして定義', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-5', 'card-dbt-ae-216', 5, 'b', 'YAMLファイル。モックデータでSQL変換ロジックを検証（v1.8+）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-6', 'card-dbt-ae-216', 6, 'c', '`tests/` ディレクトリのSQLファイル。特定のビジネスロジック向けカスタムクエリ', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-216-opt-7', 'card-dbt-ae-216', 7, 'd', 'YAMLファイル。再利用可能、パラメータ化（unique, not_null等）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-216-ans-0', 'card-dbt-ae-216', 'card-dbt-ae-216-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-216-ans-1', 'card-dbt-ae-216', 'card-dbt-ae-216-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-216-ans-2', 'card-dbt-ae-216', 'card-dbt-ae-216-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-216-ans-3', 'card-dbt-ae-216', 'card-dbt-ae-216-opt-3', NULL, 1);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-217', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt run --select config.materialized:incremental` の効果は？
- A. incremental materialization のモデルのみを実行する
- B. 全モデルを incremental として実行する
- C. incremental strategy を変更する
- D. incremental のテストのみ実行する', '**正解: A**
`config.materialized:incremental` は config 値でフィルタし、materialization が incremental のモデルのみを選択して実行する。', 'https://docs.getdbt.com/docs/build/incremental-models');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-217-opt-0', 'card-dbt-ae-217', 0, 'A', 'incremental materialization のモデルのみを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-217-opt-1', 'card-dbt-ae-217', 1, 'B', '全モデルを incremental として実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-217-opt-2', 'card-dbt-ae-217', 2, 'C', 'incremental strategy を変更する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-217-opt-3', 'card-dbt-ae-217', 3, 'D', 'incremental のテストのみ実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-217-ans-0', 'card-dbt-ae-217', 'card-dbt-ae-217-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-218', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下のカスタム generic test の問題点は？
```sql
{% test positive_values(model, column_name) %}
select {{ column_name }}
from {{ model }}
where {{ column_name }} >= 0
{% endtest %}
```', '**WHERE条件が逆**。テストは**失敗するレコード**を返すべきだが、正常なレコード（>= 0）を返している。
修正: `where {{ column_name }} < 0`', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-219', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`relationships` テストの `to` と `field` パラメータの役割は？
- A. `to` はテスト対象テーブル、`field` はテスト対象カラム
- B. `to` は参照先モデル、`field` は参照先カラム
- C. `to` は出力先テーブル、`field` は出力カラム
- D. `to` はフィルタ条件、`field` は集約関数', '**正解: B**
`relationships` テストは外部キーの参照整合性を検証する。`to: ref(''other_model'')` で参照先モデル、`field: id` で参照先カラムを指定。', 'https://docs.getdbt.com/docs/build/data-tests#generic-data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-219-opt-0', 'card-dbt-ae-219', 0, 'A', '`to` はテスト対象テーブル、`field` はテスト対象カラム', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-219-opt-1', 'card-dbt-ae-219', 1, 'B', '`to` は参照先モデル、`field` は参照先カラム', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-219-opt-2', 'card-dbt-ae-219', 2, 'C', '`to` は出力先テーブル、`field` は出力カラム', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-219-opt-3', 'card-dbt-ae-219', 3, 'D', '`to` はフィルタ条件、`field` は集約関数', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-219-ans-0', 'card-dbt-ae-219', 'card-dbt-ae-219-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-220', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt build` でテストが実行されるタイミングは？
- A. 全モデル実行後にまとめて実行
- B. 各モデルの実行直後にそのモデルのテストが実行される
- C. テストは `dbt build` では実行されない
- D. seeds の直後、モデル実行前に実行', '**正解: B**
モデル → テスト → 次のモデル → テスト... の順序。テスト失敗で下流モデルがスキップされる。', 'https://docs.getdbt.com/reference/commands/build');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-220-opt-0', 'card-dbt-ae-220', 0, 'A', '全モデル実行後にまとめて実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-220-opt-1', 'card-dbt-ae-220', 1, 'B', '各モデルの実行直後にそのモデルのテストが実行される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-220-opt-2', 'card-dbt-ae-220', 2, 'C', 'テストは `dbt build` では実行されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-220-opt-3', 'card-dbt-ae-220', 3, 'D', 'seeds の直後、モデル実行前に実行', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-220-ans-0', 'card-dbt-ae-220', 'card-dbt-ae-220-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-221', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-5', '各 dbt コマンド（左列）を、その実行対象（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `dbt run` | a. CSVファイルをDWHにテーブルとしてロード |
| 2. `dbt test` | b. Jinja/SQLを展開し `target/compiled/` に出力（DWHに実行しない） |
| 3. `dbt build` | c. モデルのみを実行 |
| 4. `dbt compile` | d. seeds → models → snapshots → tests をDAG順にすべて実行 |
| 5. `dbt seed` | e. テストのみを実行（モデルは実行しない） |', '**1-c, 2-e, 3-d, 4-b, 5-a**
| コマンド | 実行対象 |
|---|---|
| `dbt run` → c | **モデルのみ**を実行 |
| `dbt test` → e | **テストのみ**を実行（モデルは実行しない） |
| `dbt build` → d | seeds → models → snapshots → tests を**DAG順にすべて**実行 |
| `dbt compile` → b | Jinja/SQLを展開し `target/compiled/` に出力（**DWHに実行しない**） |
| `dbt seed` → a | **CSVファイル**をDWHにテーブルとしてロード |', 'https://docs.getdbt.com/reference/commands/build');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-0', 'card-dbt-ae-221', 0, '1', 'dbt run', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-1', 'card-dbt-ae-221', 1, '2', 'dbt test', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-2', 'card-dbt-ae-221', 2, '3', 'dbt build', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-3', 'card-dbt-ae-221', 3, '4', 'dbt compile', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-4', 'card-dbt-ae-221', 4, '5', 'dbt seed', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-5', 'card-dbt-ae-221', 5, 'a', 'CSVファイルをDWHにテーブルとしてロード', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-6', 'card-dbt-ae-221', 6, 'b', 'Jinja/SQLを展開し `target/compiled/` に出力（DWHに実行しない）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-7', 'card-dbt-ae-221', 7, 'c', 'モデルのみを実行', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-8', 'card-dbt-ae-221', 8, 'd', 'seeds → models → snapshots → tests をDAG順にすべて実行', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-221-opt-9', 'card-dbt-ae-221', 9, 'e', 'テストのみを実行（モデルは実行しない）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-221-ans-0', 'card-dbt-ae-221', 'card-dbt-ae-221-opt-0', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-221-ans-1', 'card-dbt-ae-221', 'card-dbt-ae-221-opt-1', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-221-ans-2', 'card-dbt-ae-221', 'card-dbt-ae-221-opt-2', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-221-ans-3', 'card-dbt-ae-221', 'card-dbt-ae-221-opt-3', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-221-ans-4', 'card-dbt-ae-221', 'card-dbt-ae-221-opt-4', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-222', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'snapshot テーブルに対して `dbt test` を実行できるか？
- A. はい、通常のモデルと同様にテストを定義・実行できる
- B. いいえ、snapshot にはテストを定義できない
- C. generic test のみ実行可能
- D. singular test のみ実行可能', '**正解: A**
snapshot テーブルに対しても YAML で `data_tests` を定義して、通常のモデルと同様にテストを実行できる。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-222-opt-0', 'card-dbt-ae-222', 0, 'A', 'はい、通常のモデルと同様にテストを定義・実行できる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-222-opt-1', 'card-dbt-ae-222', 1, 'B', 'いいえ、snapshot にはテストを定義できない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-222-opt-2', 'card-dbt-ae-222', 2, 'C', 'generic test のみ実行可能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-222-opt-3', 'card-dbt-ae-222', 3, 'D', 'singular test のみ実行可能', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-222-ans-0', 'card-dbt-ae-222', 'card-dbt-ae-222-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-223', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'YAML の `data_tests` と `tests` の違いは？
- A. 同じもの（エイリアス）
- B. `data_tests` はv1.8+の新しい構文で、`tests` は旧構文
- C. `tests` はモデルレベル、`data_tests` はカラムレベル
- D. `data_tests` はカスタムテスト専用', '**正解: B**
dbt v1.8+ でカラムプロパティ内の `tests:` が `data_tests:` にリネームされた。旧 `tests:` も後方互換性のため動作するが、deprecation warning が出る。', 'https://docs.getdbt.com/docs/build/data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-223-opt-0', 'card-dbt-ae-223', 0, 'A', '同じもの（エイリアス）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-223-opt-1', 'card-dbt-ae-223', 1, 'B', '`data_tests` はv1.8+の新しい構文で、`tests` は旧構文', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-223-opt-2', 'card-dbt-ae-223', 2, 'C', '`tests` はモデルレベル、`data_tests` はカラムレベル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-223-opt-3', 'card-dbt-ae-223', 3, 'D', '`data_tests` はカスタムテスト専用', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-223-ans-0', 'card-dbt-ae-223', 'card-dbt-ae-223-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-224', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt test --indirect-selection=eager` の効果は？
- A. 選択したモデルに関連するすべてのテストを実行する
- B. 選択したモデルの直接テストのみ実行する
- C. テストの実行順序を最適化する
- D. テストを並列実行する', '**正解: A**
`eager`（デフォルト）は選択したモデルに関連するすべてのテストを実行する。`cautious` は直接テストのみ。', 'https://docs.getdbt.com/reference/commands/test');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-224-opt-0', 'card-dbt-ae-224', 0, 'A', '選択したモデルに関連するすべてのテストを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-224-opt-1', 'card-dbt-ae-224', 1, 'B', '選択したモデルの直接テストのみ実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-224-opt-2', 'card-dbt-ae-224', 2, 'C', 'テストの実行順序を最適化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-224-opt-3', 'card-dbt-ae-224', 3, 'D', 'テストを並列実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-224-ans-0', 'card-dbt-ae-224', 'card-dbt-ae-224-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-225', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt_project.yml` の `dispatch` 設定で検索順序を指定する用途は？
- A. マクロの実行優先順位を設定する
- B. パッケージのマクロをプロジェクトのマクロでオーバーライドする順序を指定する
- C. モデルの実行順序を設定する
- D. テストの実行順序を設定する', '**正解: B**
`dispatch` で検索順序を指定すると、パッケージのマクロを自プロジェクトのマクロでオーバーライドできる。', 'https://docs.getdbt.com/reference/project-configs/dispatch-config');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-225-opt-0', 'card-dbt-ae-225', 0, 'A', 'マクロの実行優先順位を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-225-opt-1', 'card-dbt-ae-225', 1, 'B', 'パッケージのマクロをプロジェクトのマクロでオーバーライドする順序を指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-225-opt-2', 'card-dbt-ae-225', 2, 'C', 'モデルの実行順序を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-225-opt-3', 'card-dbt-ae-225', 3, 'D', 'テストの実行順序を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-225-ans-0', 'card-dbt-ae-225', 'card-dbt-ae-225-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-226', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt snapshot --select my_snapshot` の効果は？
- A. 特定のスナップショットのみ実行する
- B. 特定のモデルのスナップショットを作成する
- C. スナップショットのテストを実行する
- D. スナップショットの履歴を表示する', '**正解: A**
`--select` で特定のスナップショットを指定して実行する。全スナップショットではなく指定したものだけが実行される。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-226-opt-0', 'card-dbt-ae-226', 0, 'A', '特定のスナップショットのみ実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-226-opt-1', 'card-dbt-ae-226', 1, 'B', '特定のモデルのスナップショットを作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-226-opt-2', 'card-dbt-ae-226', 2, 'C', 'スナップショットのテストを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-226-opt-3', 'card-dbt-ae-226', 3, 'D', 'スナップショットの履歴を表示する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-226-ans-0', 'card-dbt-ae-226', 'card-dbt-ae-226-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-227', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'unit test が検証するのは何か？
- A. データの品質（NULL、ユニーク等）
- B. モデルのSQL変換ロジック
- C. DWHへの接続
- D. ソースデータの鮮度', '**正解: B**
unit test はモックデータを入力として与え、**SQL変換ロジックが期待通りの出力を生成するか**を検証する。データ品質チェックは data_tests の役割。', 'https://docs.getdbt.com/docs/build/unit-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-227-opt-0', 'card-dbt-ae-227', 0, 'A', 'データの品質（NULL、ユニーク等）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-227-opt-1', 'card-dbt-ae-227', 1, 'B', 'モデルのSQL変換ロジック', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-227-opt-2', 'card-dbt-ae-227', 2, 'C', 'DWHへの接続', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-227-opt-3', 'card-dbt-ae-227', 3, 'D', 'ソースデータの鮮度', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-227-ans-0', 'card-dbt-ae-227', 'card-dbt-ae-227-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-228', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-5', 'モデルの変更を本番にデプロイする手順として、以下を正しい順序に並べよ。
ステップ:
- (a) main にマージ
- (b) `dbt compile` でSQLを確認
- (c) PRを作成しレビューを受ける
- (d) feature branch を作成
- (e) `dbt test --select modified_model` でテスト
- (f) モデルを修正
- (g) CI環境でテスト実行
- (h) `dbt run --select modified_model` で実行', '**正解: d → f → b → h → e → c → g → a**
1. **(d) feature branch** を作成
2. **(f)** モデルを修正
3. **(b)** `dbt compile` でSQLを確認
4. **(h)** `dbt run --select modified_model` で実行
5. **(e)** `dbt test --select modified_model` でテスト
6. **(c) PRを作成**しレビューを受ける
7. **(g) CI環境**でテスト実行
8. **(a)** main に**マージ**', 'https://docs.getdbt.com/reference/commands/compile');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-0', 'card-dbt-ae-228', 0, 'a', 'main にマージ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-1', 'card-dbt-ae-228', 1, 'b', '`dbt compile` でSQLを確認', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-2', 'card-dbt-ae-228', 2, 'c', 'PRを作成しレビューを受ける', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-3', 'card-dbt-ae-228', 3, 'd', 'feature branch を作成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-4', 'card-dbt-ae-228', 4, 'e', '`dbt test --select modified_model` でテスト', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-5', 'card-dbt-ae-228', 5, 'f', 'モデルを修正', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-6', 'card-dbt-ae-228', 6, 'g', 'CI環境でテスト実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-228-opt-7', 'card-dbt-ae-228', 7, 'h', '`dbt run --select modified_model` で実行', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-0', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-1', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-5', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-2', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-3', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-7', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-4', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-4', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-5', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-2', NULL, 5);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-6', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-6', NULL, 6);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-228-ans-7', 'card-dbt-ae-228', 'card-dbt-ae-228-opt-0', NULL, 7);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-229', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt test --select one_specific_model,test_type:data` の効果は？
- A. one_specific_model のデータテストのみを実行する
- B. one_specific_model と全データテストを実行する
- C. one_specific_model のユニットテストのみを実行する
- D. すべてのテストを実行する', '**正解: A**
カンマ区切りのセレクターは AND 条件（交差）を表す。one_specific_model に関連するテストの中からデータテストのみを実行する。', 'https://docs.getdbt.com/docs/build/unit-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-229-opt-0', 'card-dbt-ae-229', 0, 'A', 'one_specific_model のデータテストのみを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-229-opt-1', 'card-dbt-ae-229', 1, 'B', 'one_specific_model と全データテストを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-229-opt-2', 'card-dbt-ae-229', 2, 'C', 'one_specific_model のユニットテストのみを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-229-opt-3', 'card-dbt-ae-229', 3, 'D', 'すべてのテストを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-229-ans-0', 'card-dbt-ae-229', 'card-dbt-ae-229-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-230', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'singular test のSQLファイルに記述すべきクエリの特徴は？
- A. 成功するレコードを返すクエリ
- B. 失敗するレコードを返すクエリ
- C. テーブルの行数を返すクエリ
- D. カラムのデータ型を返すクエリ', '**正解: B**
`tests/` ディレクトリにSQLファイルを作成し、**不合格となるレコードを返す**クエリを記述する。結果が0行なら成功、1行以上なら失敗。', 'https://docs.getdbt.com/docs/build/data-tests#singular-data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-230-opt-0', 'card-dbt-ae-230', 0, 'A', '成功するレコードを返すクエリ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-230-opt-1', 'card-dbt-ae-230', 1, 'B', '失敗するレコードを返すクエリ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-230-opt-2', 'card-dbt-ae-230', 2, 'C', 'テーブルの行数を返すクエリ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-230-opt-3', 'card-dbt-ae-230', 3, 'D', 'カラムのデータ型を返すクエリ', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-230-ans-0', 'card-dbt-ae-230', 'card-dbt-ae-230-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-231', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'unit test と data test の違いとして正しいものは？
- A. unit test はモックデータを使い、data test は実データを使う
- B. unit test は実データを使い、data test はモックデータを使う
- C. 両方ともモックデータを使う
- D. 両方とも実データを使う', '**正解: A**
- **unit test** — モックデータでSQL変換ロジックを検証（DWH不要）
- **data test** — 実際のDWH上のデータに対してクエリを実行して品質を検証', 'https://docs.getdbt.com/docs/build/unit-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-231-opt-0', 'card-dbt-ae-231', 0, 'A', 'unit test はモックデータを使い、data test は実データを使う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-231-opt-1', 'card-dbt-ae-231', 1, 'B', 'unit test は実データを使い、data test はモックデータを使う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-231-opt-2', 'card-dbt-ae-231', 2, 'C', '両方ともモックデータを使う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-231-opt-3', 'card-dbt-ae-231', 3, 'D', '両方とも実データを使う', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-231-ans-0', 'card-dbt-ae-231', 'card-dbt-ae-231-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-232', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`adapter.dispatch()` の用途は？
- A. マクロをデータベースアダプターに応じて切り替える
- B. モデルを並列実行する
- C. テストを非同期実行する
- D. パッケージの依存関係を解決する', '**正解: A**
異なるDWH（Snowflake, BigQuery, Redshift等）ごとに異なるSQL実装を選択的に呼び出す。クロスデータベース互換のマクロ開発に使用。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/dispatch');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-232-opt-0', 'card-dbt-ae-232', 0, 'A', 'マクロをデータベースアダプターに応じて切り替える', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-232-opt-1', 'card-dbt-ae-232', 1, 'B', 'モデルを並列実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-232-opt-2', 'card-dbt-ae-232', 2, 'C', 'テストを非同期実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-232-opt-3', 'card-dbt-ae-232', 3, 'D', 'パッケージの依存関係を解決する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-232-ans-0', 'card-dbt-ae-232', 'card-dbt-ae-232-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-233', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-5', 'ephemeral materialization の制限事項を**2つ**選べ。
- A. DWH上に実体が作られない
- B. `dbt test` で直接テストできない
- C. `ref()` で参照できない
- D. table materialization より実行が遅い', '**正解: A, B**
ephemeral はCTEとして展開されるため実体がなく、直接クエリやテストができない。`ref()` での参照は可能（依存モデル内にインライン展開される）。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-233-opt-0', 'card-dbt-ae-233', 0, 'A', 'DWH上に実体が作られない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-233-opt-1', 'card-dbt-ae-233', 1, 'B', '`dbt test` で直接テストできない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-233-opt-2', 'card-dbt-ae-233', 2, 'C', '`ref()` で参照できない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-233-opt-3', 'card-dbt-ae-233', 3, 'D', 'table materialization より実行が遅い', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-233-ans-0', 'card-dbt-ae-233', 'card-dbt-ae-233-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-233-ans-1', 'card-dbt-ae-233', 'card-dbt-ae-233-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-234', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-5', 'BI ツール（Looker/Tableau等）が dbt で作成したモデルを参照できない場合、考えられる原因はどれか？（該当するものをすべて選択）
- A. BI ツールのサービスアカウントに権限がない
- B. モデルがカスタムスキーマに作成されている
- C. モデルのテストが失敗している
- D. モデルの materialization が ephemeral になっている', '**正解: A, B, D**
ephemeral モデルはCTEとしてのみ存在し、DWHにオブジェクトが作られない。権限不足やスキーマの不一致もBI連携でよくある原因。テスト失敗はモデル自体の作成に影響しない。', 'https://docs.getdbt.com/docs/build/materializations');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-234-opt-0', 'card-dbt-ae-234', 0, 'A', 'BI ツールのサービスアカウントに権限がない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-234-opt-1', 'card-dbt-ae-234', 1, 'B', 'モデルがカスタムスキーマに作成されている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-234-opt-2', 'card-dbt-ae-234', 2, 'C', 'モデルのテストが失敗している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-234-opt-3', 'card-dbt-ae-234', 3, 'D', 'モデルの materialization が ephemeral になっている', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-234-ans-0', 'card-dbt-ae-234', 'card-dbt-ae-234-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-234-ans-1', 'card-dbt-ae-234', 'card-dbt-ae-234-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-234-ans-2', 'card-dbt-ae-234', 'card-dbt-ae-234-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-235', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'テストの `error_if` と `warn_if` の違いとして正しいものは？
- A. `warn_if` は警告のみでテスト成功扱い、`error_if` はテストを失敗させる
- B. `warn_if` は行数でフィルタ、`error_if` は値でフィルタ
- C. `warn_if` はDWH側の警告、`error_if` はdbt側のエラー
- D. `warn_if` は開発環境のみ、`error_if` は本番環境のみに適用', '- **`warn_if`**: 条件に合致した場合に警告を出すが、テストは成功扱い
- **`error_if`**: 条件に合致した場合にテストを失敗させる', 'https://docs.getdbt.com/reference/resource-configs/severity');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-235-opt-0', 'card-dbt-ae-235', 0, 'A', '`warn_if` は警告のみでテスト成功扱い、`error_if` はテストを失敗させる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-235-opt-1', 'card-dbt-ae-235', 1, 'B', '`warn_if` は行数でフィルタ、`error_if` は値でフィルタ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-235-opt-2', 'card-dbt-ae-235', 2, 'C', '`warn_if` はDWH側の警告、`error_if` はdbt側のエラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-235-opt-3', 'card-dbt-ae-235', 3, 'D', '`warn_if` は開発環境のみ、`error_if` は本番環境のみに適用', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-236', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '例:
```yaml
data_tests:
  - accepted_values:
      values: [''placed'', ''shipped'', ''completed'']
      warn_if: ">10"     # 10行以上不一致で警告
      error_if: ">100"   # 100行以上不一致でエラー
```
閾値ベースのテスト制御に使用する。

`{{ env_var(''DBT_SECRET'', ''fallback'') }}` の動作として正しいものは？
- A. 環境変数 `DBT_SECRET` の値を返し、未設定なら `''fallback''` を返す
- B. 環境変数 `DBT_SECRET` に `''fallback''` を設定する
- C. エラーが発生する
- D. 常に `''fallback''` を返す', '**正解: A**
第2引数はデフォルト値。環境変数が未設定の場合にのみ使用される。', 'https://docs.getdbt.com/reference/dbt-jinja-functions/env_var');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-236-opt-0', 'card-dbt-ae-236', 0, 'A', '環境変数 `DBT_SECRET` の値を返し、未設定なら `''fallback''` を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-236-opt-1', 'card-dbt-ae-236', 1, 'B', '環境変数 `DBT_SECRET` に `''fallback''` を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-236-opt-2', 'card-dbt-ae-236', 2, 'C', 'エラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-236-opt-3', 'card-dbt-ae-236', 3, 'D', '常に `''fallback''` を返す', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-236-ans-0', 'card-dbt-ae-236', 'card-dbt-ae-236-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-237', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'dbt Cloud の「deploy job」と「CI job」の違いとして正しいものは？
- A. deploy job はスケジュール実行、CI job は PR トリガー
- B. deploy job は手動のみ、CI job はスケジュール実行
- C. deploy job はテストのみ、CI job はモデルのみ実行
- D. 違いはない', '**正解: A**
- **deploy job** — スケジュール（cron）やWebhookでトリガー、本番環境でのビルド
- **CI job** — PR の作成/更新でトリガー、変更モデルのみビルド・テスト', 'https://docs.getdbt.com/docs/deploy/continuous-integration');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-237-opt-0', 'card-dbt-ae-237', 0, 'A', 'deploy job はスケジュール実行、CI job は PR トリガー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-237-opt-1', 'card-dbt-ae-237', 1, 'B', 'deploy job は手動のみ、CI job はスケジュール実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-237-opt-2', 'card-dbt-ae-237', 2, 'C', 'deploy job はテストのみ、CI job はモデルのみ実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-237-opt-3', 'card-dbt-ae-237', 3, 'D', '違いはない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-237-ans-0', 'card-dbt-ae-237', 'card-dbt-ae-237-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-238', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下のテスト設定で、`store_failures_as` の効果は？
```yaml
data_tests:
  - unique:
      config:
        store_failures_as: view
```', 'テスト失敗した行を**テーブルではなくビューとして**DWHに保存する。`store_failures_as` は `table`（`store_failures: true` 時のデフォルト）、`view`、`ephemeral`（何も保存しない）の3つを指定可能。', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-239', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'dbt の `threads` 設定は何を制御するか？
- A. モデルの実行順序
- B. DAGの深さ
- C. 並列実行するモデルの最大数
- D. テストの同時実行数', '**正解: C**
DAG上で依存関係のないモデルは並列実行される。値を大きくするとビルド時間が短縮されるがDWHの負荷が増える。', 'https://docs.getdbt.com/docs/running-a-dbt-project/using-threads');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-239-opt-0', 'card-dbt-ae-239', 0, 'A', 'モデルの実行順序', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-239-opt-1', 'card-dbt-ae-239', 1, 'B', 'DAGの深さ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-239-opt-2', 'card-dbt-ae-239', 2, 'C', '並列実行するモデルの最大数', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-239-opt-3', 'card-dbt-ae-239', 3, 'D', 'テストの同時実行数', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-239-ans-0', 'card-dbt-ae-239', 'card-dbt-ae-239-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-240', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-5', '各 dbt プロジェクトディレクトリ（左列）を、その格納内容（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `models/` | a. singular test のSQLファイル |
| 2. `macros/` | b. Jinjaマクロの定義 |
| 3. `tests/` | c. CSVファイル |
| 4. `seeds/` | d. SCD Type 2 の定義 |
| 5. `snapshots/` | e. SQLモデル |
| 6. `analyses/` | f. アドホッククエリ（DWH未実行） |', '**1-e, 2-b, 3-a, 4-c, 5-d, 6-f**
| ディレクトリ | 格納内容 |
|---|---|
| `models/` → e | SQLモデル |
| `macros/` → b | Jinjaマクロ |
| `tests/` → a | singular test |
| `seeds/` → c | CSVファイル |
| `snapshots/` → d | SCD Type 2 定義 |
| `analyses/` → f | アドホッククエリ |', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-0', 'card-dbt-ae-240', 0, '1', 'models/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-1', 'card-dbt-ae-240', 1, '2', 'macros/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-2', 'card-dbt-ae-240', 2, '3', 'tests/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-3', 'card-dbt-ae-240', 3, '4', 'seeds/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-4', 'card-dbt-ae-240', 4, '5', 'snapshots/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-5', 'card-dbt-ae-240', 5, '6', 'analyses/', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-6', 'card-dbt-ae-240', 6, 'a', 'singular test のSQLファイル', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-7', 'card-dbt-ae-240', 7, 'b', 'Jinjaマクロの定義', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-8', 'card-dbt-ae-240', 8, 'c', 'CSVファイル', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-9', 'card-dbt-ae-240', 9, 'd', 'SCD Type 2 の定義', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-10', 'card-dbt-ae-240', 10, 'e', 'SQLモデル', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-240-opt-11', 'card-dbt-ae-240', 11, 'f', 'アドホッククエリ（DWH未実行）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-240-ans-0', 'card-dbt-ae-240', 'card-dbt-ae-240-opt-0', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-240-ans-1', 'card-dbt-ae-240', 'card-dbt-ae-240-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-240-ans-2', 'card-dbt-ae-240', 'card-dbt-ae-240-opt-2', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-240-ans-3', 'card-dbt-ae-240', 'card-dbt-ae-240-opt-3', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-240-ans-4', 'card-dbt-ae-240', 'card-dbt-ae-240-opt-4', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-240-ans-5', 'card-dbt-ae-240', 'card-dbt-ae-240-opt-5', NULL, 5);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-241', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-5', '`dbt test --select test_type:generic` と `dbt test --select test_type:singular` の違いを正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `test_type:generic` | a. YAMLで定義された全データテスト |
| 2. `test_type:singular` | b. unit test のみ |
| 3. `test_type:unit` | c. `tests/` ディレクトリの SQL テスト |
| 4. `test_type:data` | d. YAMLで定義された再利用可能テスト（unique, not_null等） |', '**1-d, 2-c, 3-b, 4-a**
| test_type | 対象 |
|---|---|
| `generic` → d | YAMLの再利用可能テスト |
| `singular` → c | `tests/` のSQLファイル |
| `unit` → b | unit test |
| `data` → a | generic + singular の合計 |', 'https://docs.getdbt.com/docs/build/data-tests#singular-data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-0', 'card-dbt-ae-241', 0, '1', 'test_type:generic', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-1', 'card-dbt-ae-241', 1, '2', 'test_type:singular', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-2', 'card-dbt-ae-241', 2, '3', 'test_type:unit', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-3', 'card-dbt-ae-241', 3, '4', 'test_type:data', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-4', 'card-dbt-ae-241', 4, 'a', 'YAMLで定義された全データテスト', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-5', 'card-dbt-ae-241', 5, 'b', 'unit test のみ', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-6', 'card-dbt-ae-241', 6, 'c', '`tests/` ディレクトリの SQL テスト', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-241-opt-7', 'card-dbt-ae-241', 7, 'd', 'YAMLで定義された再利用可能テスト（unique, not_null等）', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-241-ans-0', 'card-dbt-ae-241', 'card-dbt-ae-241-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-241-ans-1', 'card-dbt-ae-241', 'card-dbt-ae-241-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-241-ans-2', 'card-dbt-ae-241', 'card-dbt-ae-241-opt-2', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-241-ans-3', 'card-dbt-ae-241', 'card-dbt-ae-241-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-242', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-5', '`dbt build` と `dbt run` + `dbt test` を別々に実行する場合の違いは？
- A. 違いはない
- B. `dbt build` はモデルごとにテストを実行するが、別々実行では全モデル後にテスト実行
- C. `dbt build` のほうが遅い
- D. `dbt build` はseedとsnapshotも含む', '**正解: B, D**（最も重要な違いとしてBとD）
`dbt build` は各モデルの直後にそのテストを実行し、テスト失敗で下流をスキップする。さらにseeds、snapshotsも含む。`dbt run` + `dbt test` では全モデル完了後にテストが実行される。', 'https://docs.getdbt.com/reference/commands/build');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-242-opt-0', 'card-dbt-ae-242', 0, 'A', '違いはない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-242-opt-1', 'card-dbt-ae-242', 1, 'B', '`dbt build` はモデルごとにテストを実行するが、別々実行では全モデル後にテスト実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-242-opt-2', 'card-dbt-ae-242', 2, 'C', '`dbt build` のほうが遅い', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-242-opt-3', 'card-dbt-ae-242', 3, 'D', '`dbt build` はseedとsnapshotも含む', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-242-ans-0', 'card-dbt-ae-242', 'card-dbt-ae-242-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-242-ans-1', 'card-dbt-ae-242', 'card-dbt-ae-242-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-243', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-5', 'incremental モデルで毎回全テーブルをテストしないための方法を**2つ**選べ。
- A. テストパラメータ `limit` でテスト行数を制限する
- B. データプラットフォームがサポートしていれば、contract の `not_null` constraint を設定する
- C. テストパラメータ `error_if` で最小失敗行数を設定する
- D. テストパラメータ `store_failures` で前回のテスト結果を再利用する
- E. テストパラメータ `where` でデータにフィルタ条件を追加する', '**正解: B, E**
- `where` パラメータで特定の日付範囲のデータのみテスト
- contract の `not_null` constraint でDWH側で挿入前に自動検証
`limit` はテストパラメータとして存在しない。`error_if` は閾値設定で全データは処理される。`store_failures` は結果保存であり再利用ではない。', 'https://docs.getdbt.com/reference/resource-configs/where');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-243-opt-0', 'card-dbt-ae-243', 0, 'A', 'テストパラメータ `limit` でテスト行数を制限する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-243-opt-1', 'card-dbt-ae-243', 1, 'B', 'データプラットフォームがサポートしていれば、contract の `not_null` constraint を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-243-opt-2', 'card-dbt-ae-243', 2, 'C', 'テストパラメータ `error_if` で最小失敗行数を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-243-opt-3', 'card-dbt-ae-243', 3, 'D', 'テストパラメータ `store_failures` で前回のテスト結果を再利用する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-243-opt-4', 'card-dbt-ae-243', 4, 'E', 'テストパラメータ `where` でデータにフィルタ条件を追加する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-243-ans-0', 'card-dbt-ae-243', 'card-dbt-ae-243-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-243-ans-1', 'card-dbt-ae-243', 'card-dbt-ae-243-opt-4', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-244', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`store_failures: true` を設定すると何が起きるか？
- A. テスト結果をログファイルに保存する
- B. テストで失敗した行をDWH上のテーブルに保存する
- C. 失敗したテストを自動リトライする
- D. テスト結果をJSONファイルに出力する', '**正解: B**
失敗データの調査が容易になる。DWH上に失敗行が保存されるため、後からクエリして原因を分析できる。', 'https://docs.getdbt.com/reference/resource-configs/store_failures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-244-opt-0', 'card-dbt-ae-244', 0, 'A', 'テスト結果をログファイルに保存する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-244-opt-1', 'card-dbt-ae-244', 1, 'B', 'テストで失敗した行をDWH上のテーブルに保存する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-244-opt-2', 'card-dbt-ae-244', 2, 'C', '失敗したテストを自動リトライする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-244-opt-3', 'card-dbt-ae-244', 3, 'D', 'テスト結果をJSONファイルに出力する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-244-ans-0', 'card-dbt-ae-244', 'card-dbt-ae-244-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-245', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt compile` コマンドの主な目的は何か？
- A. DWH上でモデルを実行する
- B. Jinja/SQLテンプレートを実際のSQLに変換し `target/compiled/` に出力する
- C. テストを実行してデータ品質を検証する
- D. パッケージの依存関係を解決する', '**正解: B**
デバッグに有用。Jinjaが正しく展開されているか、生成されたSQLが意図通りかを確認できる。DWHに対しては何も実行しない。', 'https://docs.getdbt.com/reference/commands/compile');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-245-opt-0', 'card-dbt-ae-245', 0, 'A', 'DWH上でモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-245-opt-1', 'card-dbt-ae-245', 1, 'B', 'Jinja/SQLテンプレートを実際のSQLに変換し `target/compiled/` に出力する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-245-opt-2', 'card-dbt-ae-245', 2, 'C', 'テストを実行してデータ品質を検証する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-245-opt-3', 'card-dbt-ae-245', 3, 'D', 'パッケージの依存関係を解決する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-245-ans-0', 'card-dbt-ae-245', 'card-dbt-ae-245-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-246', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-5', '各テスト設定パラメータ（左列）を、その機能（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `severity` | a. テスト対象データをフィルタする |
| 2. `error_if` | b. 失敗行数が閾値を超えたらエラーにする |
| 3. `warn_if` | c. 失敗した行をDWHに保存する |
| 4. `where` | d. テスト失敗時の動作を error/warn で切り替える |
| 5. `store_failures` | e. 失敗行数が閾値を超えたら警告にする |', '**1-d, 2-b, 3-e, 4-a, 5-c**
| パラメータ | 機能 |
|---|---|
| `severity` → d | error/warn 切り替え |
| `error_if` → b | 閾値超過でエラー |
| `warn_if` → e | 閾値超過で警告 |
| `where` → a | データフィルタ |
| `store_failures` → c | 失敗行をDWH保存 |', 'https://docs.getdbt.com/reference/resource-configs/store_failures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-0', 'card-dbt-ae-246', 0, '1', 'severity', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-1', 'card-dbt-ae-246', 1, '2', 'error_if', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-2', 'card-dbt-ae-246', 2, '3', 'warn_if', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-3', 'card-dbt-ae-246', 3, '4', 'where', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-4', 'card-dbt-ae-246', 4, '5', 'store_failures', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-5', 'card-dbt-ae-246', 5, 'a', 'テスト対象データをフィルタする', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-6', 'card-dbt-ae-246', 6, 'b', '失敗行数が閾値を超えたらエラーにする', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-7', 'card-dbt-ae-246', 7, 'c', '失敗した行をDWHに保存する', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-8', 'card-dbt-ae-246', 8, 'd', 'テスト失敗時の動作を error/warn で切り替える', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-246-opt-9', 'card-dbt-ae-246', 9, 'e', '失敗行数が閾値を超えたら警告にする', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-246-ans-0', 'card-dbt-ae-246', 'card-dbt-ae-246-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-246-ans-1', 'card-dbt-ae-246', 'card-dbt-ae-246-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-246-ans-2', 'card-dbt-ae-246', 'card-dbt-ae-246-opt-2', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-246-ans-3', 'card-dbt-ae-246', 'card-dbt-ae-246-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-246-ans-4', 'card-dbt-ae-246', 'card-dbt-ae-246-opt-4', NULL, 2);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-247', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-5', 'テスト失敗の閾値を制御するパラメータを**2つ**選べ。
- A. `severity`
- B. `error_if`
- C. `warn_if`
- D. `fail_threshold`', '**正解: B, C**
- `error_if: ">100"` — 失敗行が100を超えたらエラー
- `warn_if: ">10"` — 失敗行が10を超えたら警告
`severity` は error/warn の切り替え。`fail_threshold` は存在しないパラメータ。', 'https://docs.getdbt.com/reference/resource-configs/severity');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-247-opt-0', 'card-dbt-ae-247', 0, 'A', '`severity`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-247-opt-1', 'card-dbt-ae-247', 1, 'B', '`error_if`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-247-opt-2', 'card-dbt-ae-247', 2, 'C', '`warn_if`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-247-opt-3', 'card-dbt-ae-247', 3, 'D', '`fail_threshold`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-247-ans-0', 'card-dbt-ae-247', 'card-dbt-ae-247-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-247-ans-1', 'card-dbt-ae-247', 'card-dbt-ae-247-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-248', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'カスタム generic test を作成する場合、マクロの定義で正しい構文は？
- A. `{% test test_name(model, column_name) %}`
- B. `{% macro test_name(model) %}`
- C. `{% custom_test test_name(model) %}`
- D. `{% def test_name(model, column_name) %}`', '**正解: A**
`{% test %}` ブロックで定義する。引数に `model` は必須、カラムテストなら `column_name` も必須。失敗する行を返すSQLを記述する。', 'https://docs.getdbt.com/docs/build/data-tests#generic-data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-248-opt-0', 'card-dbt-ae-248', 0, 'A', '`{% test test_name(model, column_name) %}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-248-opt-1', 'card-dbt-ae-248', 1, 'B', '`{% macro test_name(model) %}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-248-opt-2', 'card-dbt-ae-248', 2, 'C', '`{% custom_test test_name(model) %}`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-248-opt-3', 'card-dbt-ae-248', 3, 'D', '`{% def test_name(model, column_name) %}`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-248-ans-0', 'card-dbt-ae-248', 'card-dbt-ae-248-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-249', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt_project.yml` で設定でき**ない**ものはどれか？
- A. プロジェクト名（`name`）
- B. DWH接続情報
- C. モデルのデフォルト materialization
- D. テストの severity', '**正解: B**
DWH接続情報は `profiles.yml` で設定する。`dbt_project.yml` にはプロジェクト設定、パス、デフォルトconfig等を定義する。', 'https://docs.getdbt.com/reference/dbt_project.yml');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-249-opt-0', 'card-dbt-ae-249', 0, 'A', 'プロジェクト名（`name`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-249-opt-1', 'card-dbt-ae-249', 1, 'B', 'DWH接続情報', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-249-opt-2', 'card-dbt-ae-249', 2, 'C', 'モデルのデフォルト materialization', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-249-opt-3', 'card-dbt-ae-249', 3, 'D', 'テストの severity', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-249-ans-0', 'card-dbt-ae-249', 'card-dbt-ae-249-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-250', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`accepted_values` テストの `quote` パラメータの効果は？
- A. 値をクォート付きで比較する
- B. カラム名をクォートする
- C. テスト名をクォートする
- D. 値のクォートを無効にして数値や boolean と比較可能にする', '**正解: D**
デフォルトでは値は文字列としてクォートされる。`quote: false` を設定すると数値やboolean値との比較が可能になる。', 'https://docs.getdbt.com/docs/build/data-tests#generic-data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-250-opt-0', 'card-dbt-ae-250', 0, 'A', '値をクォート付きで比較する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-250-opt-1', 'card-dbt-ae-250', 1, 'B', 'カラム名をクォートする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-250-opt-2', 'card-dbt-ae-250', 2, 'C', 'テスト名をクォートする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-250-opt-3', 'card-dbt-ae-250', 3, 'D', '値のクォートを無効にして数値や boolean と比較可能にする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-250-ans-0', 'card-dbt-ae-250', 'card-dbt-ae-250-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-251', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'テスト実行で incremental モデルの全データをテストせず、新規データのみに限定するには？
- A. テストの `where` パラメータを使用する
- B. テストの `limit` パラメータを使用する
- C. テストの `severity` を `warn` に設定する
- D. `--exclude` フラグでテストを除外する', '**正解: A**
`where` パラメータでテスト対象を絞り込める:
```yaml
data_tests:
  - not_null:
      where: "event_date >= current_date - interval ''3 days''"
```
これにより大規模テーブルのテスト時間を大幅に削減できる。', 'https://docs.getdbt.com/reference/resource-configs/where');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-251-opt-0', 'card-dbt-ae-251', 0, 'A', 'テストの `where` パラメータを使用する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-251-opt-1', 'card-dbt-ae-251', 1, 'B', 'テストの `limit` パラメータを使用する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-251-opt-2', 'card-dbt-ae-251', 2, 'C', 'テストの `severity` を `warn` に設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-251-opt-3', 'card-dbt-ae-251', 3, 'D', '`--exclude` フラグでテストを除外する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-251-ans-0', 'card-dbt-ae-251', 'card-dbt-ae-251-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-252', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt run --fail-fast` フラグの効果は？
- A. テストをスキップして高速実行する
- B. 最初のモデルエラーが発生した時点で即座に実行を停止する
- C. 並列実行数を最大にする
- D. キャッシュを使用して高速化する', '**正解: B**
通常はエラー後も他のモデルの実行を続行するが、`--fail-fast` は最初のエラーで即停止する。', 'https://docs.getdbt.com/reference/commands/run');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-252-opt-0', 'card-dbt-ae-252', 0, 'A', 'テストをスキップして高速実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-252-opt-1', 'card-dbt-ae-252', 1, 'B', '最初のモデルエラーが発生した時点で即座に実行を停止する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-252-opt-2', 'card-dbt-ae-252', 2, 'C', '並列実行数を最大にする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-252-opt-3', 'card-dbt-ae-252', 3, 'D', 'キャッシュを使用して高速化する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-252-ans-0', 'card-dbt-ae-252', 'card-dbt-ae-252-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-253', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt seed` コマンドの適切な用途はどれか？
- A. 大量のトランザクションデータをロードする
- B. 小さな参照テーブル（マッピングテーブルなど）のCSVをDWHにロードする
- C. ソースデータの鮮度をチェックする
- D. モデルのテストを実行する', '**正解: B**
プロジェクト内のCSVファイルをDWHにテーブルとしてロードする。小さな参照データに適しており、大量データのロードには向かない。', 'https://docs.getdbt.com/docs/build/seeds');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-253-opt-0', 'card-dbt-ae-253', 0, 'A', '大量のトランザクションデータをロードする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-253-opt-1', 'card-dbt-ae-253', 1, 'B', '小さな参照テーブル（マッピングテーブルなど）のCSVをDWHにロードする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-253-opt-2', 'card-dbt-ae-253', 2, 'C', 'ソースデータの鮮度をチェックする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-253-opt-3', 'card-dbt-ae-253', 3, 'D', 'モデルのテストを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-253-ans-0', 'card-dbt-ae-253', 'card-dbt-ae-253-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-254', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt test --store-failures` フラグの効果は？
- A. テスト失敗の結果をファイルに保存する
- B. テストで失敗した行をDWHのテーブルに保存する
- C. テスト失敗時にエラーメッセージを保存する
- D. テストの実行ログを保存する', '**正解: B**
コマンドラインフラグとしても設定可能。テスト失敗行がDWH上のテーブルに保存され、後からクエリして原因分析できる。', 'https://docs.getdbt.com/reference/commands/test');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-254-opt-0', 'card-dbt-ae-254', 0, 'A', 'テスト失敗の結果をファイルに保存する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-254-opt-1', 'card-dbt-ae-254', 1, 'B', 'テストで失敗した行をDWHのテーブルに保存する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-254-opt-2', 'card-dbt-ae-254', 2, 'C', 'テスト失敗時にエラーメッセージを保存する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-254-opt-3', 'card-dbt-ae-254', 3, 'D', 'テストの実行ログを保存する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-254-ans-0', 'card-dbt-ae-254', 'card-dbt-ae-254-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-255', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`return()` マクロの用途は？
- A. マクロから値を返す
- B. モデルの実行を中断する
- C. ループを終了する
- D. テストの結果を返す', '**正解: A**
`{% macro get_value() %} {% do return(42) %} {% endmacro %}` のように、マクロから値を返すために使用する。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-255-opt-0', 'card-dbt-ae-255', 0, 'A', 'マクロから値を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-255-opt-1', 'card-dbt-ae-255', 1, 'B', 'モデルの実行を中断する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-255-opt-2', 'card-dbt-ae-255', 2, 'C', 'ループを終了する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-255-opt-3', 'card-dbt-ae-255', 3, 'D', 'テストの結果を返す', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-255-ans-0', 'card-dbt-ae-255', 'card-dbt-ae-255-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-256', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下のテスト定義で意図通りに動作しない箇所は？（dbt v1.8+）
```yaml
models:
  - name: fct_orders
    columns:
      - name: status
        tests:
          - accepted_values:
              values: [''placed'', ''shipped'']
```', '**`tests:` ではなく `data_tests:` を使うべき**（dbt v1.8以降）。
修正:
```yaml
        data_tests:
          - accepted_values:
              values: [''placed'', ''shipped'']
```', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-257', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt test --select test_type:singular` の実行対象は？
- A. tests/ ディレクトリのSQLファイルで定義されたテストのみ
- B. YAMLで定義された generic test のみ
- C. unit test のみ
- D. 全テスト', '**正解: A**
`test_type:singular` は `tests/` ディレクトリのSQLファイルで定義されたテストのみを実行する。', 'https://docs.getdbt.com/docs/build/data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-257-opt-0', 'card-dbt-ae-257', 0, 'A', 'tests/ ディレクトリのSQLファイルで定義されたテストのみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-257-opt-1', 'card-dbt-ae-257', 1, 'B', 'YAMLで定義された generic test のみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-257-opt-2', 'card-dbt-ae-257', 2, 'C', 'unit test のみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-257-opt-3', 'card-dbt-ae-257', 3, 'D', '全テスト', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-257-ans-0', 'card-dbt-ae-257', 'card-dbt-ae-257-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-258', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '`dbt_project.yml` の `test-paths` のデフォルト値は `____` である。
- A. `[''tests'']`
- B. `[''test'']`
- C. `[''data_tests'']`
- D. `[''checks'']`', '**正解: `[''tests'']`**
singular test のSQLファイルはデフォルトで `tests/` ディレクトリに配置する。', 'https://docs.getdbt.com/docs/build/data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-258-opt-0', 'card-dbt-ae-258', 0, 'A', '`[''tests'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-258-opt-1', 'card-dbt-ae-258', 1, 'B', '`[''test'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-258-opt-2', 'card-dbt-ae-258', 2, 'C', '`[''data_tests'']`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-258-opt-3', 'card-dbt-ae-258', 3, 'D', '`[''checks'']`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-259', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下の YAML で YAMLアンカーを使っている目的は？
```yaml
defaults: &column_defaults
  data_tests:
    - not_null

models:
  - name: dim_customers
    columns:
      - name: customer_id
        <<: *column_defaults
      - name: customer_name
        <<: *column_defaults
```', '**YAML アンカー `&` と エイリアス `*` で共通設定を再利用**している。`&column_defaults` で設定を定義し、`<<: *column_defaults` で展開する。DRY原則の適用。', 'https://docs.getdbt.com/docs/build/data-tests');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-260', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'data test の `where` パラメータの用途は？
- A. テスト対象のデータをフィルタする
- B. テストの実行条件を指定する
- C. テスト失敗時のエラーメッセージを設定する
- D. テストの実行順序を制御する', '**正解: A**
`where: "created_at > ''2024-01-01''"` のようにフィルタ条件を指定して、テスト対象データを限定する。incremental モデルの全データテストを回避するのに有用。', 'https://docs.getdbt.com/reference/resource-configs/where');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-260-opt-0', 'card-dbt-ae-260', 0, 'A', 'テスト対象のデータをフィルタする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-260-opt-1', 'card-dbt-ae-260', 1, 'B', 'テストの実行条件を指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-260-opt-2', 'card-dbt-ae-260', 2, 'C', 'テスト失敗時のエラーメッセージを設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-260-opt-3', 'card-dbt-ae-260', 3, 'D', 'テストの実行順序を制御する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-260-ans-0', 'card-dbt-ae-260', 'card-dbt-ae-260-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-261', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'dbt v1.8以降でYAMLにテストを定義するキーは `____:` である（非推奨の `tests:` ではなく）。
- A. `data_tests`
- B. `generic_tests`
- C. `validations`
- D. `checks`', '**正解: `data_tests`**
`tests:` は非推奨で将来削除予定。v1.8以降は `data_tests:` を使う。', 'https://docs.getdbt.com/docs/build/data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-261-opt-0', 'card-dbt-ae-261', 0, 'A', '`data_tests`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-261-opt-1', 'card-dbt-ae-261', 1, 'B', '`generic_tests`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-261-opt-2', 'card-dbt-ae-261', 2, 'C', '`validations`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-261-opt-3', 'card-dbt-ae-261', 3, 'D', '`checks`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-262', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', '以下のテスト定義で v1.10.5以降の `arguments` キーの役割は？
```yaml
data_tests:
  - accepted_values:
      arguments:
        values: [''active'', ''inactive'']
```
- A. テストの引数を明示的に指定するための新しい構文
- B. テストのフィルタ条件を設定する
- C. テスト結果のフォーマットを指定する
- D. テストの実行順序を設定する', '**正解: A**
v1.10.5以降では `arguments` キーでテストの引数を明示的に指定する。旧バージョンではトップレベルプロパティとして直接設定する。', 'https://docs.getdbt.com/docs/build/data-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-262-opt-0', 'card-dbt-ae-262', 0, 'A', 'テストの引数を明示的に指定するための新しい構文', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-262-opt-1', 'card-dbt-ae-262', 1, 'B', 'テストのフィルタ条件を設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-262-opt-2', 'card-dbt-ae-262', 2, 'C', 'テスト結果のフォーマットを指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-262-opt-3', 'card-dbt-ae-262', 3, 'D', 'テストの実行順序を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-262-ans-0', 'card-dbt-ae-262', 'card-dbt-ae-262-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-263', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'dbt のモデルで `SELECT *` を避けるべき理由として正しいものは？
- A. dbt が `SELECT *` をサポートしていない
- B. 上流テーブルのスキーマ変更時に予期しないカラムが含まれる
- C. パフォーマンスが常に悪化する
- D. テストが実行できなくなる', '**正解: B**
`SELECT *` は上流のカラム追加・削除を暗黙的に継承するため、予期しないスキーマ変更がパイプラインに伝播する。明示的にカラムを列挙するのがベストプラクティス。', 'https://docs.getdbt.com/best-practices/how-we-style/2-how-we-style-our-sql');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-263-opt-0', 'card-dbt-ae-263', 0, 'A', 'dbt が `SELECT *` をサポートしていない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-263-opt-1', 'card-dbt-ae-263', 1, 'B', '上流テーブルのスキーマ変更時に予期しないカラムが含まれる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-263-opt-2', 'card-dbt-ae-263', 2, 'C', 'パフォーマンスが常に悪化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-263-opt-3', 'card-dbt-ae-263', 3, 'D', 'テストが実行できなくなる', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-263-ans-0', 'card-dbt-ae-263', 'card-dbt-ae-263-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-264', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-5', 'Slim CI の仕組みとして正しいものは？
- A. 全モデルを毎回ビルドしてテストする
- B. 前回の本番アーティファクトと比較して変更分のみビルドする
- C. テストをスキップして高速化する
- D. 並列実行数を減らして負荷を軽減する', '**正解: B**
Slim CI は `state:modified` と `--defer` を組み合わせて、変更されたモデルとその下流のみをビルドし、未変更の上流は本番テーブルを参照する。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-264-opt-0', 'card-dbt-ae-264', 0, 'A', '全モデルを毎回ビルドしてテストする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-264-opt-1', 'card-dbt-ae-264', 1, 'B', '前回の本番アーティファクトと比較して変更分のみビルドする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-264-opt-2', 'card-dbt-ae-264', 2, 'C', 'テストをスキップして高速化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-264-opt-3', 'card-dbt-ae-264', 3, 'D', '並列実行数を減らして負荷を軽減する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-264-ans-0', 'card-dbt-ae-264', 'card-dbt-ae-264-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-265', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', 'YAMLで定義した description をDWH側のテーブルコメントに反映する設定は `____` である。
- A. `persist_docs`
- B. `sync_docs`
- C. `push_docs`
- D. `write_docs`', '**正解: `persist_docs`**
`persist_docs: { relation: true, columns: true }` でテーブルとカラムの両方にコメントを反映できる。', 'https://docs.getdbt.com/reference/resource-configs/persist_docs');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-265-opt-0', 'card-dbt-ae-265', 0, 'A', '`persist_docs`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-265-opt-1', 'card-dbt-ae-265', 1, 'B', '`sync_docs`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-265-opt-2', 'card-dbt-ae-265', 2, 'C', '`push_docs`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-265-opt-3', 'card-dbt-ae-265', 3, 'D', '`write_docs`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-266', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '以下の YAML でパースエラーが発生する原因は？
```yaml
models:
  - name: fct_orders
    description: This model contains: order data
    columns:
      - name: order_id
```', '**description にコロン `:` が含まれている**。YAML ではコロンが特殊文字のため、クォートで囲む必要がある:
```yaml
    description: "This model contains: order data"
```
または `>` で複数行テキストにする。', 'https://docs.getdbt.com/docs/build/documentation');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-267', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '以下のYAMLのコンパイルエラーの原因は？
```yaml
models:
  - name: dim_customers
    description:顧客のディメンションテーブル
    columns:
      - name: customer_id
```', '**3行目**: `description:` の後に**スペースがない**。
修正: `description: 顧客のディメンションテーブル` または `description: "顧客のディメンションテーブル"`
YAMLではコロンの後にスペースが必須。', 'https://docs.getdbt.com/docs/build/documentation');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-268', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-6', 'unit test の YAML 定義で必須の項目を**3つ**選べ。
- A. `model`（テスト対象モデル）
- B. `given`（入力データのモック）
- C. `expect`（期待する出力）
- D. `description`
- E. `severity`', '**正解: A, B, C**
- `model` — テスト対象
- `given` — 入力モックデータ（ref/sourceごとに定義）
- `expect` — 期待される出力行
description や severity は任意設定。', 'https://docs.getdbt.com/docs/build/unit-tests');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-268-opt-0', 'card-dbt-ae-268', 0, 'A', '`model`（テスト対象モデル）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-268-opt-1', 'card-dbt-ae-268', 1, 'B', '`given`（入力データのモック）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-268-opt-2', 'card-dbt-ae-268', 2, 'C', '`expect`（期待する出力）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-268-opt-3', 'card-dbt-ae-268', 3, 'D', '`description`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-268-opt-4', 'card-dbt-ae-268', 4, 'E', '`severity`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-268-ans-0', 'card-dbt-ae-268', 'card-dbt-ae-268-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-268-ans-1', 'card-dbt-ae-268', 'card-dbt-ae-268-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-268-ans-2', 'card-dbt-ae-268', 'card-dbt-ae-268-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-269', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', 'dbt の `{% docs %}` ブロックの目的は何か？
- A. マークダウンファイルで長い説明文を定義し、YAMLから `{{ doc() }}` で参照する
- B. SQL ファイル内にインラインコメントを追加する
- C. テスト結果のドキュメントを自動生成する
- D. dbt Cloud のREADMEを定義する', '**`{% docs %}` ブロック**はマークダウンファイル内で長い説明文を定義する仕組み。
定義: `.md` ファイルに `{% docs block_name %}...{% enddocs %}` で記述。
参照: YAML の description で `''{{ doc("block_name") }}''` として呼び出す。
テーブルや箇条書きなど複雑なフォーマットの説明に有用。', 'https://docs.getdbt.com/docs/build/documentation');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-269-opt-0', 'card-dbt-ae-269', 0, 'A', 'マークダウンファイルで長い説明文を定義し、YAMLから `{{ doc() }}` で参照する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-269-opt-1', 'card-dbt-ae-269', 1, 'B', 'SQL ファイル内にインラインコメントを追加する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-269-opt-2', 'card-dbt-ae-269', 2, 'C', 'テスト結果のドキュメントを自動生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-269-opt-3', 'card-dbt-ae-269', 3, 'D', 'dbt Cloud のREADMEを定義する', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-270', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '`dbt docs generate` コマンドが生成するファイルは？
- A. `target/` に `catalog.json` と `manifest.json`
- B. `docs/` に HTMLファイル
- C. `logs/` にドキュメントログ
- D. `target/compiled/` にSQLドキュメント', '**正解: A**
プロジェクトのメタデータを収集し、`target/` に `catalog.json` と `manifest.json` を生成する。これらがドキュメントサイトのデータ源。', 'https://docs.getdbt.com/reference/commands/cmd-docs');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-270-opt-0', 'card-dbt-ae-270', 0, 'A', '`target/` に `catalog.json` と `manifest.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-270-opt-1', 'card-dbt-ae-270', 1, 'B', '`docs/` に HTMLファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-270-opt-2', 'card-dbt-ae-270', 2, 'C', '`logs/` にドキュメントログ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-270-opt-3', 'card-dbt-ae-270', 3, 'D', '`target/compiled/` にSQLドキュメント', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-270-ans-0', 'card-dbt-ae-270', 'card-dbt-ae-270-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-271', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-6', 'dbt ドキュメントで description を定義できる場所を**2つ**選べ。
- A. YAMLファイルの `description:` フィールド
- B. モデルのSQLファイル内のコメント
- C. `{% docs %}` ブロック（doc block）
- D. `dbt_project.yml` の `docs:` セクション', '**正解: A, C**
YAMLで直接記述するか、`{% docs %}` ブロックに長い説明を書いて `{{ doc("name") }}` で参照する。SQLコメントはドキュメントに反映されない。', 'https://docs.getdbt.com/docs/build/documentation');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-271-opt-0', 'card-dbt-ae-271', 0, 'A', 'YAMLファイルの `description:` フィールド', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-271-opt-1', 'card-dbt-ae-271', 1, 'B', 'モデルのSQLファイル内のコメント', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-271-opt-2', 'card-dbt-ae-271', 2, 'C', '`{% docs %}` ブロック（doc block）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-271-opt-3', 'card-dbt-ae-271', 3, 'D', '`dbt_project.yml` の `docs:` セクション', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-271-ans-0', 'card-dbt-ae-271', 'card-dbt-ae-271-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-271-ans-1', 'card-dbt-ae-271', 'card-dbt-ae-271-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-272', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-6', 'dbt ドキュメントの生成と公開の手順として、以下を正しい順序に並べよ。
ステップ:
- (a) `dbt docs serve` でローカルにドキュメントサイトを起動
- (b) 必要に応じて `{% docs %}` ブロックで長い説明文を作成
- (c) ブラウザでDAGの可視化やモデル定義を確認
- (d) `dbt docs generate` で `catalog.json` と `manifest.json` を生成
- (e) YAMLファイルでモデルとカラムの description を定義', '**正解: e → b → d → a → c**
1. **(e)** YAMLファイルでモデルとカラムの **description** を定義
2. **(b)** 必要に応じて **`{% docs %}` ブロック**で長い説明文を作成
3. **(d)** `dbt docs generate` で **`catalog.json` と `manifest.json`** を生成
4. **(a)** `dbt docs serve` で**ローカルにドキュメントサイトを起動**
5. **(c)** ブラウザで **DAGの可視化やモデル定義**を確認', 'https://docs.getdbt.com/reference/commands/cmd-docs');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-272-opt-0', 'card-dbt-ae-272', 0, 'a', '`dbt docs serve` でローカルにドキュメントサイトを起動', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-272-opt-1', 'card-dbt-ae-272', 1, 'b', '必要に応じて `{% docs %}` ブロックで長い説明文を作成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-272-opt-2', 'card-dbt-ae-272', 2, 'c', 'ブラウザでDAGの可視化やモデル定義を確認', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-272-opt-3', 'card-dbt-ae-272', 3, 'd', '`dbt docs generate` で `catalog.json` と `manifest.json` を生成', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-272-opt-4', 'card-dbt-ae-272', 4, 'e', 'YAMLファイルでモデルとカラムの description を定義', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-272-ans-0', 'card-dbt-ae-272', 'card-dbt-ae-272-opt-4', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-272-ans-1', 'card-dbt-ae-272', 'card-dbt-ae-272-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-272-ans-2', 'card-dbt-ae-272', 'card-dbt-ae-272-opt-3', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-272-ans-3', 'card-dbt-ae-272', 'card-dbt-ae-272-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-272-ans-4', 'card-dbt-ae-272', 'card-dbt-ae-272-opt-2', NULL, 4);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-273', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '以下の `{% docs %}` ブロックの構文エラーを修正せよ。
```markdown
{% docs orders_status }
Orders can be: placed, shipped, completed, returned.
{% enddoc %}
```', '**2つのエラー:**
1. 開始タグ: `{% docs orders_status }` → `{% docs orders_status %}`（`%` が欠けている）
2. 終了タグ: `{% enddoc %}` → `{% enddocs %}`（`s` が欠けている）', 'https://docs.getdbt.com/docs/build/documentation');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-274', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '以下の YAML で `description` に `{{ doc() }}` を使う利点は何か？
```yaml
models:
  - name: fct_orders
    columns:
      - name: status
        description: ''{{ doc("orders_status") }}''
```', '**利点:**
1. 長い説明文やマークダウンテーブルを YAML から分離でき、可読性が向上する
2. 同じ説明を複数箇所で再利用できる（DRY原則）
3. `.md` ファイルはエディタのシンタックスハイライトが効く', 'https://docs.getdbt.com/docs/build/documentation');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-275', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', 'dbt docs のDAGでモデル間のリネージ（依存関係）が自動的に表示される理由は？
- A. `ref()` と `source()` が依存関係を自動的にパースし manifest.json に記録するため
- B. dbt が DWH のメタデータから外部キーを読み取るため
- C. YAML で `depends_on` を明示的に定義しているため
- D. dbt Cloud がクエリログを分析するため', '**`ref()` と `source()` 関数**を使うことで、dbt がモデル間の依存関係を自動的にパースし、`manifest.json` に記録する。`dbt docs generate` はこの情報からDAGのリネージグラフを生成する。直接テーブル名を書いた場合はリネージに反映されない。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-275-opt-0', 'card-dbt-ae-275', 0, 'A', '`ref()` と `source()` が依存関係を自動的にパースし manifest.json に記録するため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-275-opt-1', 'card-dbt-ae-275', 1, 'B', 'dbt が DWH のメタデータから外部キーを読み取るため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-275-opt-2', 'card-dbt-ae-275', 2, 'C', 'YAML で `depends_on` を明示的に定義しているため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-275-opt-3', 'card-dbt-ae-275', 3, 'D', 'dbt Cloud がクエリログを分析するため', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-276', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '各 dbt アーティファクトの生成タイミング（左列）を対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `manifest.json` | a. `dbt docs generate` 実行時 |
| 2. `run_results.json` | b. `dbt run/build/test` 等の実行完了時 |
| 3. `catalog.json` | c. `dbt parse/compile/run` 等のほぼ全コマンドで生成 |', '**1-c, 2-b, 3-a**
| アーティファクト | 生成タイミング |
|---|---|
| `manifest.json` → c | ほぼ全コマンド（parse以降の全処理） |
| `run_results.json` → b | run/build/test 等の実行完了時 |
| `catalog.json` → a | `dbt docs generate` 実行時のみ |', 'https://docs.getdbt.com/reference/commands/cmd-docs');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-277', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '`dbt docs serve` コマンドの機能は？
- A. ドキュメントサイトをクラウドにデプロイする
- B. ローカルでドキュメントサイトのWebサーバーを起動する
- C. ドキュメントのPDFを生成する
- D. ドキュメントをGitにプッシュする', '**正解: B**
ローカルのWebサーバーを起動し、ブラウザでDAG可視化やモデルの定義・テスト結果を閲覧できる。', 'https://docs.getdbt.com/docs/build/documentation');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-277-opt-0', 'card-dbt-ae-277', 0, 'A', 'ドキュメントサイトをクラウドにデプロイする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-277-opt-1', 'card-dbt-ae-277', 1, 'B', 'ローカルでドキュメントサイトのWebサーバーを起動する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-277-opt-2', 'card-dbt-ae-277', 2, 'C', 'ドキュメントのPDFを生成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-277-opt-3', 'card-dbt-ae-277', 3, 'D', 'ドキュメントをGitにプッシュする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-277-ans-0', 'card-dbt-ae-277', 'card-dbt-ae-277-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-278', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-6', '`dbt docs generate` が生成するファイルはどれか？（該当するものをすべて選択）
- A. `run_results.json`
- B. `index.html`
- C. `manifest.json`
- D. `catalog.json`', '**正解: B, C, D**
`manifest.json`（プロジェクト構造）、`catalog.json`（DWHのメタデータ）、`index.html`（ドキュメントサイトのエントリポイント）が生成される。', 'https://docs.getdbt.com/reference/commands/cmd-docs');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-278-opt-0', 'card-dbt-ae-278', 0, 'A', '`run_results.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-278-opt-1', 'card-dbt-ae-278', 1, 'B', '`index.html`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-278-opt-2', 'card-dbt-ae-278', 2, 'C', '`manifest.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-278-opt-3', 'card-dbt-ae-278', 3, 'D', '`catalog.json`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-278-ans-0', 'card-dbt-ae-278', 'card-dbt-ae-278-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-278-ans-1', 'card-dbt-ae-278', 'card-dbt-ae-278-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-278-ans-2', 'card-dbt-ae-278', 'card-dbt-ae-278-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-279', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '`{{ doc("my_doc") }}` の用途は？
- A. Markdownファイルからドキュメントを埋め込む
- B. `{% docs my_doc %}` ブロックで定義した内容を参照する
- C. 外部URLのドキュメントを参照する
- D. YAMLファイルの description を参照する', '**正解: B**
`{% docs my_doc %}` ブロックで定義した長い説明文をYAMLの `description` 内で `{{ doc("my_doc") }}` として参照する。Markdown記法が使える。', 'https://docs.getdbt.com/docs/build/documentation');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-279-opt-0', 'card-dbt-ae-279', 0, 'A', 'Markdownファイルからドキュメントを埋め込む', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-279-opt-1', 'card-dbt-ae-279', 1, 'B', '`{% docs my_doc %}` ブロックで定義した内容を参照する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-279-opt-2', 'card-dbt-ae-279', 2, 'C', '外部URLのドキュメントを参照する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-279-opt-3', 'card-dbt-ae-279', 3, 'D', 'YAMLファイルの description を参照する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-279-ans-0', 'card-dbt-ae-279', 'card-dbt-ae-279-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-280', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '`profiles.yml` の主な役割は？
- A. モデルの定義とテスト設定
- B. DWH接続情報とターゲット環境の定義
- C. パッケージの依存関係管理
- D. ドキュメントの設定', '**正解: B**
ターゲット環境（dev, prod等）ごとにDWH接続情報（type, host, database, schema, credentials等）を定義する。', 'https://docs.getdbt.com/docs/core/connect-data-platform/connection-profiles');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-280-opt-0', 'card-dbt-ae-280', 0, 'A', 'モデルの定義とテスト設定', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-280-opt-1', 'card-dbt-ae-280', 1, 'B', 'DWH接続情報とターゲット環境の定義', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-280-opt-2', 'card-dbt-ae-280', 2, 'C', 'パッケージの依存関係管理', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-280-opt-3', 'card-dbt-ae-280', 3, 'D', 'ドキュメントの設定', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-280-ans-0', 'card-dbt-ae-280', 'card-dbt-ae-280-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-281', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', '`persist_docs` 設定の効果は？
- A. ドキュメントサイトを永続化する
- B. YAMLで定義した description をDWH側のテーブル/カラムのコメントに反映する
- C. ドキュメントをGitにコミットする
- D. テスト結果をドキュメントに追加する', '**正解: B**
`persist_docs: { relation: true, columns: true }` で、dbtのYAML定義がDWHのメタデータに反映される。', 'https://docs.getdbt.com/reference/resource-configs/persist_docs');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-281-opt-0', 'card-dbt-ae-281', 0, 'A', 'ドキュメントサイトを永続化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-281-opt-1', 'card-dbt-ae-281', 1, 'B', 'YAMLで定義した description をDWH側のテーブル/カラムのコメントに反映する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-281-opt-2', 'card-dbt-ae-281', 2, 'C', 'ドキュメントをGitにコミットする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-281-opt-3', 'card-dbt-ae-281', 3, 'D', 'テスト結果をドキュメントに追加する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-281-ans-0', 'card-dbt-ae-281', 'card-dbt-ae-281-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-282', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', 'dbt の docs ブロックはどのファイルに定義するか？
- A. `.yml` ファイル
- B. `.sql` ファイル
- C. `.md` ファイル
- D. `dbt_project.yml`', '**正解: C**
`{% docs %}` ブロックは `.md`（マークダウン）ファイルに定義する。ファイル名やパスに制約はなく、`models/` 配下に置くのが一般的。', 'https://docs.getdbt.com/docs/build/documentation');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-282-opt-0', 'card-dbt-ae-282', 0, 'A', '`.yml` ファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-282-opt-1', 'card-dbt-ae-282', 1, 'B', '`.sql` ファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-282-opt-2', 'card-dbt-ae-282', 2, 'C', '`.md` ファイル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-282-opt-3', 'card-dbt-ae-282', 3, 'D', '`dbt_project.yml`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-282-ans-0', 'card-dbt-ae-282', 'card-dbt-ae-282-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-283', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-6', 'カスタムマクロは dbt docs のDAGリネージグラフにどのように表示されるか？
- A. 独立したノードとして表示される
- B. マクロを使用するモデルのノードにマクロ名が付記される
- C. DAGには表示されない
- D. マクロ専用のサブグラフが生成される', '**正解: C**
マクロはDAGのノードとしては表示されない。DAGに表示されるのは models, sources, seeds, snapshots, exposures, metrics などのリソースノードのみ。', 'https://docs.getdbt.com/docs/build/documentation');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-283-opt-0', 'card-dbt-ae-283', 0, 'A', '独立したノードとして表示される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-283-opt-1', 'card-dbt-ae-283', 1, 'B', 'マクロを使用するモデルのノードにマクロ名が付記される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-283-opt-2', 'card-dbt-ae-283', 2, 'C', 'DAGには表示されない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-283-opt-3', 'card-dbt-ae-283', 3, 'D', 'マクロ専用のサブグラフが生成される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-283-ans-0', 'card-dbt-ae-283', 'card-dbt-ae-283-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-284', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '`dbt run --select source:stripe+` の効果は？
- A. stripe ソースと、そのソースを参照するすべてのモデルを実行する
- B. stripe ソースのみを実行する
- C. stripe ソースの freshness チェックを実行する
- D. stripe パッケージの全モデルを実行する', '**正解: A**
`source:stripe+` は stripe ソースの**下流すべて**（ソースを参照するモデルとその先の下流）を選択して実行する。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-284-opt-0', 'card-dbt-ae-284', 0, 'A', 'stripe ソースと、そのソースを参照するすべてのモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-284-opt-1', 'card-dbt-ae-284', 1, 'B', 'stripe ソースのみを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-284-opt-2', 'card-dbt-ae-284', 2, 'C', 'stripe ソースの freshness チェックを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-284-opt-3', 'card-dbt-ae-284', 3, 'D', 'stripe パッケージの全モデルを実行する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-284-ans-0', 'card-dbt-ae-284', 'card-dbt-ae-284-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-285', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '`run_query()` マクロの用途は？
- A. モデルを実行する
- B. 任意のSQLをDWHに対して実行し結果を返す
- C. テストクエリを実行する
- D. ソースの鮮度をチェックする', '**正解: B**
`{% set results = run_query("select max(date) from table") %}` で任意のSQLをDWHに対して実行し、結果を Agate テーブルとして返す。`{% if execute %}` ガードが必要。', 'https://docs.getdbt.com/docs/build/jinja-macros');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-285-opt-0', 'card-dbt-ae-285', 0, 'A', 'モデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-285-opt-1', 'card-dbt-ae-285', 1, 'B', '任意のSQLをDWHに対して実行し結果を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-285-opt-2', 'card-dbt-ae-285', 2, 'C', 'テストクエリを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-285-opt-3', 'card-dbt-ae-285', 3, 'D', 'ソースの鮮度をチェックする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-285-ans-0', 'card-dbt-ae-285', 'card-dbt-ae-285-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-286', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-7', 'ドキュメントサイトで確認できる情報を**3つ**選べ。
- A. モデルのDAG（依存関係グラフ）
- B. カラムのdescription
- C. テストの実行履歴
- D. ソースの一覧と freshness 状態', '**正解: A, B, D**
DAGの可視化、カラム定義、ソース情報などが確認可能。テストの実行履歴（過去の結果推移）は `dbt docs` では表示されない。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-286-opt-0', 'card-dbt-ae-286', 0, 'A', 'モデルのDAG（依存関係グラフ）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-286-opt-1', 'card-dbt-ae-286', 1, 'B', 'カラムのdescription', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-286-opt-2', 'card-dbt-ae-286', 2, 'C', 'テストの実行履歴', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-286-opt-3', 'card-dbt-ae-286', 3, 'D', 'ソースの一覧と freshness 状態', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-286-ans-0', 'card-dbt-ae-286', 'card-dbt-ae-286-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-286-ans-1', 'card-dbt-ae-286', 'card-dbt-ae-286-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-286-ans-2', 'card-dbt-ae-286', 'card-dbt-ae-286-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-287', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-7', 'exposure の `type` に設定できる値をすべて選べ。
- A. dashboard
- B. notebook
- C. report
- D. ml
- E. application', '**正解: A, B, D, E**
設定可能な値: dashboard, notebook, analysis, ml, application。`report` は有効な型ではない。', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-287-opt-0', 'card-dbt-ae-287', 0, 'A', 'dashboard', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-287-opt-1', 'card-dbt-ae-287', 1, 'B', 'notebook', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-287-opt-2', 'card-dbt-ae-287', 2, 'C', 'report', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-287-opt-3', 'card-dbt-ae-287', 3, 'D', 'ml', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-287-opt-4', 'card-dbt-ae-287', 4, 'E', 'application', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-287-ans-0', 'card-dbt-ae-287', 'card-dbt-ae-287-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-287-ans-1', 'card-dbt-ae-287', 'card-dbt-ae-287-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-287-ans-2', 'card-dbt-ae-287', 'card-dbt-ae-287-opt-3', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-287-ans-3', 'card-dbt-ae-287', 'card-dbt-ae-287-opt-4', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-288', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'source freshness チェックに必須の設定項目は？
- A. `database` と `schema`
- B. `loaded_at_field` とfreshness閾値（`warn_after` / `error_after`）
- C. `unique_key` と `strategy`
- D. `contract` と `access`', '**正解: B**
`loaded_at_field` でタイムスタンプカラムを指定し、`warn_after` / `error_after` で閾値を設定する。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-288-opt-0', 'card-dbt-ae-288', 0, 'A', '`database` と `schema`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-288-opt-1', 'card-dbt-ae-288', 1, 'B', '`loaded_at_field` とfreshness閾値（`warn_after` / `error_after`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-288-opt-2', 'card-dbt-ae-288', 2, 'C', '`unique_key` と `strategy`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-288-opt-3', 'card-dbt-ae-288', 3, 'D', '`contract` と `access`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-288-ans-0', 'card-dbt-ae-288', 'card-dbt-ae-288-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-289', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'snapshot の `timestamp` strategy で必須の設定項目はどれか？
- A. `check_cols`
- B. `updated_at`
- C. `loaded_at_field`
- D. `event_time`', '**正解: B**
`timestamp` strategy は `updated_at` カラムの値変化で行の変更を検出する。`check_cols` は check strategy 用。', 'https://docs.getdbt.com/docs/build/snapshots');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-289-opt-0', 'card-dbt-ae-289', 0, 'A', '`check_cols`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-289-opt-1', 'card-dbt-ae-289', 1, 'B', '`updated_at`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-289-opt-2', 'card-dbt-ae-289', 2, 'C', '`loaded_at_field`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-289-opt-3', 'card-dbt-ae-289', 3, 'D', '`event_time`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-289-ans-0', 'card-dbt-ae-289', 'card-dbt-ae-289-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-290', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '以下の exposure 定義で不足している必須項目は？
```yaml
exposures:
  - name: weekly_sales_dashboard
    type: dashboard
    depends_on:
      - ref(''fct_orders'')
```', '**`owner` が未設定**。exposure には `owner`（name と email）が必須。
修正:
```yaml
    owner:
      name: Sales Team
      email: sales@example.com
```', 'https://docs.getdbt.com/docs/build/exposures');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-291', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'ソースデータの鮮度チェックに必須のタイムスタンプカラム設定は `____` である。
- A. `loaded_at_field`
- B. `timestamp_column`
- C. `freshness_field`
- D. `updated_at`', '**正解: `loaded_at_field`**
ソースまたはテーブルレベルで設定し、`warn_after` / `error_after` の閾値と組み合わせて使う。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-291-opt-0', 'card-dbt-ae-291', 0, 'A', '`loaded_at_field`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-291-opt-1', 'card-dbt-ae-291', 1, 'B', '`timestamp_column`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-291-opt-2', 'card-dbt-ae-291', 2, 'C', '`freshness_field`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-291-opt-3', 'card-dbt-ae-291', 3, 'D', '`updated_at`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-292', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '以下の source freshness 設定でエラーになる原因は？
```yaml
sources:
  - name: jaffle_shop
    freshness:
      warn_after: { count: 12, period: hour }
      error_after: { count: 24, period: hour }
    tables:
      - name: orders
```', '**`loaded_at_field` が未設定**。freshness チェックにはタイムスタンプカラムの指定が必須。
修正: `loaded_at_field: _etl_loaded_at` をソースまたはテーブルレベルに追加する。', 'https://docs.getdbt.com/docs/build/sources');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-293', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-7', 'exposure で `depends_on` に指定できるリソースタイプは？（該当するものをすべて選択）
- A. `ref(''model_name'')`
- B. `macro(''macro_name'')`
- C. `metric(''metric_name'')`
- D. `source(''source'', ''table'')`', '**正解: A, C, D**
`depends_on` には `ref()`, `source()`, `metric()` を指定できる。マクロは依存関係として指定できない。', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-293-opt-0', 'card-dbt-ae-293', 0, 'A', '`ref(''model_name'')`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-293-opt-1', 'card-dbt-ae-293', 1, 'B', '`macro(''macro_name'')`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-293-opt-2', 'card-dbt-ae-293', 2, 'C', '`metric(''metric_name'')`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-293-opt-3', 'card-dbt-ae-293', 3, 'D', '`source(''source'', ''table'')`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-293-ans-0', 'card-dbt-ae-293', 'card-dbt-ae-293-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-293-ans-1', 'card-dbt-ae-293', 'card-dbt-ae-293-opt-2', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-293-ans-2', 'card-dbt-ae-293', 'card-dbt-ae-293-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-294', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '以下の exposure 定義で `depends_on` の書き方として正しいものは？
```yaml
exposures:
  - name: sales_dashboard
    type: dashboard
    owner:
      name: Analytics Team
      email: analytics@example.com
    depends_on:
      - ref(''fct_orders'')
      - ref(''dim_customers'')
```', '`depends_on` に `ref()` を使ってモデルへの依存関係を宣言している。**source への依存は `source()` を使う**。これによりDAG上でモデルの変更が下流の利用先に影響することが可視化される。', 'https://docs.getdbt.com/docs/build/exposures');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-295', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'source freshness の結果が `warn` になる条件は？
- A. `loaded_at_field` が NULL の場合
- B. 最終更新からの経過時間が `warn_after` を超え、`error_after` 未満の場合
- C. ソーステーブルが存在しない場合
- D. `loaded_at_field` のカラムが存在しない場合', '**正解: B**
`warn_after` の閾値を超えたが `error_after` にはまだ達していない場合に warn を返す。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-295-opt-0', 'card-dbt-ae-295', 0, 'A', '`loaded_at_field` が NULL の場合', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-295-opt-1', 'card-dbt-ae-295', 1, 'B', '最終更新からの経過時間が `warn_after` を超え、`error_after` 未満の場合', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-295-opt-2', 'card-dbt-ae-295', 2, 'C', 'ソーステーブルが存在しない場合', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-295-opt-3', 'card-dbt-ae-295', 3, 'D', '`loaded_at_field` のカラムが存在しない場合', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-295-ans-0', 'card-dbt-ae-295', 'card-dbt-ae-295-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-296', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'dbt の exposure の目的は？
- A. モデルの上流ソースを定義する
- B. モデルの下流の利用先（ダッシュボード、アプリ等）を定義する
- C. モデルのテスト結果を公開する
- D. モデルのアクセス権限を設定する', '**正解: B**
exposure はdbtモデルの**下流の利用先**を定義するリソース。モデルの変更が何に影響するかを可視化し、データリネージの完全な把握を可能にする。', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-296-opt-0', 'card-dbt-ae-296', 0, 'A', 'モデルの上流ソースを定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-296-opt-1', 'card-dbt-ae-296', 1, 'B', 'モデルの下流の利用先（ダッシュボード、アプリ等）を定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-296-opt-2', 'card-dbt-ae-296', 2, 'C', 'モデルのテスト結果を公開する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-296-opt-3', 'card-dbt-ae-296', 3, 'D', 'モデルのアクセス権限を設定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-296-ans-0', 'card-dbt-ae-296', 'card-dbt-ae-296-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-297', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-7', 'exposure の `maturity` 設定に使える値を**すべて**選べ。
- A. `high`
- B. `medium`
- C. `low`
- D. `critical`', '**正解: A, B, C**
exposure の `maturity` は `high`, `medium`, `low` の3段階。ダッシュボードやアプリの成熟度を示すメタデータ。', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-297-opt-0', 'card-dbt-ae-297', 0, 'A', '`high`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-297-opt-1', 'card-dbt-ae-297', 1, 'B', '`medium`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-297-opt-2', 'card-dbt-ae-297', 2, 'C', '`low`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-297-opt-3', 'card-dbt-ae-297', 3, 'D', '`critical`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-297-ans-0', 'card-dbt-ae-297', 'card-dbt-ae-297-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-297-ans-1', 'card-dbt-ae-297', 'card-dbt-ae-297-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-297-ans-2', 'card-dbt-ae-297', 'card-dbt-ae-297-opt-2', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-298', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-7', '各 dbt アーティファクト（左列）を、その内容（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `manifest.json` | a. source freshness チェックの結果 |
| 2. `run_results.json` | b. DWH上のテーブル・ビューのメタデータ（カラム情報等） |
| 3. `catalog.json` | c. 各リソースの実行結果（status, timing, rows affected） |
| 4. `sources.json` | d. プロジェクト内の全ノード（モデル、テスト、ソース等）の完全な定義 |', '**1-d, 2-c, 3-b, 4-a**
| アーティファクト | 内容 |
|---|---|
| `manifest.json` → d | プロジェクトの**全ノードの定義** |
| `run_results.json` → c | 各リソースの**実行結果** |
| `catalog.json` → b | DWH上の**テーブルメタデータ** |
| `sources.json` → a | **source freshness** の結果 |', 'https://docs.getdbt.com/reference/artifacts/dbt-artifacts');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-0', 'card-dbt-ae-298', 0, '1', 'manifest.json', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-1', 'card-dbt-ae-298', 1, '2', 'run_results.json', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-2', 'card-dbt-ae-298', 2, '3', 'catalog.json', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-3', 'card-dbt-ae-298', 3, '4', 'sources.json', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-4', 'card-dbt-ae-298', 4, 'a', 'source freshness チェックの結果', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-5', 'card-dbt-ae-298', 5, 'b', 'DWH上のテーブル・ビューのメタデータ（カラム情報等）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-6', 'card-dbt-ae-298', 6, 'c', '各リソースの実行結果（status, timing, rows affected）', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-298-opt-7', 'card-dbt-ae-298', 7, 'd', 'プロジェクト内の全ノード（モデル、テスト、ソース等）の完全な定義', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-298-ans-0', 'card-dbt-ae-298', 'card-dbt-ae-298-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-298-ans-1', 'card-dbt-ae-298', 'card-dbt-ae-298-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-298-ans-2', 'card-dbt-ae-298', 'card-dbt-ae-298-opt-2', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-298-ans-3', 'card-dbt-ae-298', 'card-dbt-ae-298-opt-3', NULL, 0);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-299', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-7', '各 exposure type（左列）を、その代表的な利用先（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. dashboard | a. 機械学習モデル |
| 2. notebook | b. BIツールのダッシュボード |
| 3. analysis | c. アプリケーション |
| 4. ml | d. アドホックな分析 |
| 5. application | e. Jupyter等の分析ノートブック |', '**1-b, 2-e, 3-d, 4-a, 5-c**
| type | 代表的な利用先 |
|---|---|
| **dashboard** → b | BIツールのダッシュボード |
| **notebook** → e | Jupyter等の分析ノートブック |
| **analysis** → d | アドホックな分析 |
| **ml** → a | 機械学習モデル |
| **application** → c | アプリケーション |', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-0', 'card-dbt-ae-299', 0, '1', 'dashboard', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-1', 'card-dbt-ae-299', 1, '2', 'notebook', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-2', 'card-dbt-ae-299', 2, '3', 'analysis', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-3', 'card-dbt-ae-299', 3, '4', 'ml', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-4', 'card-dbt-ae-299', 4, '5', 'application', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-5', 'card-dbt-ae-299', 5, 'a', '機械学習モデル', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-6', 'card-dbt-ae-299', 6, 'b', 'BIツールのダッシュボード', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-7', 'card-dbt-ae-299', 7, 'c', 'アプリケーション', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-8', 'card-dbt-ae-299', 8, 'd', 'アドホックな分析', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-299-opt-9', 'card-dbt-ae-299', 9, 'e', 'Jupyter等の分析ノートブック', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-299-ans-0', 'card-dbt-ae-299', 'card-dbt-ae-299-opt-0', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-299-ans-1', 'card-dbt-ae-299', 'card-dbt-ae-299-opt-1', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-299-ans-2', 'card-dbt-ae-299', 'card-dbt-ae-299-opt-2', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-299-ans-3', 'card-dbt-ae-299', 'card-dbt-ae-299-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-299-ans-4', 'card-dbt-ae-299', 'card-dbt-ae-299-opt-4', NULL, 2);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-300', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '外部のソーステーブル（raw data）を参照するマクロは `{{ ____ }}` である。
- A. `ref()`
- B. `source()`
- C. `raw()`
- D. `external()`', '**正解: `source()`** → `{{ source(''source_name'', ''table_name'') }}`
`sources.yml` に定義されたソースを参照する。source freshness チェックの対象にもなる。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-300-opt-0', 'card-dbt-ae-300', 0, 'A', '`ref()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-300-opt-1', 'card-dbt-ae-300', 1, 'B', '`source()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-300-opt-2', 'card-dbt-ae-300', 2, 'C', '`raw()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-300-opt-3', 'card-dbt-ae-300', 3, 'D', '`external()`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-301', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '`dbt source freshness --select source:stripe` の効果は？
- A. stripe ソースの全テーブルの鮮度チェックを実行する
- B. stripe ソースを参照するモデルを実行する
- C. stripe ソースのテストを実行する
- D. stripe ソースの定義を表示する', '**正解: A**
指定したソースの全テーブルに対して `loaded_at_field` を使った鮮度チェックを実行し、`warn_after` / `error_after` の閾値に基づいて結果を返す。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-301-opt-0', 'card-dbt-ae-301', 0, 'A', 'stripe ソースの全テーブルの鮮度チェックを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-301-opt-1', 'card-dbt-ae-301', 1, 'B', 'stripe ソースを参照するモデルを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-301-opt-2', 'card-dbt-ae-301', 2, 'C', 'stripe ソースのテストを実行する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-301-opt-3', 'card-dbt-ae-301', 3, 'D', 'stripe ソースの定義を表示する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-301-ans-0', 'card-dbt-ae-301', 'card-dbt-ae-301-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-302', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'ソースデータの鮮度を確認するコマンドは `dbt ____ ____` である。
- A. `source freshness`
- B. `check freshness`
- C. `test freshness`
- D. `source validate`', '**正解: `source freshness`** → `dbt source freshness`
`loaded_at_field` で指定したタイムスタンプカラムを使い、閾値に基づいて PASS / WARN / ERROR を返す。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-302-opt-0', 'card-dbt-ae-302', 0, 'A', '`source freshness`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-302-opt-1', 'card-dbt-ae-302', 1, 'B', '`check freshness`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-302-opt-2', 'card-dbt-ae-302', 2, 'C', '`test freshness`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-302-opt-3', 'card-dbt-ae-302', 3, 'D', '`source validate`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-303', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '以下の exposure 定義に不足している必須フィールドは？
```yaml
exposures:
  - name: weekly_report
    type: dashboard
    depends_on:
      - ref(''fct_orders'')
```', '**`owner` フィールドが不足**。`owner` は必須で、`name` と `email` のどちらかを指定する必要がある:
```yaml
    owner:
      name: Data Team
      email: data@company.com
```', 'https://docs.getdbt.com/docs/build/exposures');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-304', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', '`dbt source freshness` コマンドの出力先ファイルは？
- A. `target/sources.json`
- B. `target/freshness.json`
- C. `logs/source_freshness.log`
- D. `target/run_results.json`', '**正解: A**
source freshness の結果は `target/sources.json` に出力される。各ソーステーブルの鮮度状態（pass/warn/error）が記録される。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-304-opt-0', 'card-dbt-ae-304', 0, 'A', '`target/sources.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-304-opt-1', 'card-dbt-ae-304', 1, 'B', '`target/freshness.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-304-opt-2', 'card-dbt-ae-304', 2, 'C', '`logs/source_freshness.log`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-304-opt-3', 'card-dbt-ae-304', 3, 'D', '`target/run_results.json`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-304-ans-0', 'card-dbt-ae-304', 'card-dbt-ae-304-opt-0', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-305', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'source の `loaded_at_field` の用途は？
- A. ソース鮮度チェックに使用するタイムスタンプカラムを指定する
- B. ソーステーブルの作成日時を記録する
- C. incremental モデルのウォーターマークを設定する
- D. ソースデータのパーティションキーを指定する', '**ソースの鮮度チェック（source freshness）に使用するタイムスタンプカラム**を指定する。
```yaml
sources:
  - name: stripe
    tables:
      - name: payments
        loaded_at_field: _batched_at
        freshness:
          warn_after: {count: 12, period: hour}
          error_after: {count: 24, period: hour}
```
`dbt source freshness` 実行時にこのカラムの最大値を確認して鮮度を判定する。', 'https://docs.getdbt.com/docs/build/sources');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-305-opt-0', 'card-dbt-ae-305', 0, 'A', 'ソース鮮度チェックに使用するタイムスタンプカラムを指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-305-opt-1', 'card-dbt-ae-305', 1, 'B', 'ソーステーブルの作成日時を記録する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-305-opt-2', 'card-dbt-ae-305', 2, 'C', 'incremental モデルのウォーターマークを設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-305-opt-3', 'card-dbt-ae-305', 3, 'D', 'ソースデータのパーティションキーを指定する', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-306', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'DAG上で exposure の表示と利点として正しいものは？
- A. 最下流ノードとしてオレンジ色で表示され、影響範囲の可視化とセレクタでの活用が可能
- B. 最上流ノードとして青色で表示され、データソースとの接続を示す
- C. テストノードとして赤色で表示され、品質チェックの可視化が可能
- D. 中間ノードとして緑色で表示され、変換ロジックの可視化が可能', 'exposure は DAG の**最下流ノード**としてオレンジ色のアイコンで表示される。
利点:
1. どのダッシュボードやアプリがどのモデルに依存しているか可視化される
2. モデル変更時の影響範囲（blast radius）を把握できる
3. `dbt build --select +exposure:weekly_metrics` で exposure に必要な上流すべてをビルドできる', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-306-opt-0', 'card-dbt-ae-306', 0, 'A', '最下流ノードとしてオレンジ色で表示され、影響範囲の可視化とセレクタでの活用が可能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-306-opt-1', 'card-dbt-ae-306', 1, 'B', '最上流ノードとして青色で表示され、データソースとの接続を示す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-306-opt-2', 'card-dbt-ae-306', 2, 'C', 'テストノードとして赤色で表示され、品質チェックの可視化が可能', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-306-opt-3', 'card-dbt-ae-306', 3, 'D', '中間ノードとして緑色で表示され、変換ロジックの可視化が可能', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-307', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'exposure の `maturity` フィールドの値と意味の組み合わせとして正しいものは？
- A. `high`=本番クリティカル、`medium`=開発完了だが成熟途中、`low`=実験的
- B. `production`=本番、`staging`=ステージング、`development`=開発
- C. `stable`=安定、`beta`=ベータ、`alpha`=アルファ
- D. `critical`=重要、`normal`=通常、`minor`=軽微', '- **`high`** — 本番環境で安定稼働、ビジネスクリティカル
- **`medium`** — 開発完了だがまだ成熟途中
- **`low`** — 実験的、初期段階', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-307-opt-0', 'card-dbt-ae-307', 0, 'A', '`high`=本番クリティカル、`medium`=開発完了だが成熟途中、`low`=実験的', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-307-opt-1', 'card-dbt-ae-307', 1, 'B', '`production`=本番、`staging`=ステージング、`development`=開発', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-307-opt-2', 'card-dbt-ae-307', 2, 'C', '`stable`=安定、`beta`=ベータ、`alpha`=アルファ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-307-opt-3', 'card-dbt-ae-307', 3, 'D', '`critical`=重要、`normal`=通常、`minor`=軽微', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-308', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-7', 'exposure の `type` に指定できる値の組み合わせとして正しいものは？
- A. `dashboard`, `notebook`, `analysis`, `ml`, `application`
- B. `dashboard`, `report`, `analysis`, `model`, `app`
- C. `bi`, `notebook`, `query`, `ml`, `service`
- D. `dashboard`, `notebook`, `analysis`, `pipeline`, `application`', '**5つの type:**
1. `dashboard` — ダッシュボード
2. `notebook` — Jupyter等のノートブック
3. `analysis` — アドホック分析
4. `ml` — 機械学習モデル
5. `application` — アプリケーション', 'https://docs.getdbt.com/docs/build/exposures');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-308-opt-0', 'card-dbt-ae-308', 0, 'A', '`dashboard`, `notebook`, `analysis`, `ml`, `application`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-308-opt-1', 'card-dbt-ae-308', 1, 'B', '`dashboard`, `report`, `analysis`, `model`, `app`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-308-opt-2', 'card-dbt-ae-308', 2, 'C', '`bi`, `notebook`, `query`, `ml`, `service`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-308-opt-3', 'card-dbt-ae-308', 3, 'D', '`dashboard`, `notebook`, `analysis`, `pipeline`, `application`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-309', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '前回のstate以降に変更されたリソースのみを選択するセレクターは `____:____` である。
- A. `state:modified`
- B. `state:changed`
- C. `result:modified`
- D. `diff:changed`', '**正解: `state:modified`**
`dbt run --select state:modified --state ./prod-artifacts` のように使う。CI/CDで変更モデルのみをテスト・デプロイするのに有用。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-309-opt-0', 'card-dbt-ae-309', 0, 'A', '`state:modified`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-309-opt-1', 'card-dbt-ae-309', 1, 'B', '`state:changed`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-309-opt-2', 'card-dbt-ae-309', 2, 'C', '`result:modified`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-309-opt-3', 'card-dbt-ae-309', 3, 'D', '`diff:changed`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-310', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '`dbt run --defer --state ./prod-artifacts --select state:modified` の各フラグの役割を対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `--defer` | a. 変更されたモデルのみを選択 |
| 2. `--state ./prod-artifacts` | b. 未ビルドの上流を本番テーブルで代替 |
| 3. `--select state:modified` | c. 前回の state アーティファクトの場所を指定 |', '**1-b, 2-c, 3-a**
| フラグ | 役割 |
|---|---|
| `--defer` → b | 未ビルドの上流を**本番テーブルで代替** |
| `--state` → c | アーティファクトの**パスを指定** |
| `state:modified` → a | **変更モデルのみ**を選択 |', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-311', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-8', 'DAG上の障害トラブルシュート手順として、以下を正しい順序に並べよ。
ステップ:
- (a) 上流モデルのデータを確認
- (b) `target/compiled/` でコンパイル済みSQLを確認
- (c) 修正して `dbt run --select failed_model` で再実行
- (d) エラーログで失敗したモデルを特定
- (e) コンパイル済みSQLをDWHに直接貼り付けて実行
- (f) 必要に応じて `dbt retry` で残りの失敗分を再実行', '**正解: d → b → e → a → c → f**
1. **(d)** エラーログで**失敗したモデルを特定**
2. **(b)** `target/compiled/` で**コンパイル済みSQLを確認**
3. **(e)** コンパイル済みSQLを**DWHに直接貼り付けて実行**（SQL問題かdbt問題か切り分け）
4. **(a)** **上流モデルのデータを確認**
5. **(c)** 修正して `dbt run --select failed_model` で**再実行**
6. **(f)** 必要に応じて `dbt retry` で**残りの失敗分を再実行**', 'https://docs.getdbt.com/reference/commands/retry');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-311-opt-0', 'card-dbt-ae-311', 0, 'a', '上流モデルのデータを確認', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-311-opt-1', 'card-dbt-ae-311', 1, 'b', '`target/compiled/` でコンパイル済みSQLを確認', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-311-opt-2', 'card-dbt-ae-311', 2, 'c', '修正して `dbt run --select failed_model` で再実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-311-opt-3', 'card-dbt-ae-311', 3, 'd', 'エラーログで失敗したモデルを特定', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-311-opt-4', 'card-dbt-ae-311', 4, 'e', 'コンパイル済みSQLをDWHに直接貼り付けて実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-311-opt-5', 'card-dbt-ae-311', 5, 'f', '必要に応じて `dbt retry` で残りの失敗分を再実行', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-311-ans-0', 'card-dbt-ae-311', 'card-dbt-ae-311-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-311-ans-1', 'card-dbt-ae-311', 'card-dbt-ae-311-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-311-ans-2', 'card-dbt-ae-311', 'card-dbt-ae-311-opt-4', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-311-ans-3', 'card-dbt-ae-311', 'card-dbt-ae-311-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-311-ans-4', 'card-dbt-ae-311', 'card-dbt-ae-311-opt-2', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-311-ans-5', 'card-dbt-ae-311', 'card-dbt-ae-311-opt-5', NULL, 5);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-312', 'deck-dbt-ae', 'ordering', 'topic-dbt-ae-8', 'CI/CD で state セレクターを活用したデプロイ手順として、以下を正しい順序に並べよ。
ステップ:
- (a) テスト通過後にマージ・デプロイ
- (b) PRブランチで `dbt run --select state:modified+` を実行
- (c) `--defer` フラグで未ビルドの上流を本番テーブルで代替
- (d) 本番環境の `manifest.json` をアーティファクトとして保存
- (e) 変更されたモデルとその下流のみをテスト', '**正解: d → b → c → e → a**
1. **(d)** 本番環境の **`manifest.json` をアーティファクトとして保存**
2. **(b)** PRブランチで `dbt run --select state:modified+ --state ./prod-artifacts` を実行
3. **(c)** `--defer` フラグで**未ビルドの上流を本番テーブルで代替**
4. **(e)** **変更されたモデルとその下流のみ**をテスト
5. **(a)** テスト通過後に**マージ・デプロイ**', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-312-opt-0', 'card-dbt-ae-312', 0, 'a', 'テスト通過後にマージ・デプロイ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-312-opt-1', 'card-dbt-ae-312', 1, 'b', 'PRブランチで `dbt run --select state:modified+` を実行', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-312-opt-2', 'card-dbt-ae-312', 2, 'c', '`--defer` フラグで未ビルドの上流を本番テーブルで代替', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-312-opt-3', 'card-dbt-ae-312', 3, 'd', '本番環境の `manifest.json` をアーティファクトとして保存', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-312-opt-4', 'card-dbt-ae-312', 4, 'e', '変更されたモデルとその下流のみをテスト', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-312-ans-0', 'card-dbt-ae-312', 'card-dbt-ae-312-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-312-ans-1', 'card-dbt-ae-312', 'card-dbt-ae-312-opt-1', NULL, 1);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-312-ans-2', 'card-dbt-ae-312', 'card-dbt-ae-312-opt-2', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-312-ans-3', 'card-dbt-ae-312', 'card-dbt-ae-312-opt-4', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-312-ans-4', 'card-dbt-ae-312', 'card-dbt-ae-312-opt-0', NULL, 4);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-313', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '`state:modified` と `state:new` の違いとして正しいものは？
- A. `modified` は既存リソースの変更を検知、`new` は新規追加のみ対象
- B. `modified` はSQL変更のみ検知、`new` はYAML変更のみ検知
- C. `modified` はモデルのみ対象、`new` は全リソース対象
- D. `modified` と `new` は同じ意味のエイリアス', '- **`state:modified`** — 前回のstate以降に変更されたリソース（SQL、YAML設定、マクロの変更を含む）
- **`state:new`** — 前回のstateに存在しなかった新規リソース
`state:modified` は既存リソースの変更を検知し、`state:new` は新規追加のみを対象とする。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-313-opt-0', 'card-dbt-ae-313', 0, 'A', '`modified` は既存リソースの変更を検知、`new` は新規追加のみ対象', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-313-opt-1', 'card-dbt-ae-313', 1, 'B', '`modified` はSQL変更のみ検知、`new` はYAML変更のみ検知', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-313-opt-2', 'card-dbt-ae-313', 2, 'C', '`modified` はモデルのみ対象、`new` は全リソース対象', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-313-opt-3', 'card-dbt-ae-313', 3, 'D', '`modified` と `new` は同じ意味のエイリアス', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-314', 'deck-dbt-ae', 'multi_select', 'topic-dbt-ae-8', '`state:modified` が検出する変更の種類を**3つ**選べ。
- A. SQL本文の変更
- B. config の変更
- C. DWH上のデータの変更
- D. マクロの変更
- E. DWHのスキーマ変更', '**正解: A, B, D**
SQL本文、config、マクロ、contract、スキーマYAMLの変更を検出する。DWH上のデータやスキーマの実際の変更は検出しない（dbtプロジェクトファイルの変更のみ）。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-314-opt-0', 'card-dbt-ae-314', 0, 'A', 'SQL本文の変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-314-opt-1', 'card-dbt-ae-314', 1, 'B', 'config の変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-314-opt-2', 'card-dbt-ae-314', 2, 'C', 'DWH上のデータの変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-314-opt-3', 'card-dbt-ae-314', 3, 'D', 'マクロの変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-314-opt-4', 'card-dbt-ae-314', 4, 'E', 'DWHのスキーマ変更', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-314-ans-0', 'card-dbt-ae-314', 'card-dbt-ae-314-opt-0', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-314-ans-1', 'card-dbt-ae-314', 'card-dbt-ae-314-opt-1', NULL, NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-314-ans-2', 'card-dbt-ae-314', 'card-dbt-ae-314-opt-3', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-315', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '`result:error` と `result:fail` の違いとして正しいものは？
- A. `error` はランタイムエラー（SQL実行エラー等）、`fail` はテスト失敗
- B. `error` はテスト失敗、`fail` はランタイムエラー
- C. `error` は致命的エラー、`fail` は警告レベル
- D. `error` と `fail` は同じ意味', '- **`result:error`** — 前回の実行でランタイムエラーが発生したノード（SQL実行エラー等）
- **`result:fail`** — 前回の実行でテストが失敗したノード
例: `dbt test --select result:fail --state ./target` で前回失敗したテストのみを再実行。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-315-opt-0', 'card-dbt-ae-315', 0, 'A', '`error` はランタイムエラー（SQL実行エラー等）、`fail` はテスト失敗', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-315-opt-1', 'card-dbt-ae-315', 1, 'B', '`error` はテスト失敗、`fail` はランタイムエラー', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-315-opt-2', 'card-dbt-ae-315', 2, 'C', '`error` は致命的エラー、`fail` は警告レベル', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-315-opt-3', 'card-dbt-ae-315', 3, 'D', '`error` と `fail` は同じ意味', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-316', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '`dbt retry` が参照するファイルは `____` である。
- A. `run_results.json`
- B. `manifest.json`
- C. `catalog.json`
- D. `sources.json`', '**正解: `run_results.json`**
前回の実行結果から error / skipped のステータスのリソースを特定して再実行する。', 'https://docs.getdbt.com/reference/commands/retry');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-316-opt-0', 'card-dbt-ae-316', 0, 'A', '`run_results.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-316-opt-1', 'card-dbt-ae-316', 1, 'B', '`manifest.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-316-opt-2', 'card-dbt-ae-316', 2, 'C', '`catalog.json`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-316-opt-3', 'card-dbt-ae-316', 3, 'D', '`sources.json`', NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-317', 'deck-dbt-ae', 'matching', 'topic-dbt-ae-8', '各 state/result セレクター（左列）を、その選択対象（右列）と正しく対応させよ。
| 左列 | 右列 |
|---|---|
| 1. `state:modified` | a. 前回の実行でテストが失敗したもの |
| 2. `state:modified+` | b. 前回の実行で警告だったもの |
| 3. `result:error` | c. 変更されたリソースとその下流すべて |
| 4. `result:fail` | d. 前回のstateから変更されたリソース |
| 5. `result:warn` | e. 前回の実行でエラーになったモデル |', '**1-d, 2-c, 3-e, 4-a, 5-b**
| セレクター | 選択対象 |
|---|---|
| `state:modified` → d | 前回のstateから**変更されたリソース** |
| `state:modified+` → c | 変更されたリソースと**その下流すべて** |
| `result:error` → e | 前回の実行で**エラーになったモデル** |
| `result:fail` → a | 前回の実行で**テストが失敗**したもの |
| `result:warn` → b | 前回の実行で**警告**だったもの |', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-0', 'card-dbt-ae-317', 0, '1', 'state:modified', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-1', 'card-dbt-ae-317', 1, '2', 'state:modified+', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-2', 'card-dbt-ae-317', 2, '3', 'result:error', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-3', 'card-dbt-ae-317', 3, '4', 'result:fail', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-4', 'card-dbt-ae-317', 4, '5', 'result:warn', 'left');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-5', 'card-dbt-ae-317', 5, 'a', '前回の実行でテストが失敗したもの', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-6', 'card-dbt-ae-317', 6, 'b', '前回の実行で警告だったもの', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-7', 'card-dbt-ae-317', 7, 'c', '変更されたリソースとその下流すべて', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-8', 'card-dbt-ae-317', 8, 'd', '前回のstateから変更されたリソース', 'right');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-317-opt-9', 'card-dbt-ae-317', 9, 'e', '前回の実行でエラーになったモデル', 'right');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-317-ans-0', 'card-dbt-ae-317', 'card-dbt-ae-317-opt-0', NULL, 3);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-317-ans-1', 'card-dbt-ae-317', 'card-dbt-ae-317-opt-1', NULL, 2);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-317-ans-2', 'card-dbt-ae-317', 'card-dbt-ae-317-opt-2', NULL, 4);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-317-ans-3', 'card-dbt-ae-317', 'card-dbt-ae-317-opt-3', NULL, 0);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-317-ans-4', 'card-dbt-ae-317', 'card-dbt-ae-317-opt-4', NULL, 1);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-318', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '以下のCIコマンドで `--state` フラグ使用時にエラーになる原因は？
```bash
dbt run --select state:modified
```', '**`--state` フラグでアーティファクトのパスが指定されていない**。
修正: `dbt run --select state:modified --state ./prod-artifacts`
state セレクターを使うには、前回のstate（manifest.json）の場所を `--state` で指定する必要がある。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-319', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '`dbt retry` と `dbt run --select result:error+` の違いは？
- A. 同じ動作をする
- B. `retry` は前回の全コマンドの失敗を再実行、`result:error+` はモデルの失敗とその下流
- C. `retry` はテストも含む、`result:error+` はモデルのみ
- D. `retry` のほうが高速', '**正解: B**
`dbt retry` は前回実行したコマンド（run, test, build等）のerror/skippedリソースを再実行する。`result:error+` はエラーモデルとその下流を選択（テスト含まず）。', 'https://docs.getdbt.com/reference/node-selection/methods#the-result-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-319-opt-0', 'card-dbt-ae-319', 0, 'A', '同じ動作をする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-319-opt-1', 'card-dbt-ae-319', 1, 'B', '`retry` は前回の全コマンドの失敗を再実行、`result:error+` はモデルの失敗とその下流', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-319-opt-2', 'card-dbt-ae-319', 2, 'C', '`retry` はテストも含む、`result:error+` はモデルのみ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-319-opt-3', 'card-dbt-ae-319', 3, 'D', '`retry` のほうが高速', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-319-ans-0', 'card-dbt-ae-319', 'card-dbt-ae-319-opt-1', NULL, NULL);

INSERT OR IGNORE INTO cards (id, deck_id, type, topic_id, question, explanation, source_url) VALUES ('card-dbt-ae-320', 'deck-dbt-ae', 'single_select', 'topic-dbt-ae-8', '`state:modified` セレクターが検出する変更に含まれ**ない**ものは？
- A. SQL本文の変更
- B. configの変更
- C. DWH上のデータの変更
- D. マクロの変更', '**正解: C**
`state:modified` はSQL本文、config、マクロ、contract、スキーマYAMLの変更を検出するが、**DWH上のデータの変更は検出しない**。', 'https://docs.getdbt.com/reference/node-selection/methods#the-state-method');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-320-opt-0', 'card-dbt-ae-320', 0, 'A', 'SQL本文の変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-320-opt-1', 'card-dbt-ae-320', 1, 'B', 'configの変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-320-opt-2', 'card-dbt-ae-320', 2, 'C', 'DWH上のデータの変更', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-320-opt-3', 'card-dbt-ae-320', 3, 'D', 'マクロの変更', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-320-ans-0', 'card-dbt-ae-320', 'card-dbt-ae-320-opt-2', NULL, NULL);

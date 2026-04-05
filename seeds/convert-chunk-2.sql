-- convert-chunk-2: free_recall → single_select / multi_select (18 cards)

-- card-dbt-ae-211
UPDATE cards SET type = 'single_select', question = '以下の YAML でエラーが発生する原因は？
```yaml
models:
  - name: dim_customers
    columns:
    - name: customer_id
      data_tests:
        - unique
        - not_null
```
- A. `columns` の子要素にインデントが不足している
- B. `data_tests` は `tests` と書くべき
- C. `unique` と `not_null` は同時に使えない
- D. `models` のリストにハイフンが不要' WHERE id = 'card-dbt-ae-211';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-211-opt-0', 'card-dbt-ae-211', 0, 'A', '`columns` の子要素にインデントが不足している');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-211-opt-1', 'card-dbt-ae-211', 1, 'B', '`data_tests` は `tests` と書くべき');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-211-opt-2', 'card-dbt-ae-211', 2, 'C', '`unique` と `not_null` は同時に使えない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-211-opt-3', 'card-dbt-ae-211', 3, 'D', '`models` のリストにハイフンが不要');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-211-ans-0', 'card-dbt-ae-211', 'card-dbt-ae-211-opt-0');

-- card-dbt-ae-213
UPDATE cards SET type = 'single_select', question = '以下のテスト設定で `accepted_values` テストが警告のみで失敗しない理由は？
```yaml
columns:
  - name: status
    data_tests:
      - accepted_values:
          values: [''active'', ''inactive'']
          config:
            severity: warn
```
- A. `severity: warn` が設定されているため
- B. `accepted_values` はデフォルトで警告のみ出す
- C. `config` ブロック内の設定は無視される
- D. `values` リストが不完全なため' WHERE id = 'card-dbt-ae-213';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-213-opt-0', 'card-dbt-ae-213', 0, 'A', '`severity: warn` が設定されているため');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-213-opt-1', 'card-dbt-ae-213', 1, 'B', '`accepted_values` はデフォルトで警告のみ出す');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-213-opt-2', 'card-dbt-ae-213', 2, 'C', '`config` ブロック内の設定は無視される');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-213-opt-3', 'card-dbt-ae-213', 3, 'D', '`values` リストが不完全なため');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-213-ans-0', 'card-dbt-ae-213', 'card-dbt-ae-213-opt-0');

-- card-dbt-ae-214
UPDATE cards SET type = 'single_select', question = '以下の singular test で問題となる箇所は？
```sql
-- tests/check_valid_orders.sql
select count(*)
from {{ ref(''fct_orders'') }}
where total_amount < 0
```
- A. `select count(*)` を使っており、失敗レコード自体を返していない
- B. `where` 句の条件が逆になっている
- C. `ref()` の引数が間違っている
- D. singular test では `from` 句は使えない' WHERE id = 'card-dbt-ae-214';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-214-opt-0', 'card-dbt-ae-214', 0, 'A', '`select count(*)` を使っており、失敗レコード自体を返していない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-214-opt-1', 'card-dbt-ae-214', 1, 'B', '`where` 句の条件が逆になっている');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-214-opt-2', 'card-dbt-ae-214', 2, 'C', '`ref()` の引数が間違っている');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-214-opt-3', 'card-dbt-ae-214', 3, 'D', 'singular test では `from` 句は使えない');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-214-ans-0', 'card-dbt-ae-214', 'card-dbt-ae-214-opt-0');

-- card-dbt-ae-218
UPDATE cards SET type = 'single_select', question = '以下のカスタム generic test の問題点は？
```sql
{% test positive_values(model, column_name) %}
select {{ column_name }}
from {{ model }}
where {{ column_name }} >= 0
{% endtest %}
```
- A. WHERE条件が逆で、正常なレコードを返している
- B. `{% test %}` ではなく `{% macro %}` を使うべき
- C. `column_name` の参照方法が間違っている
- D. `select *` を使うべき' WHERE id = 'card-dbt-ae-218';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-218-opt-0', 'card-dbt-ae-218', 0, 'A', 'WHERE条件が逆で、正常なレコードを返している');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-218-opt-1', 'card-dbt-ae-218', 1, 'B', '`{% test %}` ではなく `{% macro %}` を使うべき');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-218-opt-2', 'card-dbt-ae-218', 2, 'C', '`column_name` の参照方法が間違っている');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-218-opt-3', 'card-dbt-ae-218', 3, 'D', '`select *` を使うべき');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-218-ans-0', 'card-dbt-ae-218', 'card-dbt-ae-218-opt-0');

-- card-dbt-ae-238
UPDATE cards SET type = 'single_select', question = '以下のテスト設定で、`store_failures_as` の効果は？
```yaml
data_tests:
  - unique:
      config:
        store_failures_as: view
```
- A. テスト失敗した行をビューとしてDWHに保存する
- B. テスト結果をJSONファイルとして保存する
- C. テスト失敗時にビューを削除する
- D. テスト結果をログファイルに出力する' WHERE id = 'card-dbt-ae-238';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-238-opt-0', 'card-dbt-ae-238', 0, 'A', 'テスト失敗した行をビューとしてDWHに保存する');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-238-opt-1', 'card-dbt-ae-238', 1, 'B', 'テスト結果をJSONファイルとして保存する');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-238-opt-2', 'card-dbt-ae-238', 2, 'C', 'テスト失敗時にビューを削除する');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-238-opt-3', 'card-dbt-ae-238', 3, 'D', 'テスト結果をログファイルに出力する');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-238-ans-0', 'card-dbt-ae-238', 'card-dbt-ae-238-opt-0');

-- card-dbt-ae-256
UPDATE cards SET type = 'single_select', question = '以下のテスト定義で意図通りに動作しない箇所は？（dbt v1.8+）
```yaml
models:
  - name: fct_orders
    columns:
      - name: status
        tests:
          - accepted_values:
              values: [''placed'', ''shipped'']
```
- A. `tests:` ではなく `data_tests:` を使うべき
- B. `accepted_values` のインデントが間違っている
- C. `values` はカンマ区切りの文字列で指定すべき
- D. `columns` の直下に `tests` は定義できない' WHERE id = 'card-dbt-ae-256';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-256-opt-0', 'card-dbt-ae-256', 0, 'A', '`tests:` ではなく `data_tests:` を使うべき');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-256-opt-1', 'card-dbt-ae-256', 1, 'B', '`accepted_values` のインデントが間違っている');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-256-opt-2', 'card-dbt-ae-256', 2, 'C', '`values` はカンマ区切りの文字列で指定すべき');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-256-opt-3', 'card-dbt-ae-256', 3, 'D', '`columns` の直下に `tests` は定義できない');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-256-ans-0', 'card-dbt-ae-256', 'card-dbt-ae-256-opt-0');

-- card-dbt-ae-259
UPDATE cards SET type = 'single_select', question = '以下の YAML で YAMLアンカーを使っている目的は？
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
```
- A. 共通設定を再利用してDRY原則を適用するため
- B. テストの実行順序を制御するため
- C. YAMLファイルの読み込み速度を向上させるため
- D. カラム間の依存関係を定義するため' WHERE id = 'card-dbt-ae-259';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-259-opt-0', 'card-dbt-ae-259', 0, 'A', '共通設定を再利用してDRY原則を適用するため');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-259-opt-1', 'card-dbt-ae-259', 1, 'B', 'テストの実行順序を制御するため');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-259-opt-2', 'card-dbt-ae-259', 2, 'C', 'YAMLファイルの読み込み速度を向上させるため');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-259-opt-3', 'card-dbt-ae-259', 3, 'D', 'カラム間の依存関係を定義するため');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-259-ans-0', 'card-dbt-ae-259', 'card-dbt-ae-259-opt-0');

-- card-dbt-ae-266
UPDATE cards SET type = 'single_select', question = '以下の YAML でパースエラーが発生する原因は？
```yaml
models:
  - name: fct_orders
    description: This model contains: order data
    columns:
      - name: order_id
```
- A. `description` の値にコロン `:` が含まれておりクォートが必要
- B. `columns` のインデントが間違っている
- C. `name` が重複している
- D. `description` はモデルレベルでは使用できない' WHERE id = 'card-dbt-ae-266';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-266-opt-0', 'card-dbt-ae-266', 0, 'A', '`description` の値にコロン `:` が含まれておりクォートが必要');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-266-opt-1', 'card-dbt-ae-266', 1, 'B', '`columns` のインデントが間違っている');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-266-opt-2', 'card-dbt-ae-266', 2, 'C', '`name` が重複している');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-266-opt-3', 'card-dbt-ae-266', 3, 'D', '`description` はモデルレベルでは使用できない');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-266-ans-0', 'card-dbt-ae-266', 'card-dbt-ae-266-opt-0');

-- card-dbt-ae-267
UPDATE cards SET type = 'single_select', question = '以下のYAMLのコンパイルエラーの原因は？
```yaml
models:
  - name: dim_customers
    description:顧客のディメンションテーブル
    columns:
      - name: customer_id
```
- A. `description:` の後にスペースがない
- B. `description` の値に日本語が使えない
- C. `columns` の前に空行が必要
- D. `name` と `description` の順序が逆' WHERE id = 'card-dbt-ae-267';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-267-opt-0', 'card-dbt-ae-267', 0, 'A', '`description:` の後にスペースがない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-267-opt-1', 'card-dbt-ae-267', 1, 'B', '`description` の値に日本語が使えない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-267-opt-2', 'card-dbt-ae-267', 2, 'C', '`columns` の前に空行が必要');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-267-opt-3', 'card-dbt-ae-267', 3, 'D', '`name` と `description` の順序が逆');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-267-ans-0', 'card-dbt-ae-267', 'card-dbt-ae-267-opt-0');

-- card-dbt-ae-273
UPDATE cards SET type = 'multi_select', question = '以下の `{% docs %}` ブロックの構文エラーはどれか？（該当するものをすべて選択）
```markdown
{% docs orders_status }
Orders can be: placed, shipped, completed, returned.
{% enddoc %}
```
- A. 開始タグで `%` が欠けている（`}` → `%}`）
- B. 終了タグで `s` が欠けている（`enddoc` → `enddocs`）
- C. `docs` ブロック名にアンダースコアは使えない
- D. description の中にコロンが含まれている' WHERE id = 'card-dbt-ae-273';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-273-opt-0', 'card-dbt-ae-273', 0, 'A', '開始タグで `%` が欠けている（`}` → `%}`）');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-273-opt-1', 'card-dbt-ae-273', 1, 'B', '終了タグで `s` が欠けている（`enddoc` → `enddocs`）');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-273-opt-2', 'card-dbt-ae-273', 2, 'C', '`docs` ブロック名にアンダースコアは使えない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-273-opt-3', 'card-dbt-ae-273', 3, 'D', 'description の中にコロンが含まれている');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-273-ans-0', 'card-dbt-ae-273', 'card-dbt-ae-273-opt-0');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-273-ans-1', 'card-dbt-ae-273', 'card-dbt-ae-273-opt-1');

-- card-dbt-ae-274
UPDATE cards SET type = 'multi_select', question = '以下の YAML で `description` に `{{ doc() }}` を使う利点は？（該当するものをすべて選択）
```yaml
models:
  - name: fct_orders
    columns:
      - name: status
        description: ''{{ doc("orders_status") }}''
```
- A. 長い説明文をYAMLから分離でき、可読性が向上する
- B. 同じ説明を複数箇所で再利用できる（DRY原則）
- C. テスト結果が自動的にドキュメントに反映される
- D. YAMLのバリデーションが不要になる' WHERE id = 'card-dbt-ae-274';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-274-opt-0', 'card-dbt-ae-274', 0, 'A', '長い説明文をYAMLから分離でき、可読性が向上する');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-274-opt-1', 'card-dbt-ae-274', 1, 'B', '同じ説明を複数箇所で再利用できる（DRY原則）');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-274-opt-2', 'card-dbt-ae-274', 2, 'C', 'テスト結果が自動的にドキュメントに反映される');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-274-opt-3', 'card-dbt-ae-274', 3, 'D', 'YAMLのバリデーションが不要になる');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-274-ans-0', 'card-dbt-ae-274', 'card-dbt-ae-274-opt-0');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-274-ans-1', 'card-dbt-ae-274', 'card-dbt-ae-274-opt-1');

-- card-dbt-ae-276
UPDATE cards SET type = 'single_select', question = '各 dbt アーティファクトと生成タイミングの対応として正しいものは？
| アーティファクト | 生成タイミング |
|---|---|
| `manifest.json` | ? |
| `run_results.json` | ? |
| `catalog.json` | ? |
- A. manifest=ほぼ全コマンド、run_results=実行完了時、catalog=docs generate時
- B. manifest=docs generate時、run_results=実行完了時、catalog=ほぼ全コマンド
- C. manifest=実行完了時、run_results=ほぼ全コマンド、catalog=docs generate時
- D. manifest=ほぼ全コマンド、run_results=docs generate時、catalog=実行完了時' WHERE id = 'card-dbt-ae-276';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-276-opt-0', 'card-dbt-ae-276', 0, 'A', 'manifest=ほぼ全コマンド、run_results=実行完了時、catalog=docs generate時');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-276-opt-1', 'card-dbt-ae-276', 1, 'B', 'manifest=docs generate時、run_results=実行完了時、catalog=ほぼ全コマンド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-276-opt-2', 'card-dbt-ae-276', 2, 'C', 'manifest=実行完了時、run_results=ほぼ全コマンド、catalog=docs generate時');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-276-opt-3', 'card-dbt-ae-276', 3, 'D', 'manifest=ほぼ全コマンド、run_results=docs generate時、catalog=実行完了時');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-276-ans-0', 'card-dbt-ae-276', 'card-dbt-ae-276-opt-0');

-- card-dbt-ae-290
UPDATE cards SET type = 'single_select', question = '以下の exposure 定義で不足している必須項目は？
```yaml
exposures:
  - name: weekly_sales_dashboard
    type: dashboard
    depends_on:
      - ref(''fct_orders'')
```
- A. `owner` フィールド
- B. `description` フィールド
- C. `maturity` フィールド
- D. `url` フィールド' WHERE id = 'card-dbt-ae-290';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-290-opt-0', 'card-dbt-ae-290', 0, 'A', '`owner` フィールド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-290-opt-1', 'card-dbt-ae-290', 1, 'B', '`description` フィールド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-290-opt-2', 'card-dbt-ae-290', 2, 'C', '`maturity` フィールド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-290-opt-3', 'card-dbt-ae-290', 3, 'D', '`url` フィールド');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-290-ans-0', 'card-dbt-ae-290', 'card-dbt-ae-290-opt-0');

-- card-dbt-ae-292
UPDATE cards SET type = 'single_select', question = '以下の source freshness 設定でエラーになる原因は？
```yaml
sources:
  - name: jaffle_shop
    freshness:
      warn_after: { count: 12, period: hour }
      error_after: { count: 24, period: hour }
    tables:
      - name: orders
```
- A. `loaded_at_field` が未設定
- B. `freshness` はテーブルレベルでしか設定できない
- C. `period: hour` は `period: hours` と複数形にすべき
- D. `warn_after` と `error_after` の値が不正' WHERE id = 'card-dbt-ae-292';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-292-opt-0', 'card-dbt-ae-292', 0, 'A', '`loaded_at_field` が未設定');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-292-opt-1', 'card-dbt-ae-292', 1, 'B', '`freshness` はテーブルレベルでしか設定できない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-292-opt-2', 'card-dbt-ae-292', 2, 'C', '`period: hour` は `period: hours` と複数形にすべき');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-292-opt-3', 'card-dbt-ae-292', 3, 'D', '`warn_after` と `error_after` の値が不正');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-292-ans-0', 'card-dbt-ae-292', 'card-dbt-ae-292-opt-0');

-- card-dbt-ae-294
UPDATE cards SET type = 'single_select', question = '以下の exposure 定義で `depends_on` はどのような依存関係を宣言しているか？
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
```
- A. `ref()` でモデルへの依存を宣言。ソースへの依存は `source()` を使う
- B. `ref()` でソースとモデル両方の依存を宣言できる
- C. `depends_on` はDAG上では反映されない
- D. `ref()` の代わりに直接テーブル名を記述すべき' WHERE id = 'card-dbt-ae-294';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-294-opt-0', 'card-dbt-ae-294', 0, 'A', '`ref()` でモデルへの依存を宣言。ソースへの依存は `source()` を使う');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-294-opt-1', 'card-dbt-ae-294', 1, 'B', '`ref()` でソースとモデル両方の依存を宣言できる');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-294-opt-2', 'card-dbt-ae-294', 2, 'C', '`depends_on` はDAG上では反映されない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-294-opt-3', 'card-dbt-ae-294', 3, 'D', '`ref()` の代わりに直接テーブル名を記述すべき');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-294-ans-0', 'card-dbt-ae-294', 'card-dbt-ae-294-opt-0');

-- card-dbt-ae-303
UPDATE cards SET type = 'single_select', question = '以下の exposure 定義に不足している必須フィールドは？
```yaml
exposures:
  - name: weekly_report
    type: dashboard
    depends_on:
      - ref(''fct_orders'')
```
- A. `owner` フィールド
- B. `label` フィールド
- C. `tags` フィールド
- D. `meta` フィールド' WHERE id = 'card-dbt-ae-303';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-303-opt-0', 'card-dbt-ae-303', 0, 'A', '`owner` フィールド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-303-opt-1', 'card-dbt-ae-303', 1, 'B', '`label` フィールド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-303-opt-2', 'card-dbt-ae-303', 2, 'C', '`tags` フィールド');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-303-opt-3', 'card-dbt-ae-303', 3, 'D', '`meta` フィールド');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-303-ans-0', 'card-dbt-ae-303', 'card-dbt-ae-303-opt-0');

-- card-dbt-ae-310
UPDATE cards SET type = 'single_select', question = '`dbt run --defer --state ./prod-artifacts --select state:modified` の各フラグの対応として正しいものは？
| フラグ | 役割 |
|---|---|
| `--defer` | ? |
| `--state ./prod-artifacts` | ? |
| `--select state:modified` | ? |
- A. defer=本番テーブル代替、state=パス指定、state:modified=変更モデル選択
- B. defer=変更モデル選択、state=本番テーブル代替、state:modified=パス指定
- C. defer=パス指定、state=変更モデル選択、state:modified=本番テーブル代替
- D. defer=全モデル実行、state=キャッシュ利用、state:modified=差分ビルド' WHERE id = 'card-dbt-ae-310';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-310-opt-0', 'card-dbt-ae-310', 0, 'A', 'defer=本番テーブル代替、state=パス指定、state:modified=変更モデル選択');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-310-opt-1', 'card-dbt-ae-310', 1, 'B', 'defer=変更モデル選択、state=本番テーブル代替、state:modified=パス指定');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-310-opt-2', 'card-dbt-ae-310', 2, 'C', 'defer=パス指定、state=変更モデル選択、state:modified=本番テーブル代替');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-310-opt-3', 'card-dbt-ae-310', 3, 'D', 'defer=全モデル実行、state=キャッシュ利用、state:modified=差分ビルド');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-310-ans-0', 'card-dbt-ae-310', 'card-dbt-ae-310-opt-0');

-- card-dbt-ae-318
UPDATE cards SET type = 'single_select', question = '以下のCIコマンドで `--state` フラグ使用時にエラーになる原因は？
```bash
dbt run --select state:modified
```
- A. `--state` フラグでアーティファクトのパスが指定されていない
- B. `state:modified` は `dbt test` でのみ使用可能
- C. `--select` と `state:` は併用できない
- D. `dbt run` では state セレクターは使えない' WHERE id = 'card-dbt-ae-318';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-318-opt-0', 'card-dbt-ae-318', 0, 'A', '`--state` フラグでアーティファクトのパスが指定されていない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-318-opt-1', 'card-dbt-ae-318', 1, 'B', '`state:modified` は `dbt test` でのみ使用可能');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-318-opt-2', 'card-dbt-ae-318', 2, 'C', '`--select` と `state:` は併用できない');
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body) VALUES ('card-dbt-ae-318-opt-3', 'card-dbt-ae-318', 3, 'D', '`dbt run` では state セレクターは使えない');
INSERT OR IGNORE INTO card_answers (id, card_id, option_id) VALUES ('card-dbt-ae-318-ans-0', 'card-dbt-ae-318', 'card-dbt-ae-318-opt-0');

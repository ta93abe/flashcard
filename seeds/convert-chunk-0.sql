-- convert-chunk-0: free_recall → single_select / multi_select (18問)

-- card-dbt-ae-002
UPDATE cards SET type = 'single_select', question = '以下の source 定義で `identifier` を指定した場合、`{{ source(''stripe'', ''payments'') }}` はどのテーブルを参照するか？
```yaml
sources:
  - name: stripe
    tables:
      - name: payments
        identifier: stripe_payments_raw
```
- A. `stripe.payments`
- B. `stripe.stripe_payments_raw`
- C. `payments`
- D. `stripe_payments_raw`' WHERE id = 'card-dbt-ae-002';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-002-opt-0', 'card-dbt-ae-002', 0, 'A', '`stripe.payments`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-002-opt-1', 'card-dbt-ae-002', 1, 'B', '`stripe.stripe_payments_raw`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-002-opt-2', 'card-dbt-ae-002', 2, 'C', '`payments`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-002-opt-3', 'card-dbt-ae-002', 3, 'D', '`stripe_payments_raw`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-002-ans-0', 'card-dbt-ae-002', 'card-dbt-ae-002-opt-1', NULL, NULL);

-- card-dbt-ae-004
UPDATE cards SET type = 'single_select', question = '以下の Jinja for ループの問題点は何か？
```sql
select
{% for col in [''id'', ''name'', ''email''] %}
  {{ col }},
{% endfor %}
from {{ ref(''stg_users'') }}
```
- A. `ref()` の引数が間違っている
- B. 最後のカラムの後にもカンマが付き、SQLエラーになる
- C. `for` ループの構文が不正である
- D. カラム名をクォートで囲む必要がある' WHERE id = 'card-dbt-ae-004';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-004-opt-0', 'card-dbt-ae-004', 0, 'A', '`ref()` の引数が間違っている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-004-opt-1', 'card-dbt-ae-004', 1, 'B', '最後のカラムの後にもカンマが付き、SQLエラーになる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-004-opt-2', 'card-dbt-ae-004', 2, 'C', '`for` ループの構文が不正である', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-004-opt-3', 'card-dbt-ae-004', 3, 'D', 'カラム名をクォートで囲む必要がある', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-004-ans-0', 'card-dbt-ae-004', 'card-dbt-ae-004-opt-1', NULL, NULL);

-- card-dbt-ae-012
UPDATE cards SET type = 'single_select', question = '以下の seed 設定の目的は何か？
```yaml
seeds:
  my_project:
    country_codes:
      +column_types:
        country_code: varchar(3)
```
- A. カラムにNOT NULL制約を追加する
- B. 先頭ゼロ等が数値として誤って型推論されるのを防ぐ
- C. カラム名を `country_code` にリネームする
- D. seedデータの文字数を3文字に制限する' WHERE id = 'card-dbt-ae-012';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-012-opt-0', 'card-dbt-ae-012', 0, 'A', 'カラムにNOT NULL制約を追加する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-012-opt-1', 'card-dbt-ae-012', 1, 'B', '先頭ゼロ等が数値として誤って型推論されるのを防ぐ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-012-opt-2', 'card-dbt-ae-012', 2, 'C', 'カラム名を `country_code` にリネームする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-012-opt-3', 'card-dbt-ae-012', 3, 'D', 'seedデータの文字数を3文字に制限する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-012-ans-0', 'card-dbt-ae-012', 'card-dbt-ae-012-opt-1', NULL, NULL);

-- card-dbt-ae-014
UPDATE cards SET type = 'single_select', question = '以下のモデルで `--full-refresh` を実行すると何が起きるか？
```sql
{{ config(materialized=''incremental'', unique_key=''id'') }}
select * from {{ ref(''stg_orders'') }}
{% if is_incremental() %}
where updated_at > (select max(updated_at) from {{ this }})
{% endif %}
```
- A. WHERE句が適用され、差分データのみ処理される
- B. `is_incremental()` が False を返し、全データが再処理される
- C. コンパイルエラーが発生する
- D. 既存テーブルに新しいカラムが追加される' WHERE id = 'card-dbt-ae-014';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-014-opt-0', 'card-dbt-ae-014', 0, 'A', 'WHERE句が適用され、差分データのみ処理される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-014-opt-1', 'card-dbt-ae-014', 1, 'B', '`is_incremental()` が False を返し、全データが再処理される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-014-opt-2', 'card-dbt-ae-014', 2, 'C', 'コンパイルエラーが発生する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-014-opt-3', 'card-dbt-ae-014', 3, 'D', '既存テーブルに新しいカラムが追加される', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-014-ans-0', 'card-dbt-ae-014', 'card-dbt-ae-014-opt-1', NULL, NULL);

-- card-dbt-ae-022
UPDATE cards SET type = 'single_select', question = '以下のJinjaコードで `adapter.get_relation()` は何を行うか？
```sql
{% set rel = adapter.get_relation(
    database=target.database,
    schema=target.schema,
    identifier=''my_table''
) %}
{% if rel is not none %}
  -- テーブルが存在する
{% endif %}
```
- A. DWH上にテーブル/ビューが存在するか確認する
- B. テーブル間のリレーションシップを定義する
- C. 新しいテーブルを作成する
- D. テーブルのスキーマを変更する' WHERE id = 'card-dbt-ae-022';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-022-opt-0', 'card-dbt-ae-022', 0, 'A', 'DWH上にテーブル/ビューが存在するか確認する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-022-opt-1', 'card-dbt-ae-022', 1, 'B', 'テーブル間のリレーションシップを定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-022-opt-2', 'card-dbt-ae-022', 2, 'C', '新しいテーブルを作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-022-opt-3', 'card-dbt-ae-022', 3, 'D', 'テーブルのスキーマを変更する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-022-ans-0', 'card-dbt-ae-022', 'card-dbt-ae-022-opt-0', NULL, NULL);

-- card-dbt-ae-023
UPDATE cards SET type = 'single_select', question = '以下のモデルをCTEを使ってリファクタリングする際の推奨パターンはどれか？
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
```
- A. サブクエリパターン: FROM句にサブクエリをネストする
- B. import CTEパターン: 各ref()をCTEとして冒頭で定義する
- C. ビューパターン: 各ref()を個別のビューとして分離する
- D. UNION ALLパターン: 各テーブルをUNIONで結合する' WHERE id = 'card-dbt-ae-023';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-023-opt-0', 'card-dbt-ae-023', 0, 'A', 'サブクエリパターン: FROM句にサブクエリをネストする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-023-opt-1', 'card-dbt-ae-023', 1, 'B', 'import CTEパターン: 各ref()をCTEとして冒頭で定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-023-opt-2', 'card-dbt-ae-023', 2, 'C', 'ビューパターン: 各ref()を個別のビューとして分離する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-023-opt-3', 'card-dbt-ae-023', 3, 'D', 'UNION ALLパターン: 各テーブルをUNIONで結合する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-023-ans-0', 'card-dbt-ae-023', 'card-dbt-ae-023-opt-1', NULL, NULL);

-- card-dbt-ae-035
UPDATE cards SET type = 'single_select', question = '以下の `dbt_project.yml` 設定で、`models/staging/` のモデルが view、`models/marts/` が table になる理由は何か？
```yaml
models:
  my_project:
    staging:
      +materialized: view
    marts:
      +materialized: table
```
- A. モデルファイル内の `config()` で個別に指定されている
- B. フォルダごとにデフォルト materialization を指定している
- C. dbtのデフォルト動作でそうなる
- D. `profiles.yml` のターゲット設定に依存する' WHERE id = 'card-dbt-ae-035';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-035-opt-0', 'card-dbt-ae-035', 0, 'A', 'モデルファイル内の `config()` で個別に指定されている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-035-opt-1', 'card-dbt-ae-035', 1, 'B', 'フォルダごとにデフォルト materialization を指定している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-035-opt-2', 'card-dbt-ae-035', 2, 'C', 'dbtのデフォルト動作でそうなる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-035-opt-3', 'card-dbt-ae-035', 3, 'D', '`profiles.yml` のターゲット設定に依存する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-035-ans-0', 'card-dbt-ae-035', 'card-dbt-ae-035-opt-1', NULL, NULL);

-- card-dbt-ae-039
UPDATE cards SET type = 'single_select', question = 'dbt リソースの設定優先順位（低い順 → 高い順）として正しいものはどれか？
- A. `dbt_project.yml` → YAMLプロパティ → `config()` → コマンドラインフラグ
- B. コマンドラインフラグ → `config()` → YAMLプロパティ → `dbt_project.yml`
- C. YAMLプロパティ → `dbt_project.yml` → コマンドラインフラグ → `config()`
- D. `config()` → `dbt_project.yml` → YAMLプロパティ → コマンドラインフラグ' WHERE id = 'card-dbt-ae-039';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-039-opt-0', 'card-dbt-ae-039', 0, 'A', '`dbt_project.yml` → YAMLプロパティ → `config()` → コマンドラインフラグ', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-039-opt-1', 'card-dbt-ae-039', 1, 'B', 'コマンドラインフラグ → `config()` → YAMLプロパティ → `dbt_project.yml`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-039-opt-2', 'card-dbt-ae-039', 2, 'C', 'YAMLプロパティ → `dbt_project.yml` → コマンドラインフラグ → `config()`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-039-opt-3', 'card-dbt-ae-039', 3, 'D', '`config()` → `dbt_project.yml` → YAMLプロパティ → コマンドラインフラグ', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-039-ans-0', 'card-dbt-ae-039', 'card-dbt-ae-039-opt-0', NULL, NULL);

-- card-dbt-ae-041
UPDATE cards SET type = 'single_select', question = '以下の `dbt_project.yml` の `dispatch` 設定の効果は何か？
```yaml
dispatch:
  - macro_namespace: dbt_utils
    search_order: [''my_project'', ''dbt_utils'']
```
- A. `dbt_utils` のマクロを無効化する
- B. `dbt_utils` のマクロ呼び出し時にまず `my_project` のオーバーライドを検索する
- C. `my_project` のマクロを `dbt_utils` の名前空間に登録する
- D. マクロの実行順序を `my_project` → `dbt_utils` に固定する' WHERE id = 'card-dbt-ae-041';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-041-opt-0', 'card-dbt-ae-041', 0, 'A', '`dbt_utils` のマクロを無効化する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-041-opt-1', 'card-dbt-ae-041', 1, 'B', '`dbt_utils` のマクロ呼び出し時にまず `my_project` のオーバーライドを検索する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-041-opt-2', 'card-dbt-ae-041', 2, 'C', '`my_project` のマクロを `dbt_utils` の名前空間に登録する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-041-opt-3', 'card-dbt-ae-041', 3, 'D', 'マクロの実行順序を `my_project` → `dbt_utils` に固定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-041-ans-0', 'card-dbt-ae-041', 'card-dbt-ae-041-opt-1', NULL, NULL);

-- card-dbt-ae-042
UPDATE cards SET type = 'single_select', question = '以下の Jinja の `{% if %}` ブロックの問題点は何か？
```sql
{% if target.name = ''prod'' %}
  select * from {{ ref(''fct_orders'') }}
{% endif %}
```
- A. `target.name` はJinjaで参照できない
- B. `=` が代入演算子であり、比較には `==` を使うべき
- C. `{% endif %}` が不足している
- D. `ref()` の引数にシングルクォートを使えない' WHERE id = 'card-dbt-ae-042';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-042-opt-0', 'card-dbt-ae-042', 0, 'A', '`target.name` はJinjaで参照できない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-042-opt-1', 'card-dbt-ae-042', 1, 'B', '`=` が代入演算子であり、比較には `==` を使うべき', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-042-opt-2', 'card-dbt-ae-042', 2, 'C', '`{% endif %}` が不足している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-042-opt-3', 'card-dbt-ae-042', 3, 'D', '`ref()` の引数にシングルクォートを使えない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-042-ans-0', 'card-dbt-ae-042', 'card-dbt-ae-042-opt-1', NULL, NULL);

-- card-dbt-ae-046
UPDATE cards SET type = 'single_select', question = '以下の `generate_schema_name` マクロで、`target.name` が `prod` のときのスキーマ名はどうなるか？
```sql
{% macro generate_schema_name(custom_schema_name, node) %}
    {% if target.name == ''prod'' %}
        {{ custom_schema_name | trim }}
    {% else %}
        {{ target.schema }}_{{ custom_schema_name | trim }}
    {% endif %}
{% endmacro %}
```
- A. `custom_schema_name` がそのまま使われる（例: `analytics`）
- B. `target.schema` + `_` + `custom_schema_name`（例: `dbt_user_analytics`）
- C. `target.schema` がそのまま使われる
- D. スキーマ名が空になる' WHERE id = 'card-dbt-ae-046';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-046-opt-0', 'card-dbt-ae-046', 0, 'A', '`custom_schema_name` がそのまま使われる（例: `analytics`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-046-opt-1', 'card-dbt-ae-046', 1, 'B', '`target.schema` + `_` + `custom_schema_name`（例: `dbt_user_analytics`）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-046-opt-2', 'card-dbt-ae-046', 2, 'C', '`target.schema` がそのまま使われる', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-046-opt-3', 'card-dbt-ae-046', 3, 'D', 'スキーマ名が空になる', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-046-ans-0', 'card-dbt-ae-046', 'card-dbt-ae-046-opt-0', NULL, NULL);

-- card-dbt-ae-048
UPDATE cards SET type = 'single_select', question = '以下の sources.yml の問題点は何か？（すべて `sample_data.public` スキーマ配下）
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
- A. テーブル名が source 名と重複している
- B. 同一スキーマのテーブルを1つの source にまとめるべき
- C. `schema` プロパティが指定されていない
- D. `identifier` を指定する必要がある' WHERE id = 'card-dbt-ae-048';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-048-opt-0', 'card-dbt-ae-048', 0, 'A', 'テーブル名が source 名と重複している', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-048-opt-1', 'card-dbt-ae-048', 1, 'B', '同一スキーマのテーブルを1つの source にまとめるべき', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-048-opt-2', 'card-dbt-ae-048', 2, 'C', '`schema` プロパティが指定されていない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-048-opt-3', 'card-dbt-ae-048', 3, 'D', '`identifier` を指定する必要がある', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-048-ans-0', 'card-dbt-ae-048', 'card-dbt-ae-048-opt-1', NULL, NULL);

-- card-dbt-ae-050
UPDATE cards SET type = 'single_select', question = '以下のモデルで `{{ target.name }}` を使う目的は何か？
```sql
{% if target.name == ''prod'' %}
  select * from {{ ref(''fct_orders'') }}
{% else %}
  select * from {{ ref(''fct_orders'') }} limit 1000
{% endif %}
```
- A. モデルのmaterializationを環境ごとに変更する
- B. 環境ごとに異なるクエリを実行する（本番は全データ、開発はデータ量制限）
- C. テスト環境でのみモデルをスキップする
- D. デプロイ先のスキーマ名を切り替える' WHERE id = 'card-dbt-ae-050';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-050-opt-0', 'card-dbt-ae-050', 0, 'A', 'モデルのmaterializationを環境ごとに変更する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-050-opt-1', 'card-dbt-ae-050', 1, 'B', '環境ごとに異なるクエリを実行する（本番は全データ、開発はデータ量制限）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-050-opt-2', 'card-dbt-ae-050', 2, 'C', 'テスト環境でのみモデルをスキップする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-050-opt-3', 'card-dbt-ae-050', 3, 'D', 'デプロイ先のスキーマ名を切り替える', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-050-ans-0', 'card-dbt-ae-050', 'card-dbt-ae-050-opt-1', NULL, NULL);

-- card-dbt-ae-061
UPDATE cards SET type = 'single_select', question = '以下のコードで `{% do %}` タグの効果は何か？
```sql
{% do log("Processing model: " ~ this, info=True) %}
```
- A. SQLコメントとして出力される
- B. Jinja式を評価するが、SQLには何も出力しない
- C. dbtの実行を一時停止する
- D. 変数に値を代入する' WHERE id = 'card-dbt-ae-061';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-061-opt-0', 'card-dbt-ae-061', 0, 'A', 'SQLコメントとして出力される', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-061-opt-1', 'card-dbt-ae-061', 1, 'B', 'Jinja式を評価するが、SQLには何も出力しない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-061-opt-2', 'card-dbt-ae-061', 2, 'C', 'dbtの実行を一時停止する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-061-opt-3', 'card-dbt-ae-061', 3, 'D', '変数に値を代入する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-061-ans-0', 'card-dbt-ae-061', 'card-dbt-ae-061-opt-1', NULL, NULL);

-- card-dbt-ae-070
UPDATE cards SET type = 'single_select', question = '以下の selector YAML 定義の用途は何か？
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
```
- A. スケジュール実行のcron式を定義する
- B. 名前付きセレクターを定義し、`--selector` で呼び出せるようにする
- C. テストの実行対象を制限する
- D. ソースのfreshness チェック対象を定義する' WHERE id = 'card-dbt-ae-070';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-070-opt-0', 'card-dbt-ae-070', 0, 'A', 'スケジュール実行のcron式を定義する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-070-opt-1', 'card-dbt-ae-070', 1, 'B', '名前付きセレクターを定義し、`--selector` で呼び出せるようにする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-070-opt-2', 'card-dbt-ae-070', 2, 'C', 'テストの実行対象を制限する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-070-opt-3', 'card-dbt-ae-070', 3, 'D', 'ソースのfreshness チェック対象を定義する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-070-ans-0', 'card-dbt-ae-070', 'card-dbt-ae-070-opt-1', NULL, NULL);

-- card-dbt-ae-073
UPDATE cards SET type = 'single_select', question = '以下の設定で seed の `quote_columns` の効果は何か？
```yaml
seeds:
  my_project:
    +quote_columns: true
```
- A. CSVデータの値をクォートで囲んでインポートする
- B. カラム名をクォート付きでDWHテーブルに作成する
- C. カラム名の大文字小文字を無視する
- D. 予約語と一致するカラムを自動リネームする' WHERE id = 'card-dbt-ae-073';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-073-opt-0', 'card-dbt-ae-073', 0, 'A', 'CSVデータの値をクォートで囲んでインポートする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-073-opt-1', 'card-dbt-ae-073', 1, 'B', 'カラム名をクォート付きでDWHテーブルに作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-073-opt-2', 'card-dbt-ae-073', 2, 'C', 'カラム名の大文字小文字を無視する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-073-opt-3', 'card-dbt-ae-073', 3, 'D', '予約語と一致するカラムを自動リネームする', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-073-ans-0', 'card-dbt-ae-073', 'card-dbt-ae-073-opt-1', NULL, NULL);

-- card-dbt-ae-082
UPDATE cards SET type = 'single_select', question = '以下の snapshot 設定の問題点は何か？
```yaml
snapshots:
  - name: orders_snapshot
    relation: source(''jaffle_shop'', ''orders'')
    config:
      strategy: timestamp
      check_cols:
        - status
```
- A. `relation` の構文が間違っている
- B. `timestamp` strategy には `updated_at` が必要だが、`check_cols` が指定されている
- C. `name` に `_snapshot` サフィックスは使えない
- D. `config` ブロックの外に `strategy` を書くべき' WHERE id = 'card-dbt-ae-082';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-082-opt-0', 'card-dbt-ae-082', 0, 'A', '`relation` の構文が間違っている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-082-opt-1', 'card-dbt-ae-082', 1, 'B', '`timestamp` strategy には `updated_at` が必要だが、`check_cols` が指定されている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-082-opt-2', 'card-dbt-ae-082', 2, 'C', '`name` に `_snapshot` サフィックスは使えない', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-082-opt-3', 'card-dbt-ae-082', 3, 'D', '`config` ブロックの外に `strategy` を書くべき', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-082-ans-0', 'card-dbt-ae-082', 'card-dbt-ae-082-opt-1', NULL, NULL);

-- card-dbt-ae-085
UPDATE cards SET type = 'single_select', question = '以下のモデルでビルド順序が不正になる原因は何か？
```sql
select
  a.account_id,
  a.account_name,
  o.total_amount
from dbt_user.stg_accounts a
left join dbt_user.stg_opportunities o
  on a.account_id = o.account_id
```
- A. LEFT JOINの構文が間違っている
- B. テーブル名がハードコーディングされており、`ref()` を使うべき
- C. エイリアス `a`, `o` が不適切である
- D. WHERE句が不足している' WHERE id = 'card-dbt-ae-085';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-085-opt-0', 'card-dbt-ae-085', 0, 'A', 'LEFT JOINの構文が間違っている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-085-opt-1', 'card-dbt-ae-085', 1, 'B', 'テーブル名がハードコーディングされており、`ref()` を使うべき', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-085-opt-2', 'card-dbt-ae-085', 2, 'C', 'エイリアス `a`, `o` が不適切である', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-085-opt-3', 'card-dbt-ae-085', 3, 'D', 'WHERE句が不足している', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-085-ans-0', 'card-dbt-ae-085', 'card-dbt-ae-085-opt-1', NULL, NULL);

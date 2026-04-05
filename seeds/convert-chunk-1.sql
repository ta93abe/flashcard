-- convert-chunk-1.sql: free_recall → single_select/multi_select (18 cards)

-- 089: --varsフラグの効果
UPDATE cards SET type = 'single_select', question = '以下のコマンドで `--vars` フラグの効果として正しいものはどれか？
```bash
dbt run --vars ''{"start_date": "2024-06-01"}''
```
- A. `dbt_project.yml` の `vars` をオーバーライドし、`var(''start_date'')` が `''2024-06-01''` を返す
- B. 環境変数 `START_DATE` を `''2024-06-01''` に設定する
- C. `profiles.yml` の `start_date` パラメータを上書きする
- D. `sources.yml` の `loaded_at_field` を `''2024-06-01''` に変更する' WHERE id = 'card-dbt-ae-089';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-089-opt-0', 'card-dbt-ae-089', 0, 'A', '`dbt_project.yml` の `vars` をオーバーライドし、`var(''start_date'')` が `''2024-06-01''` を返す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-089-opt-1', 'card-dbt-ae-089', 1, 'B', '環境変数 `START_DATE` を `''2024-06-01''` に設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-089-opt-2', 'card-dbt-ae-089', 2, 'C', '`profiles.yml` の `start_date` パラメータを上書きする', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-089-opt-3', 'card-dbt-ae-089', 3, 'D', '`sources.yml` の `loaded_at_field` を `''2024-06-01''` に変更する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-089-ans-0', 'card-dbt-ae-089', 'card-dbt-ae-089-opt-0', NULL, NULL);

-- 091: on-run-startの効果
UPDATE cards SET type = 'single_select', question = '以下の `dbt_project.yml` 設定の効果として正しいものはどれか？
```yaml
on-run-start:
  - "CREATE SCHEMA IF NOT EXISTS {{ target.schema }}"
```
- A. dbt run 開始前にターゲットスキーマが存在しない場合に作成する
- B. 各モデルのビルド前にスキーマを毎回再作成する
- C. dbt run 完了後にスキーマのクリーンアップを行う
- D. dbt compile 時にスキーマの存在チェックのみ行う' WHERE id = 'card-dbt-ae-091';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-091-opt-0', 'card-dbt-ae-091', 0, 'A', 'dbt run 開始前にターゲットスキーマが存在しない場合に作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-091-opt-1', 'card-dbt-ae-091', 1, 'B', '各モデルのビルド前にスキーマを毎回再作成する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-091-opt-2', 'card-dbt-ae-091', 2, 'C', 'dbt run 完了後にスキーマのクリーンアップを行う', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-091-opt-3', 'card-dbt-ae-091', 3, 'D', 'dbt compile 時にスキーマの存在チェックのみ行う', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-091-ans-0', 'card-dbt-ae-091', 'card-dbt-ae-091-opt-0', NULL, NULL);

-- 096: post-hookの操作
UPDATE cards SET type = 'single_select', question = '以下の post-hook 設定で、テーブルに対して行われる操作はどれか？
```sql
{{ config(
    materialized=''table'',
    post_hook="GRANT SELECT ON {{ this }} TO ROLE reporter"
) }}
```
- A. ビルド完了後に `reporter` ロールに SELECT 権限を付与する
- B. ビルド前に `reporter` ロールの既存権限を取り消す
- C. テーブル作成時に `reporter` ロールをオーナーに設定する
- D. ビルド完了後に `reporter` ロールに全権限を付与する' WHERE id = 'card-dbt-ae-096';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-096-opt-0', 'card-dbt-ae-096', 0, 'A', 'ビルド完了後に `reporter` ロールに SELECT 権限を付与する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-096-opt-1', 'card-dbt-ae-096', 1, 'B', 'ビルド前に `reporter` ロールの既存権限を取り消す', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-096-opt-2', 'card-dbt-ae-096', 2, 'C', 'テーブル作成時に `reporter` ロールをオーナーに設定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-096-opt-3', 'card-dbt-ae-096', 3, 'D', 'ビルド完了後に `reporter` ロールに全権限を付与する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-096-ans-0', 'card-dbt-ae-096', 'card-dbt-ae-096-opt-0', NULL, NULL);

-- 097: snapshot YAML定義の要素
UPDATE cards SET type = 'single_select', question = '以下のsnapshot YAML定義で、`relation` の役割として正しいものはどれか？
```yaml
snapshots:
  - name: orders_snapshot
    relation: source(''jaffle_shop'', ''orders'')
    config:
      unique_key: id
      strategy: timestamp
      updated_at: updated_at
```
- A. スナップショットのソースリレーションを指定する
- B. 変更検出方法を指定する
- C. 各行を一意に識別するカラムを指定する
- D. 変更検出に使うタイムスタンプカラムを指定する' WHERE id = 'card-dbt-ae-097';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-097-opt-0', 'card-dbt-ae-097', 0, 'A', 'スナップショットのソースリレーションを指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-097-opt-1', 'card-dbt-ae-097', 1, 'B', '変更検出方法を指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-097-opt-2', 'card-dbt-ae-097', 2, 'C', '各行を一意に識別するカラムを指定する', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-097-opt-3', 'card-dbt-ae-097', 3, 'D', '変更検出に使うタイムスタンプカラムを指定する', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-097-ans-0', 'card-dbt-ae-097', 'card-dbt-ae-097-opt-0', NULL, NULL);

-- 099: incrementalモデルの問題点
UPDATE cards SET type = 'single_select', question = '以下の incremental モデルの問題点はどれか？
```sql
{{ config(
    materialized=''incremental'',
    incremental_strategy=''append''
) }}
select * from {{ ref(''stg_events'') }}
{% if is_incremental() %}
where event_date > (select max(event_date) from {{ this }})
{% endif %}
```
- A. `append` strategy は重複チェックを行わないため、境界値のデータが重複する可能性がある
- B. `is_incremental()` の条件が逆になっている
- C. `stg_events` を `source()` で参照すべきである
- D. `append` strategy では WHERE 句を使用できない' WHERE id = 'card-dbt-ae-099';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-099-opt-0', 'card-dbt-ae-099', 0, 'A', '`append` strategy は重複チェックを行わないため、境界値のデータが重複する可能性がある', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-099-opt-1', 'card-dbt-ae-099', 1, 'B', '`is_incremental()` の条件が逆になっている', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-099-opt-2', 'card-dbt-ae-099', 2, 'C', '`stg_events` を `source()` で参照すべきである', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-099-opt-3', 'card-dbt-ae-099', 3, 'D', '`append` strategy では WHERE 句を使用できない', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-099-ans-0', 'card-dbt-ae-099', 'card-dbt-ae-099-opt-0', NULL, NULL);

-- 102: grants設定の権限
UPDATE cards SET type = 'single_select', question = '以下の grants 設定で付与される権限の組み合わせとして正しいものはどれか？
```yaml
models:
  - name: fct_orders
    config:
      grants:
        select: [''analyst_role'']
        insert: [''etl_role'']
```
- A. `analyst_role` に SELECT、`etl_role` に INSERT
- B. `analyst_role` に INSERT、`etl_role` に SELECT
- C. 両方のロールに SELECT と INSERT
- D. `analyst_role` に全権限、`etl_role` に INSERT のみ' WHERE id = 'card-dbt-ae-102';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-102-opt-0', 'card-dbt-ae-102', 0, 'A', '`analyst_role` に SELECT、`etl_role` に INSERT', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-102-opt-1', 'card-dbt-ae-102', 1, 'B', '`analyst_role` に INSERT、`etl_role` に SELECT', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-102-opt-2', 'card-dbt-ae-102', 2, 'C', '両方のロールに SELECT と INSERT', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-102-opt-3', 'card-dbt-ae-102', 3, 'D', '`analyst_role` に全権限、`etl_role` に INSERT のみ', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-102-ans-0', 'card-dbt-ae-102', 'card-dbt-ae-102-opt-0', NULL, NULL);

-- 103: {% if execute %}ガードの理由
UPDATE cards SET type = 'single_select', question = '以下の Jinja コードで `{% if execute %}` ガードが必要な理由はどれか？
```sql
{% set results = run_query("select distinct status from " ~ ref(''orders'')) %}
```
- A. parse フェーズでは `run_query` が実行できないため
- B. `ref()` が parse フェーズで未解決になるため
- C. `run_query` の結果が空の場合にエラーになるため
- D. 複数スレッド実行時の競合を防ぐため' WHERE id = 'card-dbt-ae-103';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-103-opt-0', 'card-dbt-ae-103', 0, 'A', 'parse フェーズでは `run_query` が実行できないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-103-opt-1', 'card-dbt-ae-103', 1, 'B', '`ref()` が parse フェーズで未解決になるため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-103-opt-2', 'card-dbt-ae-103', 2, 'C', '`run_query` の結果が空の場合にエラーになるため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-103-opt-3', 'card-dbt-ae-103', 3, 'D', '複数スレッド実行時の競合を防ぐため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-103-ans-0', 'card-dbt-ae-103', 'card-dbt-ae-103-opt-0', NULL, NULL);

-- 105: YAML定義の機能
UPDATE cards SET type = 'single_select', question = '以下のYAMLはどのdbt機能の定義か？
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
```
- A. semantic model
- B. exposure
- C. metric
- D. source' WHERE id = 'card-dbt-ae-105';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-105-opt-0', 'card-dbt-ae-105', 0, 'A', 'semantic model', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-105-opt-1', 'card-dbt-ae-105', 1, 'B', 'exposure', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-105-opt-2', 'card-dbt-ae-105', 2, 'C', 'metric', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-105-opt-3', 'card-dbt-ae-105', 3, 'D', 'source', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-105-ans-0', 'card-dbt-ae-105', 'card-dbt-ae-105-opt-0', NULL, NULL);

-- 157: ref('dim_customers')がv1を返す原因
UPDATE cards SET type = 'single_select', question = '以下のモデルバージョン定義で、`ref(''dim_customers'')` がv1を返してしまう原因はどれか？
```yaml
models:
  - name: dim_customers
    versions:
      - v: 1
      - v: 2
```
- A. `latest_version` が未設定のため
- B. v2 のモデルファイルが存在しないため
- C. `versions` の順序が昇順のため
- D. `ref()` はデフォルトで常にv1を参照するため' WHERE id = 'card-dbt-ae-157';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-157-opt-0', 'card-dbt-ae-157', 0, 'A', '`latest_version` が未設定のため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-157-opt-1', 'card-dbt-ae-157', 1, 'B', 'v2 のモデルファイルが存在しないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-157-opt-2', 'card-dbt-ae-157', 2, 'C', '`versions` の順序が昇順のため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-157-opt-3', 'card-dbt-ae-157', 3, 'D', '`ref()` はデフォルトで常にv1を参照するため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-157-ans-0', 'card-dbt-ae-157', 'card-dbt-ae-157-opt-0', NULL, NULL);

-- 158: contract設定でビルドエラーになる原因
UPDATE cards SET type = 'single_select', question = '以下の contract 設定でビルドエラーになる原因はどれか？
```yaml
models:
  - name: dim_products
    config:
      contract:
        enforced: true
    columns:
      - name: product_id
      - name: product_name
```
- A. 各カラムに `data_type` の指定がないため
- B. `contract` は `config:` の外に記述すべきため
- C. `enforced` の値は `''true''`（文字列）にすべきため
- D. primary key の指定がないため' WHERE id = 'card-dbt-ae-158';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-158-opt-0', 'card-dbt-ae-158', 0, 'A', '各カラムに `data_type` の指定がないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-158-opt-1', 'card-dbt-ae-158', 1, 'B', '`contract` は `config:` の外に記述すべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-158-opt-2', 'card-dbt-ae-158', 2, 'C', '`enforced` の値は `''true''`（文字列）にすべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-158-opt-3', 'card-dbt-ae-158', 3, 'D', 'primary key の指定がないため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-158-ans-0', 'card-dbt-ae-158', 'card-dbt-ae-158-opt-0', NULL, NULL);

-- 159: 2回目以降で全データが処理される原因
UPDATE cards SET type = 'single_select', question = '以下の incremental モデルで2回目以降の実行で全データが処理されてしまう原因はどれか？
```sql
{{ config(materialized=''incremental'', unique_key=''id'') }}
select *
from {{ ref(''stg_events'') }}
```
- A. `is_incremental()` による WHERE 句がないため
- B. `unique_key` の指定が不正なため
- C. `incremental_strategy` が未指定のため
- D. `ref()` ではなく `source()` を使うべきため' WHERE id = 'card-dbt-ae-159';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-159-opt-0', 'card-dbt-ae-159', 0, 'A', '`is_incremental()` による WHERE 句がないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-159-opt-1', 'card-dbt-ae-159', 1, 'B', '`unique_key` の指定が不正なため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-159-opt-2', 'card-dbt-ae-159', 2, 'C', '`incremental_strategy` が未指定のため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-159-opt-3', 'card-dbt-ae-159', 3, 'D', '`ref()` ではなく `source()` を使うべきため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-159-ans-0', 'card-dbt-ae-159', 'card-dbt-ae-159-opt-0', NULL, NULL);

-- 165: ambiguous column nameエラーの原因
UPDATE cards SET type = 'single_select', question = '以下のモデルで `ambiguous column name` エラーが発生する原因はどれか？
```sql
select
  customer_id,
  name,
  total_amount
from {{ ref(''stg_customers'') }} c
left join {{ ref(''stg_orders'') }} o
  on c.customer_id = o.customer_id
```
- A. SELECT句の `customer_id` にテーブルエイリアスがないため
- B. LEFT JOIN ではなく INNER JOIN を使うべきため
- C. `ref()` に2つのモデルを同時に指定できないため
- D. ON句で同じカラム名を使用できないため' WHERE id = 'card-dbt-ae-165';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-165-opt-0', 'card-dbt-ae-165', 0, 'A', 'SELECT句の `customer_id` にテーブルエイリアスがないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-165-opt-1', 'card-dbt-ae-165', 1, 'B', 'LEFT JOIN ではなく INNER JOIN を使うべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-165-opt-2', 'card-dbt-ae-165', 2, 'C', '`ref()` に2つのモデルを同時に指定できないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-165-opt-3', 'card-dbt-ae-165', 3, 'D', 'ON句で同じカラム名を使用できないため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-165-ans-0', 'card-dbt-ae-165', 'card-dbt-ae-165-opt-0', NULL, NULL);

-- 170: 'source' is undefinedエラーの原因
UPDATE cards SET type = 'single_select', question = '以下のモデルで `Compilation Error: ''source'' is undefined` が発生する原因はどれか？
```sql
select *
from source(''stripe'', ''payments'')
```
- A. Jinja の二重波括弧 `{{ }}` が欠けているため
- B. `sources.yml` に `stripe` が定義されていないため
- C. `source()` の引数の順序が逆のため
- D. `source()` ではなく `ref()` を使うべきため' WHERE id = 'card-dbt-ae-170';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-170-opt-0', 'card-dbt-ae-170', 0, 'A', 'Jinja の二重波括弧 `{{ }}` が欠けているため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-170-opt-1', 'card-dbt-ae-170', 1, 'B', '`sources.yml` に `stripe` が定義されていないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-170-opt-2', 'card-dbt-ae-170', 2, 'C', '`source()` の引数の順序が逆のため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-170-opt-3', 'card-dbt-ae-170', 3, 'D', '`source()` ではなく `ref()` を使うべきため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-170-ans-0', 'card-dbt-ae-170', 'card-dbt-ae-170-opt-0', NULL, NULL);

-- 184: grantsが適用されない原因
UPDATE cards SET type = 'single_select', question = '以下のモデル定義で `grants` が適用されない原因はどれか？
```yaml
models:
  - name: dim_customers
    grants:
      select: [''analyst_role'']
```
- A. `grants` は `config:` の下に入れるべきため
- B. `grants` にはロール名ではなくユーザー名を指定すべきため
- C. `select` ではなく `SELECT` と大文字で書くべきため
- D. `grants` はモデルレベルでは設定できないため' WHERE id = 'card-dbt-ae-184';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-184-opt-0', 'card-dbt-ae-184', 0, 'A', '`grants` は `config:` の下に入れるべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-184-opt-1', 'card-dbt-ae-184', 1, 'B', '`grants` にはロール名ではなくユーザー名を指定すべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-184-opt-2', 'card-dbt-ae-184', 2, 'C', '`select` ではなく `SELECT` と大文字で書くべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-184-opt-3', 'card-dbt-ae-184', 3, 'D', '`grants` はモデルレベルでは設定できないため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-184-ans-0', 'card-dbt-ae-184', 'card-dbt-ae-184-opt-0', NULL, NULL);

-- 185: Database error while listing schemasの原因
UPDATE cards SET type = 'single_select', question = '以下のエラーの最も可能性が高い原因はどれか？
```
Runtime Error: Database error while listing schemas
```
- A. DWH への接続に問題がある（認証情報、ネットワーク等）
- B. `dbt_project.yml` のスキーマ名にタイプミスがある
- C. モデルのSQL構文にエラーがある
- D. `packages.yml` の依存パッケージが未インストール' WHERE id = 'card-dbt-ae-185';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-185-opt-0', 'card-dbt-ae-185', 0, 'A', 'DWH への接続に問題がある（認証情報、ネットワーク等）', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-185-opt-1', 'card-dbt-ae-185', 1, 'B', '`dbt_project.yml` のスキーマ名にタイプミスがある', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-185-opt-2', 'card-dbt-ae-185', 2, 'C', 'モデルのSQL構文にエラーがある', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-185-opt-3', 'card-dbt-ae-185', 3, 'D', '`packages.yml` の依存パッケージが未インストール', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-185-ans-0', 'card-dbt-ae-185', 'card-dbt-ae-185-opt-0', NULL, NULL);

-- 187: Pythonモデルのビルド失敗原因
UPDATE cards SET type = 'single_select', question = '以下の config 設定で Python モデルのビルドが失敗する原因はどれか？
```python
def model(dbt, session):
    dbt.config(materialized=''view'')
    df = dbt.ref(''stg_orders'')
    return df.group_by(''customer_id'').agg(count(''order_id''))
```
- A. `materialized=''view''` は Python モデルで使用できないため
- B. `group_by` の構文が不正なため
- C. `dbt.ref()` ではなく `dbt.source()` を使うべきため
- D. `return` ではなく `yield` を使うべきため' WHERE id = 'card-dbt-ae-187';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-187-opt-0', 'card-dbt-ae-187', 0, 'A', '`materialized=''view''` は Python モデルで使用できないため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-187-opt-1', 'card-dbt-ae-187', 1, 'B', '`group_by` の構文が不正なため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-187-opt-2', 'card-dbt-ae-187', 2, 'C', '`dbt.ref()` ではなく `dbt.source()` を使うべきため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-187-opt-3', 'card-dbt-ae-187', 3, 'D', '`return` ではなく `yield` を使うべきため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-187-ans-0', 'card-dbt-ae-187', 'card-dbt-ae-187-opt-0', NULL, NULL);

-- 202: dbt cloneの正しいコマンド
UPDATE cards SET type = 'single_select', question = '開発環境を高速にセットアップするために `dbt clone` を使う場合、空欄に入る正しいフラグはどれか？
```bash
dbt clone ______ path/to/prod-artifacts
```
- A. `--state`
- B. `--target`
- C. `--defer`
- D. `--artifacts`' WHERE id = 'card-dbt-ae-202';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-202-opt-0', 'card-dbt-ae-202', 0, 'A', '`--state`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-202-opt-1', 'card-dbt-ae-202', 1, 'B', '`--target`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-202-opt-2', 'card-dbt-ae-202', 2, 'C', '`--defer`', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-202-opt-3', 'card-dbt-ae-202', 3, 'D', '`--artifacts`', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-202-ans-0', 'card-dbt-ae-202', 'card-dbt-ae-202-opt-0', NULL, NULL);

-- 210: テストの警告/エラー閾値
UPDATE cards SET type = 'single_select', question = '以下の設定でテストが最大10件の失敗まで警告、100件を超えるとエラーになる理由として正しいものはどれか？
```yaml
data_tests:
  - not_null:
      config:
        error_if: ">100"
        warn_if: ">10"
        severity: error
```
- A. `warn_if: ">10"` で10件超は警告、`error_if: ">100"` で100件超はエラーになるため
- B. `severity: error` が全体のデフォルトを設定し、`warn_if` が例外を定義するため
- C. `error_if` と `warn_if` の数値の差分（90件）が警告範囲になるため
- D. `warn_if` は累積件数、`error_if` は単一実行の件数を指すため' WHERE id = 'card-dbt-ae-210';
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-210-opt-0', 'card-dbt-ae-210', 0, 'A', '`warn_if: ">10"` で10件超は警告、`error_if: ">100"` で100件超はエラーになるため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-210-opt-1', 'card-dbt-ae-210', 1, 'B', '`severity: error` が全体のデフォルトを設定し、`warn_if` が例外を定義するため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-210-opt-2', 'card-dbt-ae-210', 2, 'C', '`error_if` と `warn_if` の数値の差分（90件）が警告範囲になるため', NULL);
INSERT OR IGNORE INTO card_options (id, card_id, position, label, body, group_name) VALUES ('card-dbt-ae-210-opt-3', 'card-dbt-ae-210', 3, 'D', '`warn_if` は累積件数、`error_if` は単一実行の件数を指すため', NULL);
INSERT OR IGNORE INTO card_answers (id, card_id, option_id, text_value, sort_order) VALUES ('card-dbt-ae-210-ans-0', 'card-dbt-ae-210', 'card-dbt-ae-210-opt-0', NULL, NULL);

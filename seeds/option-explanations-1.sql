-- Option explanations for chunk 1 (39 cards)
-- Generated for dbt Analytics Engineering certification exam

-- card-dbt-ae-078: ref()のクロスプロジェクト参照（dbt Mesh）の構文
UPDATE card_options SET explanation = 'dbt Meshでは ref() の2引数形式 ref(''project_name'', ''model_name'') でクロスプロジェクト参照を行う。これが公式にサポートされている構文である。' WHERE id = 'card-dbt-ae-078-opt-0';
UPDATE card_options SET explanation = 'ref() にキーワード引数 project= を渡す構文はdbtでサポートされていない。正しくは位置引数で ref(''project_name'', ''model_name'') と記述する。' WHERE id = 'card-dbt-ae-078-opt-1';
UPDATE card_options SET explanation = 'cross_ref() というマクロはdbtに存在しない。クロスプロジェクト参照には ref() の2引数形式を使用する。' WHERE id = 'card-dbt-ae-078-opt-2';
UPDATE card_options SET explanation = 'ドット記法 ref(''project.model'') はdbtでサポートされていない。プロジェクト名とモデル名はそれぞれ別の引数として渡す必要がある。' WHERE id = 'card-dbt-ae-078-opt-3';

-- card-dbt-ae-080: {{ this }} マクロの参照先
UPDATE card_options SET explanation = '{{ this }} はプロジェクト全体ではなく、現在のモデルが出力する特定のテーブル/ビューのリレーションを指す。' WHERE id = 'card-dbt-ae-080-opt-0';
UPDATE card_options SET explanation = '{{ this }} は現在のモデルが出力するテーブルまたはビューのリレーション（database.schema.identifier）を参照する。incrementalモデルで自身のテーブルからデータを読む際に頻繁に使用される。' WHERE id = 'card-dbt-ae-080-opt-1';
UPDATE card_options SET explanation = '{{ this }} は直前に実行されたモデルではなく、現在のモデル自身のリレーションを指す。実行順序とは無関係である。' WHERE id = 'card-dbt-ae-080-opt-2';
UPDATE card_options SET explanation = '{{ this }} は dbt_project.yml の設定ではなく、現在のモデルが出力するテーブル/ビューのリレーションオブジェクトを参照する。' WHERE id = 'card-dbt-ae-080-opt-3';

-- card-dbt-ae-081: var() の第2引数
UPDATE card_options SET explanation = 'var() の第2引数は変数の型を指定するものではなく、変数が未定義の場合に使用されるデフォルト値である。' WHERE id = 'card-dbt-ae-081-opt-0';
UPDATE card_options SET explanation = 'var() はdbtの変数（vars）を参照するものであり、OSの環境変数とは異なる。環境変数には env_var() を使用する。' WHERE id = 'card-dbt-ae-081-opt-1';
UPDATE card_options SET explanation = 'var() の第2引数は、dbt_project.yml の vars や --vars フラグで my_var が定義されていない場合に返されるデフォルト値である。' WHERE id = 'card-dbt-ae-081-opt-2';
UPDATE card_options SET explanation = 'var() にバリデーションルールを指定する機能はない。第2引数は単にデフォルト値として機能する。' WHERE id = 'card-dbt-ae-081-opt-3';

-- card-dbt-ae-082: snapshot設定の問題点
UPDATE card_options SET explanation = 'relation の構文自体は問題ではない。問題は strategy と設定パラメータの不整合にある。' WHERE id = 'card-dbt-ae-082-opt-0';
UPDATE card_options SET explanation = 'timestamp strategy では updated_at パラメータでタイムスタンプカラムを指定する必要があるが、check strategy 用の check_cols が指定されている。この不整合がエラーの原因となる。' WHERE id = 'card-dbt-ae-082-opt-1';
UPDATE card_options SET explanation = 'dbtのモデル名やsnapshot名に _snapshot サフィックスを使うことに制限はない。命名規則の問題ではない。' WHERE id = 'card-dbt-ae-082-opt-2';
UPDATE card_options SET explanation = 'strategy は config ブロック内に記述するのが正しい。config の外に書くべきという指摘は誤りである。' WHERE id = 'card-dbt-ae-082-opt-3';

-- card-dbt-ae-083: stagingモデルの設計原則
UPDATE card_options SET explanation = 'stagingモデルはソーステーブルと1:1で対応させるのがベストプラクティスである。1つのstagingモデルが1つのソーステーブルを参照する。' WHERE id = 'card-dbt-ae-083-opt-0';
UPDATE card_options SET explanation = 'stagingレイヤーでは複数ソースのJOINは行わない。JOINはintermediate以降のレイヤーで実施すべきである。' WHERE id = 'card-dbt-ae-083-opt-1';
UPDATE card_options SET explanation = 'stagingモデルの主な役割は、カラムのリネーム、データ型のキャスト、基本的なクリーニング（NULL処理等）である。変換の入口として標準化を行う。' WHERE id = 'card-dbt-ae-083-opt-2';
UPDATE card_options SET explanation = '複雑なビジネスロジックはstagingではなくintermediate（int_）やmart（fct_, dim_）レイヤーで実装すべきである。' WHERE id = 'card-dbt-ae-083-opt-3';

-- card-dbt-ae-084: snapshotの現在有効レコード取得
UPDATE card_options SET explanation = 'dbt_valid_to IS NULL のレコードは、まだ無効化されていない現在有効なレコードである。過去の履歴レコードには dbt_valid_to に無効化日時が設定される。' WHERE id = 'card-dbt-ae-084-opt-0';
UPDATE card_options SET explanation = 'dbt_valid_from IS NOT NULL はすべてのレコードに該当する（snapshotに取り込まれた時点で値が設定される）ため、現在有効なレコードのフィルタにはならない。' WHERE id = 'card-dbt-ae-084-opt-1';
UPDATE card_options SET explanation = 'dbt_updated_at の最大値による絞り込みは、最後に更新されたレコードのみを返す可能性があり、現在有効な全レコードを正確に取得する方法ではない。' WHERE id = 'card-dbt-ae-084-opt-2';
UPDATE card_options SET explanation = 'dbt_scd_id はsnapshotレコードのユニーク識別子であり、すべてのレコード（過去・現在問わず）に値が設定されるため、有効レコードのフィルタにはならない。' WHERE id = 'card-dbt-ae-084-opt-3';

-- card-dbt-ae-085: ビルド順序不正の原因
UPDATE card_options SET explanation = 'LEFT JOINの構文自体は正しい。問題はテーブル参照の方法にある。' WHERE id = 'card-dbt-ae-085-opt-0';
UPDATE card_options SET explanation = 'テーブル名がハードコーディングされているため、dbtが依存関係を認識できずビルド順序を正しく決定できない。ref() を使うことでDAGに依存関係が登録される。' WHERE id = 'card-dbt-ae-085-opt-1';
UPDATE card_options SET explanation = 'エイリアス a, o は標準的なSQL構文であり、ビルド順序の問題とは無関係である。' WHERE id = 'card-dbt-ae-085-opt-2';
UPDATE card_options SET explanation = 'WHERE句の有無はビルド順序に影響しない。問題は ref() を使わずにテーブル名を直接記述していることにある。' WHERE id = 'card-dbt-ae-085-opt-3';

-- card-dbt-ae-087: DAG上でモデル失敗時の影響
UPDATE card_options SET explanation = '失敗したモデルの上流には影響しない。上流モデルはすでに正常に実行完了しているためスキップされない。' WHERE id = 'card-dbt-ae-087-opt-0';
UPDATE card_options SET explanation = '失敗したモデルの下流すべてのモデルがスキップされる。dbtは依存先が失敗した場合、その下流を実行しても意味がないためスキップする。' WHERE id = 'card-dbt-ae-087-opt-1';
UPDATE card_options SET explanation = '失敗は下流モデルに波及する。下流モデルは入力データが不完全になるためスキップされる。' WHERE id = 'card-dbt-ae-087-opt-2';
UPDATE card_options SET explanation = 'デフォルトでは全モデルの実行が停止するわけではなく、失敗したモデルの下流のみスキップされる。--fail-fast フラグを指定した場合のみ全体が即座に停止する。' WHERE id = 'card-dbt-ae-087-opt-3';

-- card-dbt-ae-091: on-run-start 設定の効果
UPDATE card_options SET explanation = 'on-run-start は dbt run の開始前に実行されるフックであり、CREATE SCHEMA IF NOT EXISTS によりターゲットスキーマが存在しない場合に作成される。' WHERE id = 'card-dbt-ae-091-opt-0';
UPDATE card_options SET explanation = 'on-run-start は実行全体の開始時に1回だけ実行される。各モデルのビルド前に毎回実行されるわけではない（それは pre-hook の役割）。' WHERE id = 'card-dbt-ae-091-opt-1';
UPDATE card_options SET explanation = 'on-run-start は実行開始前のフックである。完了後の処理は on-run-end で行う。' WHERE id = 'card-dbt-ae-091-opt-2';
UPDATE card_options SET explanation = 'on-run-start は dbt run 時に実際にSQLを実行する。dbt compile はSQLの生成のみでDWHへの接続・実行は行わない。' WHERE id = 'card-dbt-ae-091-opt-3';

-- card-dbt-ae-093: generate_surrogate_key マクロの用途
UPDATE card_options SET explanation = 'generate_surrogate_key は暗号化ではなく、複数カラムの値からMD5等のハッシュを用いてユニークなサロゲートキーを生成するマクロである。' WHERE id = 'card-dbt-ae-093-opt-0';
UPDATE card_options SET explanation = '複数カラムの値を連結してハッシュ化し、ユニークなサロゲートキーを生成する。自然キーの代わりにJOINやデータ統合で使用される。' WHERE id = 'card-dbt-ae-093-opt-1';
UPDATE card_options SET explanation = '自動インクリメントIDの生成はDWH側の機能であり、generate_surrogate_key はハッシュベースのキー生成を行う。' WHERE id = 'card-dbt-ae-093-opt-2';
UPDATE card_options SET explanation = 'dbtはデータ変換ツールであり、外部キー制約の追加はDWHのDDL機能である。generate_surrogate_key はキー値の生成のみを行う。' WHERE id = 'card-dbt-ae-093-opt-3';

-- card-dbt-ae-094: incrementalモデルの重複排除キー設定
UPDATE card_options SET explanation = 'unique_key は incremental モデルで既存データと新データを照合するカラムを指定する設定であり、merge や delete+insert 戦略で重複排除に使用される。' WHERE id = 'card-dbt-ae-094-opt-0';
UPDATE card_options SET explanation = 'primary_key はdbtのincremental設定には存在しない。正しくは unique_key を使用する。' WHERE id = 'card-dbt-ae-094-opt-1';
UPDATE card_options SET explanation = 'merge_key というconfig設定はdbtに存在しない。重複排除キーの指定には unique_key を使用する。' WHERE id = 'card-dbt-ae-094-opt-2';
UPDATE card_options SET explanation = 'dedup_key というconfig設定はdbtに存在しない。正しくは unique_key でマージキーを指定する。' WHERE id = 'card-dbt-ae-094-opt-3';

-- card-dbt-ae-096: post-hookのGRANT設定
UPDATE card_options SET explanation = 'post_hook はモデルのビルド完了後に実行される。GRANT SELECT ON {{ this }} TO ROLE reporter により、reporter ロールに対象テーブルのSELECT権限のみが付与される。' WHERE id = 'card-dbt-ae-096-opt-0';
UPDATE card_options SET explanation = 'post_hook はビルド完了後に実行されるフックであり、ビルド前ではない。また GRANT 文であるため権限の取り消し（REVOKE）は行わない。' WHERE id = 'card-dbt-ae-096-opt-1';
UPDATE card_options SET explanation = 'GRANT SELECT はSELECT権限の付与であり、テーブルのオーナーシップ変更ではない。オーナー変更には ALTER TABLE ... OWNER TO を使用する。' WHERE id = 'card-dbt-ae-096-opt-2';
UPDATE card_options SET explanation = 'GRANT SELECT は SELECT 権限のみを付与する。全権限（ALL PRIVILEGES）の付与ではない。' WHERE id = 'card-dbt-ae-096-opt-3';

-- card-dbt-ae-099: incrementalモデル（append strategy）の問題点
UPDATE card_options SET explanation = 'append strategy は単純にINSERTを行うだけで既存データとの照合を行わない。そのため境界値（max(event_date)と同じ日付）のデータが重複挿入される可能性がある。' WHERE id = 'card-dbt-ae-099-opt-0';
UPDATE card_options SET explanation = 'is_incremental() の条件は正しい。テーブルが既に存在しincrementalモードで実行されている場合にTRUEとなり、WHERE句でフィルタする標準的なパターンである。' WHERE id = 'card-dbt-ae-099-opt-1';
UPDATE card_options SET explanation = 'stg_events がstagingモデルであれば ref() で参照するのが正しい。source() は生のソーステーブルを参照する場合に使う。' WHERE id = 'card-dbt-ae-099-opt-2';
UPDATE card_options SET explanation = 'append strategy でも WHERE 句は問題なく使用できる。フィルタ自体は動作するが、append が重複チェックを行わないことが本質的な問題である。' WHERE id = 'card-dbt-ae-099-opt-3';

-- card-dbt-ae-101: method: セレクターの種類
UPDATE card_options SET explanation = 'tag: は有効なセレクターメソッドであり、モデルに付与されたタグ（例: tag:nightly）でノードを選択できる。' WHERE id = 'card-dbt-ae-101-opt-0';
UPDATE card_options SET explanation = 'source: は有効なセレクターメソッドであり、特定のソース（例: source:stripe）に関連するノードを選択できる。' WHERE id = 'card-dbt-ae-101-opt-1';
UPDATE card_options SET explanation = 'config.materialized: は有効なセレクターメソッドであり、config値（例: config.materialized:incremental）でノードをフィルタできる。' WHERE id = 'card-dbt-ae-101-opt-2';
UPDATE card_options SET explanation = 'schema: はdbtの有効なセレクターメソッドではない。スキーマでの選択には config.schema: を使用する必要がある。' WHERE id = 'card-dbt-ae-101-opt-3';

-- card-dbt-ae-102: grants設定の権限組み合わせ
UPDATE card_options SET explanation = 'YAML設定の通り、select キーに analyst_role、insert キーに etl_role が指定されているため、それぞれのロールに対応する権限が付与される。' WHERE id = 'card-dbt-ae-102-opt-0';
UPDATE card_options SET explanation = 'YAML設定では select: [''analyst_role''] と insert: [''etl_role''] と明示されており、権限とロールの対応は逆にならない。' WHERE id = 'card-dbt-ae-102-opt-1';
UPDATE card_options SET explanation = '各権限に対してロールが個別に指定されているため、両方のロールに両方の権限が付与されるわけではない。' WHERE id = 'card-dbt-ae-102-opt-2';
UPDATE card_options SET explanation = 'analyst_role に付与されるのは SELECT 権限のみであり、全権限ではない。grants 設定は明示された権限のみを付与する。' WHERE id = 'card-dbt-ae-102-opt-3';

-- card-dbt-ae-103: {% if execute %} ガードの必要性
UPDATE card_options SET explanation = 'dbtの parse フェーズではDWHへの接続が確立されていないため run_query は実行できない。{% if execute %} で実行フェーズでのみクエリが実行されるようガードする必要がある。' WHERE id = 'card-dbt-ae-103-opt-0';
UPDATE card_options SET explanation = 'ref() は parse フェーズでも解決される（プレースホルダとして）。{% if execute %} が必要な主な理由は run_query がDWH接続を必要とするためである。' WHERE id = 'card-dbt-ae-103-opt-1';
UPDATE card_options SET explanation = '結果が空の場合のエラーハンドリングは {% if execute %} の主目的ではない。空の結果は通常のJinja制御フローで処理できる。' WHERE id = 'card-dbt-ae-103-opt-2';
UPDATE card_options SET explanation = '{% if execute %} はスレッド競合の防止とは無関係である。dbtのスレッド管理は別の仕組みで行われる。' WHERE id = 'card-dbt-ae-103-opt-3';

-- card-dbt-ae-109: merge strategyに必要なDWH機能
UPDATE card_options SET explanation = 'merge strategy はDWHの MERGE INTO 文（UPSERT操作）を利用して既存行の更新と新規行の挿入を行う。Snowflake、BigQuery、Databricks等でサポートされている。' WHERE id = 'card-dbt-ae-109-opt-0';
UPDATE card_options SET explanation = 'パーティショニングはmerge strategyの必須要件ではない。パフォーマンス最適化には役立つが、merge自体の動作には不要である。' WHERE id = 'card-dbt-ae-109-opt-1';
UPDATE card_options SET explanation = 'マテリアライズドビューはmerge strategyとは無関係である。merge strategy はテーブルに対するMERGE INTO文を使用する。' WHERE id = 'card-dbt-ae-109-opt-2';
UPDATE card_options SET explanation = 'ストリーミング挿入はmerge strategyとは無関係である。merge strategyはバッチ処理でMERGE INTO文を実行する。' WHERE id = 'card-dbt-ae-109-opt-3';

-- card-dbt-ae-122: @演算子の意味
UPDATE card_options SET explanation = '@ 演算子は対象モデルだけでなく、その上流・下流すべてを選択する。モデル単体の実行には選択子なしでモデル名のみを指定する。' WHERE id = 'card-dbt-ae-122-opt-0';
UPDATE card_options SET explanation = '@ 演算子は対象モデルの上流と下流すべてに加え、下流モデルの祖先（ビルドに必要な全モデル）も選択する。CI環境で未存在の上流も含めてビルドする際に有用。' WHERE id = 'card-dbt-ae-122-opt-1';
UPDATE card_options SET explanation = '@ 演算子はテストの包含とは異なる。テストも含めて実行するのは dbt build の動作であり、@ は依存関係グラフの選択範囲を決定する。' WHERE id = 'card-dbt-ae-122-opt-2';
UPDATE card_options SET explanation = '@ 演算子はバックグラウンド実行とは無関係である。dbtにバックグラウンド実行のセレクター構文は存在しない。' WHERE id = 'card-dbt-ae-122-opt-3';

-- card-dbt-ae-126: dbt build の実行方法
UPDATE card_options SET explanation = 'dbt build はリソースタイプ別にまとめて実行するのではなく、DAG順にインターリーブして実行する。リソースタイプごとの実行は dbt run, dbt seed 等の個別コマンドで行う。' WHERE id = 'card-dbt-ae-126-opt-0';
UPDATE card_options SET explanation = 'dbt build は seeds、models、snapshots、tests をDAG順にインターリーブして実行し、各ノードの直後にそのテストを実行する。テスト失敗時は下流がスキップされる。' WHERE id = 'card-dbt-ae-126-opt-1';
UPDATE card_options SET explanation = 'dbt build は models だけでなく seeds、snapshots、tests もすべて含めて実行する。個別コマンドは不要である。' WHERE id = 'card-dbt-ae-126-opt-2';
UPDATE card_options SET explanation = 'テストは全モデル完了後にまとめて実行されるのではなく、各ノードのビルド直後に実行される。これにより早期にエラーを検出できる。' WHERE id = 'card-dbt-ae-126-opt-3';

-- card-dbt-ae-131: incremental_predicates設定の用途
UPDATE card_options SET explanation = 'incremental_predicates はDWH側のパーティションフィルタをmerge文に追加し、スキャン範囲を絞ることでmerge性能を大幅に向上させる。BigQuery等でパーティションプルーニングに活用される。' WHERE id = 'card-dbt-ae-131-opt-0';
UPDATE card_options SET explanation = 'incremental_predicates はテスト条件の追加とは無関係である。テストは data_tests で定義する。' WHERE id = 'card-dbt-ae-131-opt-1';
UPDATE card_options SET explanation = 'incremental_predicates はモデルの実行順序を制御するものではない。実行順序はDAGの依存関係で決まる。' WHERE id = 'card-dbt-ae-131-opt-2';
UPDATE card_options SET explanation = 'incremental_predicates はスキーマ変更の検出とは無関係である。スキーマ変更は on_schema_change 設定で制御する。' WHERE id = 'card-dbt-ae-131-opt-3';

-- card-dbt-ae-135: generate_schema_name マクロのオーバーライド目的
UPDATE card_options SET explanation = '典型的なパターンとして、本番環境では custom_schema をそのまま使い（例: analytics）、開発環境ではプレフィックスを付ける（例: dbt_user_analytics）ように環境ごとにスキーマ名生成ルールを変更する。' WHERE id = 'card-dbt-ae-135-opt-0';
UPDATE card_options SET explanation = 'generate_schema_name はスキーマ名の文字列生成ロジックを制御するものであり、暗号化機能は持たない。' WHERE id = 'card-dbt-ae-135-opt-1';
UPDATE card_options SET explanation = 'generate_schema_name はスキーマ名の命名規則を制御するマクロであり、スキーマの自動作成の有効/無効を制御するものではない。' WHERE id = 'card-dbt-ae-135-opt-2';
UPDATE card_options SET explanation = 'テスト用スキーマの生成が主目的ではない。主な用途は本番と開発環境でスキーマ命名規則を切り替えることである。' WHERE id = 'card-dbt-ae-135-opt-3';

-- card-dbt-ae-141: 失敗/スキップされたモデルの再実行コマンド
UPDATE card_options SET explanation = 'dbt retry は run_results.json を参照して error または skipped ステータスだったリソースのみを再実行するコマンドである。' WHERE id = 'card-dbt-ae-141-opt-0';
UPDATE card_options SET explanation = 'dbt rerun というコマンドはdbtに存在しない。失敗モデルの再実行には dbt retry を使用する。' WHERE id = 'card-dbt-ae-141-opt-1';
UPDATE card_options SET explanation = 'dbt resume というコマンドはdbtに存在しない。正しくは dbt retry である。' WHERE id = 'card-dbt-ae-141-opt-2';
UPDATE card_options SET explanation = 'dbt restart というコマンドはdbtに存在しない。失敗したリソースの再実行には dbt retry を使用する。' WHERE id = 'card-dbt-ae-141-opt-3';

-- card-dbt-ae-142: dbt Cloud CIジョブの自動動作
UPDATE card_options SET explanation = 'dbt Cloud CIジョブはPR（Pull Request）の作成や更新時に自動的にトリガーされる。' WHERE id = 'card-dbt-ae-142-opt-0';
UPDATE card_options SET explanation = 'dbt Cloud CIは state:modified+ セレクタを使用して、変更されたモデルとその下流のみをビルド・テストする（Slim CI）。' WHERE id = 'card-dbt-ae-142-opt-1';
UPDATE card_options SET explanation = 'CIジョブは検証目的であり、本番環境へのデプロイは行わない。デプロイは別途デプロイジョブで実行する。' WHERE id = 'card-dbt-ae-142-opt-2';
UPDATE card_options SET explanation = 'CIジョブはGitリポジトリをフォークする機能を持たない。PRのブランチに対してビルド・テストを実行するのみである。' WHERE id = 'card-dbt-ae-142-opt-3';

-- card-dbt-ae-143: adapter.dispatch の解決する問題
UPDATE card_options SET explanation = 'adapter.dispatch はバージョン管理ではなく、異なるDWHアダプター間でのSQL構文差異を吸収する仕組みである。' WHERE id = 'card-dbt-ae-143-opt-0';
UPDATE card_options SET explanation = 'adapter.dispatch により、Snowflakeでは DATEADD()、BigQueryでは DATE_ADD() のようにDWHごとに異なるSQL関数を自動的に切り替えることができる。' WHERE id = 'card-dbt-ae-143-opt-1';
UPDATE card_options SET explanation = 'adapter.dispatch はマクロの実行順序を制御するものではなく、アダプターに応じた適切なマクロ実装を選択する仕組みである。' WHERE id = 'card-dbt-ae-143-opt-2';
UPDATE card_options SET explanation = 'adapter.dispatch にキャッシュ管理の機能はない。DWHプラットフォーム間の互換性を確保するためのディスパッチ機構である。' WHERE id = 'card-dbt-ae-143-opt-3';

-- card-dbt-ae-147: model contractのenforced: trueが検証するもの
UPDATE card_options SET explanation = 'contract enforced: true はモデルの出力カラム名がYAML定義と一致するかを検証する。未定義のカラムや欠落カラムがあるとエラーになる。' WHERE id = 'card-dbt-ae-147-opt-0';
UPDATE card_options SET explanation = 'contract enforced: true はモデルの出力カラムのデータ型がYAML定義と一致するかを検証する。型の不一致はビルドエラーとなる。' WHERE id = 'card-dbt-ae-147-opt-1';
UPDATE card_options SET explanation = 'カラムの値の範囲チェックは contract の検証範囲外である。値の検証には accepted_values 等の data_tests を使用する。' WHERE id = 'card-dbt-ae-147-opt-2';
UPDATE card_options SET explanation = 'NULLの有無の検証は contract ではなく not_null テストの役割である。ただし constraints で NOT NULL を設定することは可能（table/incremental のみ）。' WHERE id = 'card-dbt-ae-147-opt-3';

-- card-dbt-ae-148: group と access: private の関係
UPDATE card_options SET explanation = 'access: private のモデルは同じ group に属するモデルからのみ ref() で参照可能である。グループ外からの参照はコンパイルエラーとなる。' WHERE id = 'card-dbt-ae-148-opt-0';
UPDATE card_options SET explanation = 'private の制約はフォルダ構造ではなく group 設定に基づく。同じフォルダ内でも異なる group であれば参照できない。' WHERE id = 'card-dbt-ae-148-opt-1';
UPDATE card_options SET explanation = 'group を設定しても自動的に private にはならない。デフォルトの access は protected であり、private は明示的に設定する必要がある。' WHERE id = 'card-dbt-ae-148-opt-2';
UPDATE card_options SET explanation = 'access: private を設定するには group の設定が必須である。group が定義されていないと、private の参照スコープを決定できない。' WHERE id = 'card-dbt-ae-148-opt-3';

-- card-dbt-ae-154: unexpected 'WITH' エラーの原因
UPDATE card_options SET explanation = 'このエラーはJinjaの構文エラーではなく、生成されたSQLの構造に問題がある。Jinja自体は正常にコンパイルされている。' WHERE id = 'card-dbt-ae-154-opt-0';
UPDATE card_options SET explanation = 'DWH上で直接SQLを実行しても、ネストされたWITH句の問題は解決しない。dbt側でephemeralモデルの使い方を見直す必要がある。' WHERE id = 'card-dbt-ae-154-opt-1';
UPDATE card_options SET explanation = 'ephemeral モデルはCTEとしてインライン展開されるため、呼び出し元がすでにCTEを使っている場合にWITH句がネストされ、SQL構文エラーとなることがある。' WHERE id = 'card-dbt-ae-154-opt-2';
UPDATE card_options SET explanation = 'ref() の参照先が存在しない場合は「model not found」エラーとなり、SQL compilation error にはならない。' WHERE id = 'card-dbt-ae-154-opt-3';

-- card-dbt-ae-157: ref()がv1を返す原因
UPDATE card_options SET explanation = 'latest_version が未設定の場合、ref(''dim_customers'') がどのバージョンを返すか不定になる可能性がある。latest_version: 2 を明示的に設定する必要がある。' WHERE id = 'card-dbt-ae-157-opt-0';
UPDATE card_options SET explanation = 'v2のモデルファイルが存在しない場合は別のエラー（ファイル未検出）が発生する。ref()がv1を返す原因は latest_version の未設定である。' WHERE id = 'card-dbt-ae-157-opt-1';
UPDATE card_options SET explanation = 'versions リストの順序はref()のデフォルト解決に直接影響しない。latest_version 設定が明示的にデフォルトバージョンを決定する。' WHERE id = 'card-dbt-ae-157-opt-2';
UPDATE card_options SET explanation = 'ref() がデフォルトで常にv1を参照するという仕様はない。latest_version 設定によりデフォルトの参照先バージョンが決まる。' WHERE id = 'card-dbt-ae-157-opt-3';

-- card-dbt-ae-158: contract設定でのビルドエラー原因
UPDATE card_options SET explanation = 'contract enforced: true の場合、各カラムに data_type の指定が必須である。data_type が未指定だとdbtはカラム型を検証できずビルドエラーとなる。' WHERE id = 'card-dbt-ae-158-opt-0';
UPDATE card_options SET explanation = 'contract は config: ブロック内に記述するのが正しい構文である。config の外に書くべきという指摘は誤りである。' WHERE id = 'card-dbt-ae-158-opt-1';
UPDATE card_options SET explanation = 'enforced の値はYAMLのブーリアン型（true）で正しい。文字列 ''true'' にする必要はない。' WHERE id = 'card-dbt-ae-158-opt-2';
UPDATE card_options SET explanation = 'contract の検証に primary key の指定は必須ではない。必須なのは各カラムの data_type 定義である。' WHERE id = 'card-dbt-ae-158-opt-3';

-- card-dbt-ae-165: ambiguous column name エラーの原因
UPDATE card_options SET explanation = 'SELECT句の customer_id にテーブルエイリアスが指定されていないため、両テーブルに存在する同名カラムのどちらを参照するか曖昧になりエラーが発生する。' WHERE id = 'card-dbt-ae-165-opt-0';
UPDATE card_options SET explanation = 'LEFT JOIN と INNER JOIN の選択はビジネス要件に依存するものであり、ambiguous column name エラーとは無関係である。' WHERE id = 'card-dbt-ae-165-opt-1';
UPDATE card_options SET explanation = 'ref() は複数のモデルを個別に参照できる。1つのクエリ内で複数の ref() を使用することに制限はない。' WHERE id = 'card-dbt-ae-165-opt-2';
UPDATE card_options SET explanation = 'ON句で同じカラム名を使用すること自体は問題ない。問題はSELECT句でテーブルエイリアスなしに曖昧なカラムを参照していることである。' WHERE id = 'card-dbt-ae-165-opt-3';

-- card-dbt-ae-166: .ymlファイルのコンパイルエラー原因
UPDATE card_options SET explanation = 'YAMLはインデントに厳密であり、スペースとタブの混在や不正なインデント階層はパースエラーの一般的な原因である。' WHERE id = 'card-dbt-ae-166-opt-0';
UPDATE card_options SET explanation = 'YAMLではコロンの後にスペースが必要（name: value）。スペースがない場合（name:value）はパースエラーになる。' WHERE id = 'card-dbt-ae-166-opt-1';
UPDATE card_options SET explanation = 'モデルのSQL構文エラーはYAMLファイルのコンパイルとは無関係である。SQLのエラーはDWH実行時に発生する。' WHERE id = 'card-dbt-ae-166-opt-2';
UPDATE card_options SET explanation = 'YAMLでは : や # 等の特殊文字を値に含む場合にクォートで囲む必要がある。クォート不足はパースエラーの原因となる。' WHERE id = 'card-dbt-ae-166-opt-3';
UPDATE card_options SET explanation = 'ref() マクロの使用有無はYAMLファイルのコンパイルに影響しない。ref() はSQLファイル内のJinjaマクロである。' WHERE id = 'card-dbt-ae-166-opt-4';

-- card-dbt-ae-168: target/compiled/にSQLが生成されない場合のエラー種類
UPDATE card_options SET explanation = 'SQLランタイムエラーの場合、コンパイルは成功しているため target/compiled/ にSQLファイルは存在する。ランタイムエラーは実行時のDWH側エラーである。' WHERE id = 'card-dbt-ae-168-opt-0';
UPDATE card_options SET explanation = 'JinjaコンパイルエラーではSQL生成自体が失敗するため、target/compiled/ にファイルが出力されない。デバッグにはJinjaの構文を確認する必要がある。' WHERE id = 'card-dbt-ae-168-opt-1';
UPDATE card_options SET explanation = 'DWH接続エラーはSQL実行時の問題であり、コンパイル（SQL生成）フェーズには影響しない。接続エラーでも target/compiled/ にはSQLが生成される。' WHERE id = 'card-dbt-ae-168-opt-2';
UPDATE card_options SET explanation = 'YAMLバリデーションエラーはYAMLファイルのパース時に発生し、SQLの生成とは別の問題である。SQLが生成されない場合はJinjaのコンパイルエラーを疑うべきである。' WHERE id = 'card-dbt-ae-168-opt-3';

-- card-dbt-ae-170: 'source' is undefined エラーの原因
UPDATE card_options SET explanation = 'source() はJinjaマクロであるため {{ source(...) }} のように二重波括弧内で呼び出す必要がある。波括弧がないとdbtはsourceをSQL関数として解釈しようとしてエラーになる。' WHERE id = 'card-dbt-ae-170-opt-0';
UPDATE card_options SET explanation = 'sources.yml に stripe が未定義の場合は「source not found」エラーとなる。''source'' is undefined はJinja構文の問題を示している。' WHERE id = 'card-dbt-ae-170-opt-1';
UPDATE card_options SET explanation = 'source() の引数順序は source(''source_name'', ''table_name'') が正しく、この例の順序は正しい。問題は {{ }} の欠落である。' WHERE id = 'card-dbt-ae-170-opt-2';
UPDATE card_options SET explanation = 'source() と ref() は異なる用途を持つ。source() は生のソーステーブル参照、ref() はdbtモデル参照に使う。ここでの問題は {{ }} の欠落である。' WHERE id = 'card-dbt-ae-170-opt-3';

-- card-dbt-ae-176: contract enforced: true と materialized: view
UPDATE card_options SET explanation = 'view でも contract は正常に動作し、カラム名とデータ型の検証が行われる。ただし constraints（NOT NULL等）は view では強制されない。' WHERE id = 'card-dbt-ae-176-opt-0';
UPDATE card_options SET explanation = 'contract は view でも動作する。table/incremental のみという制限はカラム名・データ型の検証には適用されない。constraints の強制のみが table/incremental に限定される。' WHERE id = 'card-dbt-ae-176-opt-1';
UPDATE card_options SET explanation = '警告ではなく正常に動作する。view での contract 使用は完全にサポートされている。' WHERE id = 'card-dbt-ae-176-opt-2';
UPDATE card_options SET explanation = 'dbt が自動的に materialization を変更することはない。contract の設定に関わらず、指定した materialization がそのまま使用される。' WHERE id = 'card-dbt-ae-176-opt-3';

-- card-dbt-ae-178: unique_keyカラムが見つからないエラー
UPDATE card_options SET explanation = 'unique_key で指定したカラム名がDWH上のターゲットテーブルのスキーマに存在しない場合にこのエラーが発生する。カラム名のスペルミスやスキーマ変更が原因として考えられる。' WHERE id = 'card-dbt-ae-178-opt-0';
UPDATE card_options SET explanation = 'unique_key の値が重複していてもこのエラーは発生しない。重複はデータ品質の問題であり、カラムの存在とは別の問題である。' WHERE id = 'card-dbt-ae-178-opt-1';
UPDATE card_options SET explanation = 'unique_key カラムに NULL が含まれていてもこのエラーは発生しない。NULL の扱いはmerge動作の問題であり、カラムの検出とは無関係である。' WHERE id = 'card-dbt-ae-178-opt-2';
UPDATE card_options SET explanation = 'データ型の不一致ではこのエラーは発生しない。エラーメッセージは明確にカラムが「見つからない」ことを示している。' WHERE id = 'card-dbt-ae-178-opt-3';

-- card-dbt-ae-194: log() 関数の用途
UPDATE card_options SET explanation = 'log() はDWHにログテーブルを作成する機能ではない。Jinjaのコンパイル時にコンソールへメッセージを出力する関数である。' WHERE id = 'card-dbt-ae-194-opt-0';
UPDATE card_options SET explanation = 'log() はJinjaコンパイル時にメッセージをコンソールに出力する関数である。info=True で標準出力に表示され、変数の値確認などデバッグに有用。' WHERE id = 'card-dbt-ae-194-opt-1';
UPDATE card_options SET explanation = 'log() はテスト結果の保存機能ではない。テスト結果は run_results.json に記録される。' WHERE id = 'card-dbt-ae-194-opt-2';
UPDATE card_options SET explanation = 'log() はモデルの実行時間を記録する機能ではない。実行時間は dbt が自動的に計測し run_results.json に記録する。' WHERE id = 'card-dbt-ae-194-opt-3';

-- card-dbt-ae-206: dbt run --empty フラグの効果
UPDATE card_options SET explanation = '--empty フラグはクエリに LIMIT 0 を追加してデータなしのテーブルを作成する。スキーマの検証やCI環境でのcontract確認に使用される。' WHERE id = 'card-dbt-ae-206-opt-0';
UPDATE card_options SET explanation = '--empty はモデルファイルを生成するフラグではない。既存モデルのSQLに LIMIT 0 を追加して空のテーブルを作成する機能である。' WHERE id = 'card-dbt-ae-206-opt-1';
UPDATE card_options SET explanation = '--empty は実行結果の表示制御とは無関係である。出力制御には --quiet や --no-print 等を使用する。' WHERE id = 'card-dbt-ae-206-opt-2';
UPDATE card_options SET explanation = '--empty はテストのスキップとは無関係である。テストのスキップには --exclude やセレクタを使用する。' WHERE id = 'card-dbt-ae-206-opt-3';

-- card-dbt-ae-207: model group の用途
UPDATE card_options SET explanation = 'group はモデルの物理的なフォルダ配置とは無関係である。フォルダ構造はファイルシステム上の配置で決まり、group は論理的な分類である。' WHERE id = 'card-dbt-ae-207-opt-0';
UPDATE card_options SET explanation = 'group はモデルの論理的なオーナーシップを定義する。access: private と組み合わせることで、同じグループ内のモデルのみが参照可能となる境界を設定できる。' WHERE id = 'card-dbt-ae-207-opt-1';
UPDATE card_options SET explanation = 'group はモデルの実行順序を制御するものではない。実行順序はDAGの依存関係（ref()）で決定される。' WHERE id = 'card-dbt-ae-207-opt-2';
UPDATE card_options SET explanation = 'group はテストのグループ化や一括実行とは無関係である。テストの選択にはセレクタ（tag:、path:等）を使用する。' WHERE id = 'card-dbt-ae-207-opt-3';

-- card-dbt-ae-208: dbtの4つの組み込みgeneric test
UPDATE card_options SET explanation = 'unique はdbtの組み込みgeneric testであり、指定カラムの全値がユニーク（重複なし）であることを検証する。' WHERE id = 'card-dbt-ae-208-opt-0';
UPDATE card_options SET explanation = 'not_null はdbtの組み込みgeneric testであり、指定カラムにNULL値が存在しないことを検証する。' WHERE id = 'card-dbt-ae-208-opt-1';
UPDATE card_options SET explanation = 'positive_value はdbtの組み込みgeneric testではない。値の正数チェックはカスタムテストとして作成する必要がある。' WHERE id = 'card-dbt-ae-208-opt-2';
UPDATE card_options SET explanation = 'accepted_values はdbtの組み込みgeneric testであり、指定カラムの値が定義されたリスト内に含まれることを検証する。' WHERE id = 'card-dbt-ae-208-opt-3';
UPDATE card_options SET explanation = 'relationships はdbtの組み込みgeneric testであり、外部キーの参照整合性（指定カラムの値が参照先テーブルに存在すること）を検証する。' WHERE id = 'card-dbt-ae-208-opt-4';

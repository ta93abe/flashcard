-- Option explanations for chunk 2 (card-dbt-ae-209 ~ card-dbt-ae-320)

-- card-dbt-ae-209: `dbt run --full-refresh --select tag:daily` が実行する内容は？
UPDATE card_options SET explanation = '--select tag:daily はdailyタグが付いたモデルのみを選択するが、incrementalモデルに限定しない。--full-refreshはincrementalに限らず選択されたすべてのモデルに適用される。' WHERE id = 'card-dbt-ae-209-opt-0';
UPDATE card_options SET explanation = '--select tag:daily でdailyタグのモデルのみに絞り込んでいるため、すべてのモデルが対象になるわけではない。' WHERE id = 'card-dbt-ae-209-opt-1';
UPDATE card_options SET explanation = '--select tag:daily でdailyタグ付きモデルを選択し、--full-refresh でそのすべてのモデル（incremental・table問わず）をDROP+再作成する。' WHERE id = 'card-dbt-ae-209-opt-2';
UPDATE card_options SET explanation = 'dbt run はモデルの実行コマンドであり、テストは実行しない。テストを実行するには dbt test または dbt build を使用する。' WHERE id = 'card-dbt-ae-209-opt-3';

-- card-dbt-ae-210: テストの warn_if / error_if 設定
UPDATE card_options SET explanation = 'warn_if: ">10" は失敗行が10件を超えると警告を出し、error_if: ">100" は100件を超えるとエラーにする。10件以下はPASS、11〜100件はWARN、101件以上はERRORとなる。' WHERE id = 'card-dbt-ae-210-opt-0';
UPDATE card_options SET explanation = 'severity はerror_if/warn_ifが未設定の場合のフォールバックであり、全体のデフォルトを設定するものではない。error_if/warn_ifが明示されている場合はそちらが優先される。' WHERE id = 'card-dbt-ae-210-opt-1';
UPDATE card_options SET explanation = 'error_ifとwarn_ifはそれぞれ独立した閾値であり、差分で警告範囲が決まるわけではない。各閾値は失敗行の総数に対して個別に評価される。' WHERE id = 'card-dbt-ae-210-opt-2';
UPDATE card_options SET explanation = 'warn_ifもerror_ifも同じテスト実行における失敗行の総数を評価する。累積件数と単一実行件数という区別は存在しない。' WHERE id = 'card-dbt-ae-210-opt-3';

-- card-dbt-ae-211: YAML インデントエラー
UPDATE card_options SET explanation = '正解。columnsの子要素（- name: customer_id）はcolumnsより深いインデントが必要。問題のYAMLではcolumnsと同レベルにあるため、YAMLパーサーが正しく構造を解釈できない。' WHERE id = 'card-dbt-ae-211-opt-0';
UPDATE card_options SET explanation = 'dbt v1.8+ではdata_testsが正式な構文であり、testsは旧構文（後方互換あり）。data_testsの記述自体は正しい。' WHERE id = 'card-dbt-ae-211-opt-1';
UPDATE card_options SET explanation = 'uniqueとnot_nullは同時に使用可能であり、実際にプライマリキーのカラムでは両方を定義するのがベストプラクティスである。' WHERE id = 'card-dbt-ae-211-opt-2';
UPDATE card_options SET explanation = 'YAMLのリスト要素にはハイフンが必要である。modelsのリストからハイフンを除去するとパースエラーになる。' WHERE id = 'card-dbt-ae-211-opt-3';

-- card-dbt-ae-212: ephemeral モデルのデバッグ
UPDATE card_options SET explanation = 'ephemeralモデルでもdbt実行時にログは出力される。ログが出力されないことがデバッグ困難の主原因ではない。' WHERE id = 'card-dbt-ae-212-opt-0';
UPDATE card_options SET explanation = 'ephemeralモデルはCTEとしてインライン展開されるため、DWH上にテーブルやビューが作成されない。直接SELECTで結果を確認できず、デバッグが困難になる。' WHERE id = 'card-dbt-ae-212-opt-1';
UPDATE card_options SET explanation = 'dbt compileはephemeralモデルも含めてSQLを生成する。target/compiled/にコンパイル済みSQLが出力されるため、SQLの確認自体は可能。' WHERE id = 'card-dbt-ae-212-opt-2';
UPDATE card_options SET explanation = 'ephemeralモデルにもテストを定義できる。ただしテスト実行時はCTEとして展開された上でテストが実行される。' WHERE id = 'card-dbt-ae-212-opt-3';

-- card-dbt-ae-214: singular test で select count(*) の問題
UPDATE card_options SET explanation = 'singular testは失敗するレコード自体を返す必要がある。select count(*)は常に1行（数値）を返すため、0件でもテストが失敗扱いになってしまう。' WHERE id = 'card-dbt-ae-214-opt-0';
UPDATE card_options SET explanation = 'WHERE条件は total_amount < 0 で負の金額を検出しており、不正データの検出として正しい方向である。' WHERE id = 'card-dbt-ae-214-opt-1';
UPDATE card_options SET explanation = 'ref(''fct_orders'')の記述は正しいJinja構文であり、モデル名の指定に問題はない。' WHERE id = 'card-dbt-ae-214-opt-2';
UPDATE card_options SET explanation = 'singular testではFROM句を使用してテーブルからデータを取得するのが標準的な書き方であり、制限はない。' WHERE id = 'card-dbt-ae-214-opt-3';

-- card-dbt-ae-218: カスタム generic test のWHERE条件が逆
UPDATE card_options SET explanation = 'テストは失敗するレコード（負の値）を返すべきだが、WHERE column_name >= 0 は正常なレコードを返している。正しくは WHERE column_name < 0 とすべき。' WHERE id = 'card-dbt-ae-218-opt-0';
UPDATE card_options SET explanation = 'dbtではカスタムgeneric testの定義に{% test %}ブロックを使用するのが正しい構文である。{% macro test_<name> %}でも定義可能だが、{% test %}が推奨される。' WHERE id = 'card-dbt-ae-218-opt-1';
UPDATE card_options SET explanation = '{{ column_name }}でカラム名を展開する方法は正しい。column_nameはJinjaの変数としてそのまま参照できる。' WHERE id = 'card-dbt-ae-218-opt-2';
UPDATE card_options SET explanation = 'select *でなくても特定のカラムをSELECTすれば問題ない。テストは行が返るかどうかで判定されるため、SELECTする列は自由。' WHERE id = 'card-dbt-ae-218-opt-3';

-- card-dbt-ae-219: relationships テストの to と field
UPDATE card_options SET explanation = 'toはテスト対象テーブルではなく参照先モデルを指定する。テスト対象はYAMLでテストを定義したカラムのモデルである。' WHERE id = 'card-dbt-ae-219-opt-0';
UPDATE card_options SET explanation = 'relationshipsテストでは、toで外部キーの参照先モデル（例: ref(''dim_customers'')）を、fieldで参照先のカラム（例: customer_id）を指定し、参照整合性を検証する。' WHERE id = 'card-dbt-ae-219-opt-1';
UPDATE card_options SET explanation = 'relationshipsテストはデータの出力を行わない。toは参照先モデルの指定であり、出力先ではない。' WHERE id = 'card-dbt-ae-219-opt-2';
UPDATE card_options SET explanation = 'toはフィルタ条件ではなくモデル参照、fieldはカラム名の指定であり、集約関数とは無関係である。' WHERE id = 'card-dbt-ae-219-opt-3';

-- card-dbt-ae-220: dbt build でのテスト実行タイミング
UPDATE card_options SET explanation = 'dbt buildはモデルごとにテストを実行する。全モデル完了後にまとめてテストするのはdbt run + dbt testを別々に実行した場合の動作。' WHERE id = 'card-dbt-ae-220-opt-0';
UPDATE card_options SET explanation = 'dbt buildはDAGの順序に従い、各モデル実行直後にそのモデルのテストを実行する。テスト失敗時は下流モデルがスキップされるため、早期に問題を検出できる。' WHERE id = 'card-dbt-ae-220-opt-1';
UPDATE card_options SET explanation = 'dbt buildはモデル実行・テスト・seed・snapshotを統合的に実行するコマンドであり、テストも含まれる。' WHERE id = 'card-dbt-ae-220-opt-2';
UPDATE card_options SET explanation = 'テストの実行タイミングはDAGの依存関係に基づく。seedsの直後にまとめてテストが実行されるわけではない。' WHERE id = 'card-dbt-ae-220-opt-3';

-- card-dbt-ae-222: snapshot テーブルへのテスト
UPDATE card_options SET explanation = 'snapshotテーブルもYAMLでdata_testsを定義でき、generic test（unique, not_null等）もsingular testも通常のモデルと同様に実行可能。' WHERE id = 'card-dbt-ae-222-opt-0';
UPDATE card_options SET explanation = 'snapshotにもテストを定義できる。YAMLのsnapshotsセクションでdata_testsを記述すれば、dbt testで実行される。' WHERE id = 'card-dbt-ae-222-opt-1';
UPDATE card_options SET explanation = 'generic testだけでなくsingular testも実行可能。ref()でsnapshotを参照するsingular testを作成できる。' WHERE id = 'card-dbt-ae-222-opt-2';
UPDATE card_options SET explanation = 'singular testだけでなくgeneric test（unique, not_null, relationships等）もYAMLで定義して実行できる。' WHERE id = 'card-dbt-ae-222-opt-3';

-- card-dbt-ae-223: data_tests と tests の違い
UPDATE card_options SET explanation = '完全に同じエイリアスではない。data_testsはv1.8+で導入された新構文であり、testsは旧構文として後方互換性のため残されている。' WHERE id = 'card-dbt-ae-223-opt-0';
UPDATE card_options SET explanation = 'dbt v1.8でtests:がdata_tests:にリネームされた。旧tests:も後方互換性で動作するが、deprecation warningが表示される。' WHERE id = 'card-dbt-ae-223-opt-1';
UPDATE card_options SET explanation = 'testsとdata_testsはモデルレベル/カラムレベルの区別ではない。どちらもカラムレベルのプロパティとして使用され、data_testsがtestsの後継構文である。' WHERE id = 'card-dbt-ae-223-opt-2';
UPDATE card_options SET explanation = 'data_testsはカスタムテスト専用ではなく、unique, not_null等のビルトインgeneric testも含むすべてのデータテストに使用される。' WHERE id = 'card-dbt-ae-223-opt-3';

-- card-dbt-ae-224: dbt test --indirect-selection=eager
UPDATE card_options SET explanation = 'eager（デフォルト）は選択したモデルに関連するすべてのテスト（複数モデルにまたがるrelationshipsテスト等を含む）を実行する。' WHERE id = 'card-dbt-ae-224-opt-0';
UPDATE card_options SET explanation = '直接テストのみを実行するのは --indirect-selection=cautious の動作であり、eagerではない。' WHERE id = 'card-dbt-ae-224-opt-1';
UPDATE card_options SET explanation = 'indirect-selectionはテストの選択範囲を制御するオプションであり、実行順序の最適化とは無関係である。' WHERE id = 'card-dbt-ae-224-opt-2';
UPDATE card_options SET explanation = 'テストの並列実行は --threads オプションで制御する。indirect-selectionは並列実行とは無関係。' WHERE id = 'card-dbt-ae-224-opt-3';

-- card-dbt-ae-226: dbt snapshot --select my_snapshot
UPDATE card_options SET explanation = '--selectで指定したスナップショット（my_snapshot）のみが実行される。全スナップショットではなく、選択したものだけが対象となる。' WHERE id = 'card-dbt-ae-226-opt-0';
UPDATE card_options SET explanation = 'このコマンドはmy_snapshotという名前のスナップショット定義を実行する。モデルのスナップショットを新規作成するわけではない。' WHERE id = 'card-dbt-ae-226-opt-1';
UPDATE card_options SET explanation = 'dbt snapshotはスナップショットの実行コマンドであり、テストは実行しない。テストにはdbt testを使用する。' WHERE id = 'card-dbt-ae-226-opt-2';
UPDATE card_options SET explanation = 'dbt snapshotは履歴の表示機能はない。履歴データはDWH上のスナップショットテーブルに保存され、直接クエリして確認する。' WHERE id = 'card-dbt-ae-226-opt-3';

-- card-dbt-ae-227: unit test が検証するもの
UPDATE card_options SET explanation = 'データの品質（NULL、ユニーク等）の検証はdata_tests（generic test / singular test）の役割であり、unit testの目的ではない。' WHERE id = 'card-dbt-ae-227-opt-0';
UPDATE card_options SET explanation = 'unit testはモックデータを入力として与え、モデルのSQL変換ロジックが期待通りの出力を生成するかを検証する。ロジックの正しさを保証するテスト。' WHERE id = 'card-dbt-ae-227-opt-1';
UPDATE card_options SET explanation = 'DWHへの接続テストはunit testの目的ではない。unit testはモックデータを使うため、DWH接続の検証には向かない。' WHERE id = 'card-dbt-ae-227-opt-2';
UPDATE card_options SET explanation = 'ソースデータの鮮度チェックはsource freshness（dbt source freshness）の機能であり、unit testとは無関係。' WHERE id = 'card-dbt-ae-227-opt-3';

-- card-dbt-ae-231: unit test と data test の違い
UPDATE card_options SET explanation = 'unit testはモックデータでSQL変換ロジックを検証し、data testはDWH上の実データに対してクエリを実行して品質を検証する。' WHERE id = 'card-dbt-ae-231-opt-0';
UPDATE card_options SET explanation = '逆である。unit testがモックデータ、data testが実データを使用する。' WHERE id = 'card-dbt-ae-231-opt-1';
UPDATE card_options SET explanation = 'data testはDWH上の実データに対してクエリを実行するため、モックデータは使わない。' WHERE id = 'card-dbt-ae-231-opt-2';
UPDATE card_options SET explanation = 'unit testはモックデータを使用してロジックを検証するため、実データは使わない。' WHERE id = 'card-dbt-ae-231-opt-3';

-- card-dbt-ae-232: adapter.dispatch() の用途
UPDATE card_options SET explanation = 'adapter.dispatch()は異なるDWH（Snowflake, BigQuery, Redshift等）ごとに異なるSQL実装を選択的に呼び出すための仕組み。クロスデータベース互換マクロの開発に使用される。' WHERE id = 'card-dbt-ae-232-opt-0';
UPDATE card_options SET explanation = 'モデルの並列実行は --threads オプションで制御する。adapter.dispatch()は並列実行とは無関係。' WHERE id = 'card-dbt-ae-232-opt-1';
UPDATE card_options SET explanation = 'テストの非同期実行はadapter.dispatch()の機能ではない。dispatch()はアダプター固有のマクロ実装を切り替えるための仕組み。' WHERE id = 'card-dbt-ae-232-opt-2';
UPDATE card_options SET explanation = 'パッケージの依存関係解決はpackages.ymlとdbt depsの役割であり、adapter.dispatch()とは無関係。' WHERE id = 'card-dbt-ae-232-opt-3';

-- card-dbt-ae-237: deploy job と CI job の違い
UPDATE card_options SET explanation = 'deploy jobはスケジュール（cron）やWebhookでトリガーされ本番環境をビルドする。CI jobはPRの作成・更新でトリガーされ、変更モデルのみをビルド・テストする。' WHERE id = 'card-dbt-ae-237-opt-0';
UPDATE card_options SET explanation = 'deploy jobはスケジュール実行が主な用途であり手動のみではない。CI jobはPRトリガーであり、スケジュール実行ではない。' WHERE id = 'card-dbt-ae-237-opt-1';
UPDATE card_options SET explanation = 'deploy jobはモデルの実行もテストも行える。CI jobも同様にモデル実行とテストの両方を行う。機能による区別ではなくトリガー方法の違い。' WHERE id = 'card-dbt-ae-237-opt-2';
UPDATE card_options SET explanation = 'deploy jobとCI jobにはトリガー方法、対象範囲、目的に明確な違いがある。' WHERE id = 'card-dbt-ae-237-opt-3';

-- card-dbt-ae-238: store_failures_as の効果
UPDATE card_options SET explanation = 'store_failures_as: viewを指定すると、テスト失敗した行がDWH上にビューとして保存される。テーブルではなくビューのため、ストレージコストを抑えられる。' WHERE id = 'card-dbt-ae-238-opt-0';
UPDATE card_options SET explanation = 'テスト結果はDWH上のオブジェクト（テーブルまたはビュー）として保存される。JSONファイルとして保存する機能はない。' WHERE id = 'card-dbt-ae-238-opt-1';
UPDATE card_options SET explanation = 'store_failures_asはテスト失敗データの保存形式を指定するものであり、ビューを削除する機能ではない。' WHERE id = 'card-dbt-ae-238-opt-2';
UPDATE card_options SET explanation = 'store_failures_asはDWH上にオブジェクトを作成する設定であり、ログファイルへの出力とは無関係。' WHERE id = 'card-dbt-ae-238-opt-3';

-- card-dbt-ae-244: store_failures: true の効果
UPDATE card_options SET explanation = 'store_failures: trueはDWH上にテーブルを作成して失敗行を保存する。ログファイルへの保存ではない。' WHERE id = 'card-dbt-ae-244-opt-0';
UPDATE card_options SET explanation = 'テストで検出された失敗行がDWH上のテーブルに保存される。後からクエリして失敗データの原因を調査できるため、デバッグが容易になる。' WHERE id = 'card-dbt-ae-244-opt-1';
UPDATE card_options SET explanation = 'store_failures: trueは失敗データの保存機能であり、自動リトライ機能ではない。' WHERE id = 'card-dbt-ae-244-opt-2';
UPDATE card_options SET explanation = 'store_failures: trueはDWH上のテーブルに保存する機能であり、JSONファイルへの出力ではない。' WHERE id = 'card-dbt-ae-244-opt-3';

-- card-dbt-ae-245: dbt compile の目的
UPDATE card_options SET explanation = 'dbt compileはDWH上でモデルを実行しない。SQLの生成のみを行い、実際のデータベース操作は行わない。モデル実行にはdbt runを使う。' WHERE id = 'card-dbt-ae-245-opt-0';
UPDATE card_options SET explanation = 'Jinja/SQLテンプレートを実際のSQLに変換し、target/compiled/に出力する。ref()やマクロが正しく展開されているかのデバッグに有用。' WHERE id = 'card-dbt-ae-245-opt-1';
UPDATE card_options SET explanation = 'テストの実行はdbt testで行う。dbt compileはSQLの生成のみであり、テストは実行しない。' WHERE id = 'card-dbt-ae-245-opt-2';
UPDATE card_options SET explanation = 'パッケージの依存関係解決はdbt depsで行う。dbt compileはSQLのコンパイル（Jinja展開）が目的。' WHERE id = 'card-dbt-ae-245-opt-3';

-- card-dbt-ae-248: カスタム generic test の構文
UPDATE card_options SET explanation = '{% test test_name(model, column_name) %}が正しい構文。modelは必須引数、カラムレベルのテストではcolumn_nameも必須。失敗行を返すSQLを記述する。' WHERE id = 'card-dbt-ae-248-opt-0';
UPDATE card_options SET explanation = '{% macro test_name(model) %}でもgeneric testを定義可能だが、その場合はマクロ名をtest_で始める必要がある。{% test %}ブロックが推奨される正式な構文。' WHERE id = 'card-dbt-ae-248-opt-1';
UPDATE card_options SET explanation = '{% custom_test %}というJinjaブロックはdbtに存在しない。カスタムgeneric testには{% test %}ブロックを使用する。' WHERE id = 'card-dbt-ae-248-opt-2';
UPDATE card_options SET explanation = '{% def %}はJinja/dbtに存在しない構文。Pythonのdef文とは異なり、dbtでは{% test %}または{% macro %}を使用する。' WHERE id = 'card-dbt-ae-248-opt-3';

-- card-dbt-ae-253: dbt seed の適切な用途
UPDATE card_options SET explanation = 'dbt seedは大量データのロードには適さない。CSVファイルをINSERT文で処理するため、大量のトランザクションデータにはETLツールを使用すべき。' WHERE id = 'card-dbt-ae-253-opt-0';
UPDATE card_options SET explanation = 'dbt seedはプロジェクト内のCSVファイルをDWHにテーブルとしてロードする。国コードマッピングや状態遷移テーブルなど、小さな参照データに最適。' WHERE id = 'card-dbt-ae-253-opt-1';
UPDATE card_options SET explanation = 'ソースデータの鮮度チェックはdbt source freshnessコマンドの機能であり、dbt seedとは無関係。' WHERE id = 'card-dbt-ae-253-opt-2';
UPDATE card_options SET explanation = 'モデルのテスト実行はdbt testの機能。dbt seedはCSVデータのロードを行うコマンド。' WHERE id = 'card-dbt-ae-253-opt-3';

-- card-dbt-ae-264: Slim CI の仕組み
UPDATE card_options SET explanation = '全モデルを毎回ビルドするのは通常のCI実行であり、Slim CIの目的に反する。Slim CIは変更分のみをビルドして効率化する手法。' WHERE id = 'card-dbt-ae-264-opt-0';
UPDATE card_options SET explanation = 'Slim CIはstate:modifiedで変更モデルを検出し、--deferで未変更の上流は本番テーブルを参照する。変更分のみビルド・テストするため、CI時間とコストを大幅に削減できる。' WHERE id = 'card-dbt-ae-264-opt-1';
UPDATE card_options SET explanation = 'Slim CIではテストもスキップせず実行する。変更モデルとその下流のテストを含めて実行し、品質を担保する。' WHERE id = 'card-dbt-ae-264-opt-2';
UPDATE card_options SET explanation = 'Slim CIは並列実行数の調整ではなく、ビルド対象のモデル数を削減することで効率化する手法。' WHERE id = 'card-dbt-ae-264-opt-3';

-- card-dbt-ae-266: YAML パースエラー（コロン）
UPDATE card_options SET explanation = 'YAMLでは値の中にコロン(:)とスペースの組み合わせが含まれると、新たなキーとして解釈されパースエラーになる。クォートで囲む必要がある。' WHERE id = 'card-dbt-ae-266-opt-0';
UPDATE card_options SET explanation = 'このYAMLのcolumnsのインデントは正しい。問題はdescriptionの値に含まれるコロンにある。' WHERE id = 'card-dbt-ae-266-opt-1';
UPDATE card_options SET explanation = 'nameキーはmodelsとcolumnsで別のコンテキストで使われており、重複ではない。YAMLリストの各要素は独立したマッピング。' WHERE id = 'card-dbt-ae-266-opt-2';
UPDATE card_options SET explanation = 'descriptionはモデルレベルで使用可能であり、モデルの説明を記述するための標準的なプロパティ。' WHERE id = 'card-dbt-ae-266-opt-3';

-- card-dbt-ae-268: unit test の YAML 必須項目
UPDATE card_options SET explanation = 'model はunit testで必須。テスト対象のモデルを指定し、どのモデルのSQL変換ロジックを検証するかを定義する。' WHERE id = 'card-dbt-ae-268-opt-0';
UPDATE card_options SET explanation = 'given はunit testで必須。テスト対象モデルが参照するref/sourceごとにモックデータを定義し、入力データをシミュレートする。' WHERE id = 'card-dbt-ae-268-opt-1';
UPDATE card_options SET explanation = 'expect はunit testで必須。SQL変換ロジックの期待する出力行を定義し、実際の出力と比較して検証する。' WHERE id = 'card-dbt-ae-268-opt-2';
UPDATE card_options SET explanation = 'descriptionはunit testでは任意項目。テストの説明として有用だが、未設定でも実行可能。' WHERE id = 'card-dbt-ae-268-opt-3';
UPDATE card_options SET explanation = 'severityはunit testでは任意項目。テストの重要度を制御するオプションだが、必須ではない。' WHERE id = 'card-dbt-ae-268-opt-4';

-- card-dbt-ae-269: {% docs %} ブロックの目的
UPDATE card_options SET explanation = '{% docs %}ブロックは.mdファイルに長い説明文を定義し、YAMLのdescriptionから{{ doc("block_name") }}で参照する仕組み。複雑なフォーマットの説明に有用。' WHERE id = 'card-dbt-ae-269-opt-0';
UPDATE card_options SET explanation = 'SQLファイル内のコメント（-- や /* */）はdbtドキュメントには反映されない。{% docs %}ブロックは.mdファイルに記述する。' WHERE id = 'card-dbt-ae-269-opt-1';
UPDATE card_options SET explanation = 'テスト結果の自動生成は{% docs %}ブロックの機能ではない。{% docs %}は手動で記述するドキュメント定義の仕組み。' WHERE id = 'card-dbt-ae-269-opt-2';
UPDATE card_options SET explanation = '{% docs %}ブロックはdbt Cloudに限定されず、dbt CoreでもREADMEではなくモデル・カラムの説明文を定義するために使う。' WHERE id = 'card-dbt-ae-269-opt-3';

-- card-dbt-ae-270: dbt docs generate が生成するファイル
UPDATE card_options SET explanation = 'target/にcatalog.json（DWHメタデータ）とmanifest.json（プロジェクトメタデータ）が生成される。これらがドキュメントサイトのデータ源となる。' WHERE id = 'card-dbt-ae-270-opt-0';
UPDATE card_options SET explanation = 'dbt docs generateはHTMLファイルを直接生成しない。HTMLはdbt docs serveで提供され、データ源はJSONファイル。' WHERE id = 'card-dbt-ae-270-opt-1';
UPDATE card_options SET explanation = 'logs/ディレクトリにはdbtの実行ログが保存される。ドキュメントの出力先はtarget/である。' WHERE id = 'card-dbt-ae-270-opt-2';
UPDATE card_options SET explanation = 'target/compiled/にはdbt compileで生成されるコンパイル済みSQLが保存される。ドキュメント生成とは別の機能。' WHERE id = 'card-dbt-ae-270-opt-3';

-- card-dbt-ae-271: description を定義できる場所
UPDATE card_options SET explanation = 'YAMLファイルのdescription:フィールドに直接テキストを記述してドキュメントを定義できる。最も基本的な方法。' WHERE id = 'card-dbt-ae-271-opt-0';
UPDATE card_options SET explanation = 'SQLファイル内のコメント（-- や /* */）はdbtドキュメントには反映されない。descriptionはYAMLまたはdocsブロックで定義する。' WHERE id = 'card-dbt-ae-271-opt-1';
UPDATE card_options SET explanation = '{% docs %}ブロック（doc block）で長い説明文を.mdファイルに記述し、YAMLから{{ doc("name") }}で参照できる。複雑なフォーマットに適している。' WHERE id = 'card-dbt-ae-271-opt-2';
UPDATE card_options SET explanation = 'dbt_project.ymlのdocs:セクションはドキュメントサイトの設定（表示/非表示など）を制御するものであり、descriptionの定義場所ではない。' WHERE id = 'card-dbt-ae-271-opt-3';

-- card-dbt-ae-275: DAG リネージが自動表示される理由
UPDATE card_options SET explanation = 'ref()とsource()関数をSQL内で使用することで、dbtがモデル間の依存関係を自動パースしmanifest.jsonに記録する。これがDAGリネージグラフの基盤となる。' WHERE id = 'card-dbt-ae-275-opt-0';
UPDATE card_options SET explanation = 'dbtはDWHの外部キー情報を読み取らない。リネージはref()とsource()の使用からパースされる。' WHERE id = 'card-dbt-ae-275-opt-1';
UPDATE card_options SET explanation = 'depends_onの明示的な定義は通常不要。ref()とsource()がdependenciesを自動的に生成する。手動定義は特殊なケースのみ。' WHERE id = 'card-dbt-ae-275-opt-2';
UPDATE card_options SET explanation = 'クエリログの分析ではなく、dbtプロジェクトのJinjaテンプレート内のref()/source()をパースして依存関係を構築する。dbt Coreでも同様に動作する。' WHERE id = 'card-dbt-ae-275-opt-3';

-- card-dbt-ae-281: persist_docs の効果
UPDATE card_options SET explanation = 'persist_docsはドキュメントサイトの永続化ではなく、DWH側のテーブル/カラムコメントにdbt YAMLのdescriptionを反映する機能。' WHERE id = 'card-dbt-ae-281-opt-0';
UPDATE card_options SET explanation = 'persist_docs: { relation: true, columns: true }を設定すると、YAMLで定義したdescriptionがDWHのテーブル/カラムのCOMMENTとして反映される。' WHERE id = 'card-dbt-ae-281-opt-1';
UPDATE card_options SET explanation = 'persist_docsはGitへのコミットとは無関係。DWHのメタデータ（テーブル/カラムコメント）への反映機能。' WHERE id = 'card-dbt-ae-281-opt-2';
UPDATE card_options SET explanation = 'persist_docsはテスト結果をドキュメントに追加する機能ではない。YAMLのdescriptionをDWHのコメントに反映する機能。' WHERE id = 'card-dbt-ae-281-opt-3';

-- card-dbt-ae-284: dbt run --select source:stripe+
UPDATE card_options SET explanation = 'source:stripe+の「+」は下流を意味し、stripeソースを参照するすべてのモデルとさらにその下流モデルを選択して実行する。' WHERE id = 'card-dbt-ae-284-opt-0';
UPDATE card_options SET explanation = 'ソース自体はdbt runの実行対象ではない（ソースは外部テーブルの参照定義）。「+」サフィックスにより下流モデルが選択される。' WHERE id = 'card-dbt-ae-284-opt-1';
UPDATE card_options SET explanation = 'freshnessチェックはdbt source freshnessコマンドで実行する。dbt run --selectではモデルの実行のみ行う。' WHERE id = 'card-dbt-ae-284-opt-2';
UPDATE card_options SET explanation = 'source:stripeはstripeという名前のソース定義を指す。stripeパッケージのモデルを選択するにはpackage:stripeを使用する。' WHERE id = 'card-dbt-ae-284-opt-3';

-- card-dbt-ae-287: exposure の type に設定できる値
UPDATE card_options SET explanation = 'dashboardは有効なexposure typeである。BIツールのダッシュボードを表すために使用される。' WHERE id = 'card-dbt-ae-287-opt-0';
UPDATE card_options SET explanation = 'notebookは有効なexposure typeである。Jupyter Notebookなどの分析ノートブックを表すために使用される。' WHERE id = 'card-dbt-ae-287-opt-1';
UPDATE card_options SET explanation = 'reportはdbtのexposure typeとして定義されていない。有効な値はdashboard, notebook, analysis, ml, applicationの5つ。' WHERE id = 'card-dbt-ae-287-opt-2';
UPDATE card_options SET explanation = 'mlは有効なexposure typeである。機械学習モデルやMLパイプラインを表すために使用される。' WHERE id = 'card-dbt-ae-287-opt-3';
UPDATE card_options SET explanation = 'applicationは有効なexposure typeである。データを利用するアプリケーションを表すために使用される。' WHERE id = 'card-dbt-ae-287-opt-4';

-- card-dbt-ae-288: source freshness チェックの必須設定
UPDATE card_options SET explanation = 'databaseとschemaはソース定義の基本設定だが、freshnessチェック固有の必須項目ではない。' WHERE id = 'card-dbt-ae-288-opt-0';
UPDATE card_options SET explanation = 'loaded_at_fieldでデータの最終ロード時刻を示すタイムスタンプカラムを指定し、warn_after/error_afterで鮮度の閾値を設定する。この組み合わせがfreshnessチェックに必須。' WHERE id = 'card-dbt-ae-288-opt-1';
UPDATE card_options SET explanation = 'unique_keyとstrategyはsnapshot定義の設定項目であり、source freshnessチェックとは無関係。' WHERE id = 'card-dbt-ae-288-opt-2';
UPDATE card_options SET explanation = 'contractとaccessはモデルのガバナンス設定であり、source freshnessチェックの必須項目ではない。' WHERE id = 'card-dbt-ae-288-opt-3';

-- card-dbt-ae-290: exposure 定義の不足項目
UPDATE card_options SET explanation = 'ownerはexposure定義の必須項目であり、nameとemailを含むオブジェクトとして指定する。データの利用者を明確にするために必要。' WHERE id = 'card-dbt-ae-290-opt-0';
UPDATE card_options SET explanation = 'descriptionはexposureの任意項目。設定が推奨されるが、未設定でもバリデーションエラーにはならない。' WHERE id = 'card-dbt-ae-290-opt-1';
UPDATE card_options SET explanation = 'maturityはexposureの任意項目。high/medium/lowで利用先の成熟度を示すが必須ではない。' WHERE id = 'card-dbt-ae-290-opt-2';
UPDATE card_options SET explanation = 'urlはexposureの任意項目。ダッシュボードやアプリケーションのURLを指定できるが必須ではない。' WHERE id = 'card-dbt-ae-290-opt-3';

-- card-dbt-ae-296: exposure の目的
UPDATE card_options SET explanation = 'モデルの上流ソースを定義するのはsources（ソース定義）の役割であり、exposureではない。' WHERE id = 'card-dbt-ae-296-opt-0';
UPDATE card_options SET explanation = 'exposureはdbtモデルの下流の利用先（ダッシュボード、アプリ等）を定義する。モデル変更の影響範囲を可視化し、データリネージの完全な把握を可能にする。' WHERE id = 'card-dbt-ae-296-opt-1';
UPDATE card_options SET explanation = 'テスト結果の公開はexposureの目的ではない。テスト結果はdbt Cloudのジョブ実行ログやrun_results.jsonで確認する。' WHERE id = 'card-dbt-ae-296-opt-2';
UPDATE card_options SET explanation = 'モデルのアクセス権限設定はaccess（public/protected/private）の機能であり、exposureの目的ではない。' WHERE id = 'card-dbt-ae-296-opt-3';

-- card-dbt-ae-309: state:modified セレクター
UPDATE card_options SET explanation = 'state:modifiedは前回のstateアーティファクトと比較して変更されたリソースを選択する正しいセレクター構文。CI/CDでの変更検出に使用される。' WHERE id = 'card-dbt-ae-309-opt-0';
UPDATE card_options SET explanation = 'state:changedはdbtに存在しないセレクター。正しくはstate:modifiedを使用する。' WHERE id = 'card-dbt-ae-309-opt-1';
UPDATE card_options SET explanation = 'result:modifiedは存在しない。resultセレクターはresult:error, result:fail等、前回実行の結果ステータスで選択するもの。' WHERE id = 'card-dbt-ae-309-opt-2';
UPDATE card_options SET explanation = 'diff:changedはdbtに存在しないセレクター構文。状態比較にはstate:プレフィックスを使用する。' WHERE id = 'card-dbt-ae-309-opt-3';

-- card-dbt-ae-310: --defer / --state / state:modified の対応
UPDATE card_options SET explanation = '--deferは未ビルドの上流モデルを本番テーブルで代替し、--stateはアーティファクトのパスを指定し、state:modifiedは変更されたモデルのみを選択する。正しい対応関係。' WHERE id = 'card-dbt-ae-310-opt-0';
UPDATE card_options SET explanation = '--deferは変更モデルの選択ではなく未ビルドの上流を本番で代替する機能。各フラグの役割が誤って入れ替わっている。' WHERE id = 'card-dbt-ae-310-opt-1';
UPDATE card_options SET explanation = '--deferはパス指定ではなく本番テーブル代替機能。各フラグの役割の対応が誤り。' WHERE id = 'card-dbt-ae-310-opt-2';
UPDATE card_options SET explanation = '--deferは全モデル実行ではなく、未ビルドの上流を本番テーブルで代替する機能。--stateもキャッシュ利用ではなくアーティファクトパスの指定。' WHERE id = 'card-dbt-ae-310-opt-3';

-- card-dbt-ae-316: dbt retry が参照するファイル
UPDATE card_options SET explanation = 'dbt retryはrun_results.jsonを参照し、前回実行でerrorまたはskippedとなったリソースを特定して再実行する。' WHERE id = 'card-dbt-ae-316-opt-0';
UPDATE card_options SET explanation = 'manifest.jsonはプロジェクトの構造・依存関係の情報を含むが、実行結果のステータスは含まない。dbt retryが必要とするのはrun_results.json。' WHERE id = 'card-dbt-ae-316-opt-1';
UPDATE card_options SET explanation = 'catalog.jsonはDWHのメタデータ（テーブル定義、カラム情報等）を含むファイルであり、実行結果とは無関係。' WHERE id = 'card-dbt-ae-316-opt-2';
UPDATE card_options SET explanation = 'sources.jsonはsource freshnessの結果を含むファイル。dbt retryが参照するのはrun_results.json。' WHERE id = 'card-dbt-ae-316-opt-3';

-- card-dbt-ae-320: state:modified が検出しない変更
UPDATE card_options SET explanation = 'SQL本文の変更はstate:modifiedで検出される。ソースコードの差分比較によりSQLの変更が検知される。' WHERE id = 'card-dbt-ae-320-opt-0';
UPDATE card_options SET explanation = 'configの変更（materialized, tags等）もstate:modifiedで検出される。manifest.jsonの設定値の差分が比較される。' WHERE id = 'card-dbt-ae-320-opt-1';
UPDATE card_options SET explanation = 'state:modifiedはdbtプロジェクトのコード・設定の変更を検出するが、DWH上のデータの変更は検出しない。データ変更の検出にはsource freshnessや別の仕組みが必要。' WHERE id = 'card-dbt-ae-320-opt-2';
UPDATE card_options SET explanation = 'マクロの変更もstate:modifiedで検出される。マクロの内容が変わるとそれを参照するモデルもmodifiedとして検出される。' WHERE id = 'card-dbt-ae-320-opt-3';

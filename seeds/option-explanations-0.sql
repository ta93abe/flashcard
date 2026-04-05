-- Option explanations for cards chunk 0 (39 questions)
-- Generated for dbt Analytics Engineering certification flashcards

-- card-dbt-ae-001: on_schema_change 設定値
UPDATE card_options SET explanation = 'ignoreはon_schema_changeのデフォルト値であり、スキーマ変更を無視してそのまま処理を続行する。dbt公式ドキュメントに記載された有効な値である。' WHERE id = 'card-dbt-ae-001-opt-0';
UPDATE card_options SET explanation = 'failはスキーマ変更を検知した際にエラーを発生させる有効な値である。意図しないスキーマ変更を防止するために使用される。' WHERE id = 'card-dbt-ae-001-opt-1';
UPDATE card_options SET explanation = 'append_new_columnsは新しいカラムを既存テーブルに追加する有効な値である。カラムの削除は行わない。' WHERE id = 'card-dbt-ae-001-opt-2';
UPDATE card_options SET explanation = 'sync_all_columnsはカラムの追加と削除の両方を同期する有効な値である。最も積極的にスキーマを同期するオプションである。' WHERE id = 'card-dbt-ae-001-opt-3';
UPDATE card_options SET explanation = 'drop_and_recreateはon_schema_changeの有効な値ではない。テーブルを再作成したい場合は--full-refreshフラグを使用する。' WHERE id = 'card-dbt-ae-001-opt-4';

-- card-dbt-ae-002: source の identifier
UPDATE card_options SET explanation = 'identifierが指定されている場合、DWH上の実際のテーブル名はidentifierの値（stripe_payments_raw）になる。nameのpayments はdbt内部の論理名に過ぎない。' WHERE id = 'card-dbt-ae-002-opt-0';
UPDATE card_options SET explanation = 'sourceのnameはスキーマ（stripe）、identifierはDWH上の実テーブル名（stripe_payments_raw）を指定する。そのため参照先はstripe.stripe_payments_rawとなる。' WHERE id = 'card-dbt-ae-002-opt-1';
UPDATE card_options SET explanation = 'スキーマ名（source name）が省略されているため不正確である。source関数はschema.tableの形式でテーブルを参照する。' WHERE id = 'card-dbt-ae-002-opt-2';
UPDATE card_options SET explanation = 'スキーマ名（stripe）が省略されているため不正確である。dbtのsource関数はschema.identifierの形式で完全修飾名を生成する。' WHERE id = 'card-dbt-ae-002-opt-3';

-- card-dbt-ae-004: Jinja for ループのカンマ問題
UPDATE card_options SET explanation = 'ref()の引数は正しい。ref()はモデル名を文字列として受け取り、この記述に問題はない。' WHERE id = 'card-dbt-ae-004-opt-0';
UPDATE card_options SET explanation = 'forループ内で毎回カンマを出力するため、最後のカラム（email）の後にも不要なカンマが付きSQLエラーになる。loop.lastを使って最後の要素ではカンマを出力しないようにする必要がある。' WHERE id = 'card-dbt-ae-004-opt-1';
UPDATE card_options SET explanation = 'Jinjaのforループ構文は正しい。{% for item in list %}...{% endfor %}は有効なJinja構文である。' WHERE id = 'card-dbt-ae-004-opt-2';
UPDATE card_options SET explanation = 'dbtのSQLでカラム名をクォートで囲む必要は通常ない。予約語や特殊文字を含む場合のみ必要であり、id, name, emailは問題ない。' WHERE id = 'card-dbt-ae-004-opt-3';

-- card-dbt-ae-006: マクロの呼び出し方
UPDATE card_options SET explanation = '{{ }}は式を評価して結果を出力するJinja構文である。マクロはSQL断片を返すため、{{ macro_name(args) }}で呼び出してその結果をSQLに展開する。' WHERE id = 'card-dbt-ae-006-opt-0';
UPDATE card_options SET explanation = '{% %}はJinjaのステートメントタグであり、制御構文（if, for等）に使用する。マクロの戻り値をSQLに出力するには{{ }}を使う必要がある。' WHERE id = 'card-dbt-ae-006-opt-1';
UPDATE card_options SET explanation = 'Jinjaにcallキーワードを{{ }}内で使うマクロ呼び出し構文は存在しない。マクロは直接{{ macro_name(args) }}で呼び出す。' WHERE id = 'card-dbt-ae-006-opt-2';
UPDATE card_options SET explanation = '{% call %}はJinjaのcaller()と組み合わせるブロック構文であり、通常のマクロ呼び出しには使わない。dbtでは{{ macro_name(args) }}が標準的な呼び出し方法である。' WHERE id = 'card-dbt-ae-006-opt-3';

-- card-dbt-ae-007: --exclude の効果
UPDATE card_options SET explanation = '特定のモデルのみを実行するには--selectを使う。--excludeは除外のためのフラグであり、指定モデルを実行するものではない。' WHERE id = 'card-dbt-ae-007-opt-0';
UPDATE card_options SET explanation = '--excludeは指定したリソースを実行対象から除外し、それ以外のすべてのモデルを実行する。--selectと組み合わせて細かい制御も可能である。' WHERE id = 'card-dbt-ae-007-opt-1';
UPDATE card_options SET explanation = '--excludeは指定モデルのみを除外する。下流モデルも除外するには--exclude my_model+のようにグラフセレクターを使う必要がある。' WHERE id = 'card-dbt-ae-007-opt-2';
UPDATE card_options SET explanation = '--excludeはモデルを実行対象から除外するだけであり、テーブルやモデルファイルを削除する機能はない。' WHERE id = 'card-dbt-ae-007-opt-3';

-- card-dbt-ae-009: materialized view の特徴
UPDATE card_options SET explanation = 'materialized viewはDWH側でクエリ結果を物理的にキャッシュし、ソースデータの変更に応じて自動的に更新される。dbt実行時ではなくDWH側で管理される点が特徴である。' WHERE id = 'card-dbt-ae-009-opt-0';
UPDATE card_options SET explanation = 'dbt実行時に毎回再作成されるのはtable materializationの動作である。materialized viewはDWH側で自動的に更新されるため、毎回の再作成は不要である。' WHERE id = 'card-dbt-ae-009-opt-1';
UPDATE card_options SET explanation = 'materialized viewはすべてのDWHでサポートされているわけではない。BigQuery、Snowflake、Redshift等の主要DWHではサポートされるが、一部のプラットフォームでは未対応である。' WHERE id = 'card-dbt-ae-009-opt-2';
UPDATE card_options SET explanation = 'materialized viewはビューのようにクエリ定義を保持しつつ、テーブルのように結果をキャッシュするため、パフォーマンスとデータの鮮度を両立できる。' WHERE id = 'card-dbt-ae-009-opt-3';

-- card-dbt-ae-012: seed の column_types 設定
UPDATE card_options SET explanation = 'column_typesはデータ型を指定する設定であり、NOT NULL制約を追加する機能はない。dbtのseedではカラム制約の設定はサポートされていない。' WHERE id = 'card-dbt-ae-012-opt-0';
UPDATE card_options SET explanation = 'varchar(3)を明示的に指定することで、先頭ゼロ付きの国コード（例: 001）が数値型として誤って推論されるのを防ぐ。dbtの自動型推論をオーバーライドする。' WHERE id = 'card-dbt-ae-012-opt-1';
UPDATE card_options SET explanation = 'column_typesはカラムのデータ型を指定する設定であり、カラム名のリネームには使用できない。リネームにはSQLモデル内でASを使う。' WHERE id = 'card-dbt-ae-012-opt-2';
UPDATE card_options SET explanation = 'varchar(3)はDWH上のデータ型を指定するものであり、CSVデータの文字数を制限するバリデーション機能ではない。3文字を超えるデータがあれば挿入時にエラーになる可能性はあるが、それは目的ではない。' WHERE id = 'card-dbt-ae-012-opt-3';

-- card-dbt-ae-013: grants config の用途
UPDATE card_options SET explanation = 'grants configはモデルのビルド後にDWH上のテーブル/ビューに対してGRANT文を自動実行し、指定したロールにSELECT等の権限を付与する。' WHERE id = 'card-dbt-ae-013-opt-0';
UPDATE card_options SET explanation = 'grants configはDWH上のオブジェクトに対する権限を管理するものであり、dbtプロジェクト自体のアクセス権管理は別の仕組み（dbt Cloud等）で行う。' WHERE id = 'card-dbt-ae-013-opt-1';
UPDATE card_options SET explanation = 'Gitリポジトリの権限はGitHub/GitLab等のプラットフォーム側で管理するものであり、dbtのgrants configとは無関係である。' WHERE id = 'card-dbt-ae-013-opt-2';
UPDATE card_options SET explanation = 'APIキーの権限管理はdbt Cloudの管理画面やCI/CDツールで行うものであり、grants configはDWH上のテーブル権限を管理する設定である。' WHERE id = 'card-dbt-ae-013-opt-3';

-- card-dbt-ae-014: --full-refresh の動作
UPDATE card_options SET explanation = '--full-refreshを指定するとis_incremental()がFalseを返すため、WHERE句は適用されず全データが処理される。差分処理は通常の増分実行時のみ行われる。' WHERE id = 'card-dbt-ae-014-opt-0';
UPDATE card_options SET explanation = '--full-refreshではis_incremental()がFalseを返し、{% if is_incremental() %}ブロック内のWHERE句がスキップされる。テーブルはDROPされて全データから再作成される。' WHERE id = 'card-dbt-ae-014-opt-1';
UPDATE card_options SET explanation = 'このモデルのSQL構文は正しい。is_incremental()による条件分岐は有効なJinja構文であり、コンパイルエラーは発生しない。' WHERE id = 'card-dbt-ae-014-opt-2';
UPDATE card_options SET explanation = '--full-refreshはテーブルを再作成するフラグであり、カラムの追加とは無関係である。カラム追加はon_schema_changeの設定で制御する。' WHERE id = 'card-dbt-ae-014-opt-3';

-- card-dbt-ae-018: microbatch の batch_size
UPDATE card_options SET explanation = 'hourはbatch_sizeの有効な値である。時間単位でバッチを分割して処理する。' WHERE id = 'card-dbt-ae-018-opt-0';
UPDATE card_options SET explanation = 'dayはbatch_sizeの有効な値であり、最も一般的に使用される粒度である。日次でバッチを分割して処理する。' WHERE id = 'card-dbt-ae-018-opt-1';
UPDATE card_options SET explanation = 'monthはbatch_sizeの有効な値である。月単位でバッチを分割して処理する。' WHERE id = 'card-dbt-ae-018-opt-2';
UPDATE card_options SET explanation = 'yearはbatch_sizeの有効な値である。年単位でバッチを分割して処理する。' WHERE id = 'card-dbt-ae-018-opt-3';
UPDATE card_options SET explanation = 'minuteはbatch_sizeの有効な値ではない。粒度が細かすぎるためサポートされておらず、hour, day, month, yearのみが設定可能である。' WHERE id = 'card-dbt-ae-018-opt-4';

-- card-dbt-ae-020: tags の設定方法
UPDATE card_options SET explanation = 'dbt_project.ymlでフォルダ単位に+tags設定を行うのは正しい方法である。+プレフィックスでconfig値を指定し、配下の全モデルにタグを適用できる。' WHERE id = 'card-dbt-ae-020-opt-0';
UPDATE card_options SET explanation = 'モデルのSQL内で{{ config(tags=[''nightly'']) }}と記述してタグを設定するのは正しい方法である。個別のモデルにタグを付与できる。' WHERE id = 'card-dbt-ae-020-opt-1';
UPDATE card_options SET explanation = 'YAMLのcolumns配下にtagsを設定する方法は標準的ではない。tagsはリソースレベルの設定であり、カラムレベルでの設定は一般的な用途では使用しない。' WHERE id = 'card-dbt-ae-020-opt-2';
UPDATE card_options SET explanation = 'packages.ymlはパッケージの依存関係を定義するファイルであり、tagsの設定はできない。tagsはdbt_project.ymlまたはモデル内のconfig()で設定する。' WHERE id = 'card-dbt-ae-020-opt-3';

-- card-dbt-ae-022: adapter.get_relation()
UPDATE card_options SET explanation = 'adapter.get_relation()はDWH上に指定したテーブルやビューが存在するかを確認する。存在すればRelationオブジェクトを返し、存在しなければNoneを返す。' WHERE id = 'card-dbt-ae-022-opt-0';
UPDATE card_options SET explanation = 'adapter.get_relation()はテーブル間のリレーションシップ（外部キー等）を定義する機能ではない。リレーションシップの定義にはrelationshipsテストを使用する。' WHERE id = 'card-dbt-ae-022-opt-1';
UPDATE card_options SET explanation = 'adapter.get_relation()はテーブルの存在確認を行うだけであり、新しいテーブルの作成は行わない。テーブル作成はmaterializationの仕組みで行われる。' WHERE id = 'card-dbt-ae-022-opt-2';
UPDATE card_options SET explanation = 'adapter.get_relation()はテーブルの存在確認のみを行う読み取り専用の操作であり、スキーマの変更は行わない。' WHERE id = 'card-dbt-ae-022-opt-3';

-- card-dbt-ae-023: CTEリファクタリングパターン
UPDATE card_options SET explanation = 'サブクエリのネストは可読性が低く、dbtのベストプラクティスでは推奨されない。CTEを使った方が読みやすく保守しやすい。' WHERE id = 'card-dbt-ae-023-opt-0';
UPDATE card_options SET explanation = 'import CTEパターンでは、各ref()をWITH句のCTEとして冒頭で定義し、最後にfinal CTEで結合する。dbtの公式スタイルガイドで推奨されるベストプラクティスである。' WHERE id = 'card-dbt-ae-023-opt-1';
UPDATE card_options SET explanation = '各ref()を個別のビューに分離するのは過度な分割であり、不要なDWHオブジェクトが増える。CTEでモデル内の可読性を向上させる方が適切である。' WHERE id = 'card-dbt-ae-023-opt-2';
UPDATE card_options SET explanation = 'UNION ALLは複数のテーブルを縦に結合するための構文であり、JOINによるテーブル結合のリファクタリングパターンとしては不適切である。' WHERE id = 'card-dbt-ae-023-opt-3';

-- card-dbt-ae-024: --full-refresh の影響対象
UPDATE card_options SET explanation = 'table materializationは毎回テーブルをDROPして再作成するため、--full-refreshの有無で動作は変わらない。' WHERE id = 'card-dbt-ae-024-opt-0';
UPDATE card_options SET explanation = 'view materializationはCREATE OR REPLACE VIEWを実行するだけのため、--full-refreshの有無で動作は変わらない。' WHERE id = 'card-dbt-ae-024-opt-1';
UPDATE card_options SET explanation = 'incremental materializationのみ--full-refreshで動作が変わる。通常は差分処理だが、--full-refreshではテーブルをDROPして全データを再処理する。' WHERE id = 'card-dbt-ae-024-opt-2';
UPDATE card_options SET explanation = 'ephemeral materializationはDWHにオブジェクトを作成せずCTEとしてインライン展開されるため、--full-refreshの影響を受けない。' WHERE id = 'card-dbt-ae-024-opt-3';

-- card-dbt-ae-025: pre-hook / post-hook の設定方法
UPDATE card_options SET explanation = 'config()ブロック内でpre_hookおよびpost_hookを文字列またはリストで指定するのが正しい方法である。例: {{ config(pre_hook="GRANT SELECT ON ...") }}' WHERE id = 'card-dbt-ae-025-opt-0';
UPDATE card_options SET explanation = '{% pre_hook %}...{% endpre_hook %}というJinjaブロック構文はdbtには存在しない。pre_hookはconfig()内で設定する。' WHERE id = 'card-dbt-ae-025-opt-1';
UPDATE card_options SET explanation = 'SQLコメント形式（-- pre-hook:）でフックを設定する機能はdbtには存在しない。dbtのconfig()を使用する必要がある。' WHERE id = 'card-dbt-ae-025-opt-2';
UPDATE card_options SET explanation = '{{ pre_hook("SQL文") }}というマクロ呼び出し形式はdbtには存在しない。pre_hookはconfig()ブロック内のパラメータとして設定する。' WHERE id = 'card-dbt-ae-025-opt-3';

-- card-dbt-ae-027: source の identifier 設定の用途
UPDATE card_options SET explanation = 'identifierはDWH上のテーブル名を指定するものであり、一意のIDを付与する機能ではない。ソースの一意性はnameで管理される。' WHERE id = 'card-dbt-ae-027-opt-0';
UPDATE card_options SET explanation = 'nameはdbt内の論理名、identifierはDWH上の実際のテーブル名を指定する。テーブル名がnameと異なる場合にidentifierで実テーブル名をマッピングする。' WHERE id = 'card-dbt-ae-027-opt-1';
UPDATE card_options SET explanation = 'エイリアスの概念に近いが、identifierはdbt内のエイリアスではなくDWH上の実テーブル名を指定するものである。dbt内ではあくまでnameで参照する。' WHERE id = 'card-dbt-ae-027-opt-2';
UPDATE card_options SET explanation = 'identifierはテーブル名の指定であり、バージョン管理の機能はない。dbtにはモデルのバージョニング機能が別途存在する。' WHERE id = 'card-dbt-ae-027-opt-3';

-- card-dbt-ae-028: seed の column_types 設定の用途
UPDATE card_options SET explanation = 'column_typesはCSVカラムのDWH上のデータ型を明示的に指定する設定である。dbtの自動型推論が不適切な場合に使用する。' WHERE id = 'card-dbt-ae-028-opt-0';
UPDATE card_options SET explanation = 'column_typesはデータ型の指定であり、カラムの表示順序を制御する機能はない。表示順序はCSVファイルのカラム順で決まる。' WHERE id = 'card-dbt-ae-028-opt-1';
UPDATE card_options SET explanation = 'column_typesはデータ型の指定であり、インデックスの追加はできない。インデックスはpost-hookでDDLを実行するか、DWH固有の設定を使用する。' WHERE id = 'card-dbt-ae-028-opt-2';
UPDATE card_options SET explanation = 'column_typesはデータ型の指定であり、デフォルト値の設定はできない。dbtのseedにはデフォルト値を設定する機能はない。' WHERE id = 'card-dbt-ae-028-opt-3';

-- card-dbt-ae-033: {{ target }} 変数
UPDATE card_options SET explanation = 'target.nameはprofiles.ymlで定義されたターゲット名（dev, prod等）を返す。環境ごとの条件分岐に頻繁に使用される。' WHERE id = 'card-dbt-ae-033-opt-0';
UPDATE card_options SET explanation = 'target.schemaはprofiles.ymlで設定されたデフォルトスキーマ名を返す。モデルの出力先スキーマの基準として使用される。' WHERE id = 'card-dbt-ae-033-opt-1';
UPDATE card_options SET explanation = 'target.databaseはprofiles.ymlで設定されたデータベース名を返す。マルチデータベース環境での参照先制御に使用される。' WHERE id = 'card-dbt-ae-033-opt-2';
UPDATE card_options SET explanation = 'targetオブジェクトにはパスワードは含まれない。セキュリティ上の理由から、認証情報はJinjaテンプレート内で参照できないようになっている。' WHERE id = 'card-dbt-ae-033-opt-3';

-- card-dbt-ae-034: dbt run-operation の引数渡し
UPDATE card_options SET explanation = '--argsフラグでYAML/JSON形式の辞書を渡すのが正しい構文である。例: dbt run-operation my_macro --args ''{\"key\": \"value\"}''' WHERE id = 'card-dbt-ae-034-opt-0';
UPDATE card_options SET explanation = 'key=value形式の引数渡しはdbt run-operationではサポートされていない。--argsフラグでYAML/JSON形式を使用する必要がある。' WHERE id = 'card-dbt-ae-034-opt-1';
UPDATE card_options SET explanation = '--key value形式のフラグはdbt run-operationではサポートされていない。引数は--argsフラグに続けてYAML/JSON辞書で渡す。' WHERE id = 'card-dbt-ae-034-opt-2';
UPDATE card_options SET explanation = 'my_macro(key=value)のような関数呼び出し形式はCLIコマンドとして無効である。マクロへの引数は--argsフラグで渡す。' WHERE id = 'card-dbt-ae-034-opt-3';

-- card-dbt-ae-035: dbt_project.yml のフォルダ別 materialization
UPDATE card_options SET explanation = 'この設定はdbt_project.ymlでフォルダ単位にデフォルト値を指定したものであり、個別モデル内のconfig()ではない。config()はモデルファイル内で使用する。' WHERE id = 'card-dbt-ae-035-opt-0';
UPDATE card_options SET explanation = 'dbt_project.ymlのmodelsセクションでフォルダパスに対応するキー配下に+materializedを設定することで、フォルダごとにデフォルトのmaterializationを指定している。' WHERE id = 'card-dbt-ae-035-opt-1';
UPDATE card_options SET explanation = 'dbtのデフォルトmaterializationはviewであり、staging/martsでview/tableに自動的に分かれることはない。明示的な設定が必要である。' WHERE id = 'card-dbt-ae-035-opt-2';
UPDATE card_options SET explanation = 'profiles.ymlのターゲット設定にはmaterializationの指定機能はない。materializationはdbt_project.ymlまたはモデル内のconfig()で設定する。' WHERE id = 'card-dbt-ae-035-opt-3';

-- card-dbt-ae-038: dbt run-operation の用途
UPDATE card_options SET explanation = '全モデルの実行はdbt runコマンドで行う。dbt run-operationはマクロの直接呼び出し専用であり、モデルのビルドは行わない。' WHERE id = 'card-dbt-ae-038-opt-0';
UPDATE card_options SET explanation = 'dbt run-operationは指定したマクロをモデルのビルドなしで直接実行するコマンドである。権限付与やメンテナンス作業などのアドホックな操作に使用する。' WHERE id = 'card-dbt-ae-038-opt-1';
UPDATE card_options SET explanation = '失敗したモデルの再実行にはdbt retryコマンドを使用する。dbt run-operationはマクロの実行専用である。' WHERE id = 'card-dbt-ae-038-opt-2';
UPDATE card_options SET explanation = 'データベース操作のログ出力にはdbt debugやログファイルを使用する。dbt run-operationはマクロの直接実行に特化したコマンドである。' WHERE id = 'card-dbt-ae-038-opt-3';

-- card-dbt-ae-039: 設定優先順位
UPDATE card_options SET explanation = 'dbt_project.yml（最低）→ YAMLプロパティ → SQL内のconfig()→ コマンドラインフラグ（最高）の順が正しい。より具体的な設定が優先される。' WHERE id = 'card-dbt-ae-039-opt-0';
UPDATE card_options SET explanation = '優先順位が逆である。コマンドラインフラグは最高優先度であり、dbt_project.ymlは最低優先度である。' WHERE id = 'card-dbt-ae-039-opt-1';
UPDATE card_options SET explanation = '順序が正しくない。dbt_project.ymlはYAMLプロパティより低い優先度を持ち、コマンドラインフラグはconfig()より高い優先度を持つ。' WHERE id = 'card-dbt-ae-039-opt-2';
UPDATE card_options SET explanation = '順序が正しくない。config()はdbt_project.ymlより高い優先度を持つが、コマンドラインフラグが最高優先度である。' WHERE id = 'card-dbt-ae-039-opt-3';

-- card-dbt-ae-041: dispatch 設定
UPDATE card_options SET explanation = 'dispatch設定はマクロを無効化するのではなく、検索順序を制御する。オーバーライドが見つからなければデフォルト実装が使用される。' WHERE id = 'card-dbt-ae-041-opt-0';
UPDATE card_options SET explanation = 'search_orderでmy_projectを先に指定することで、dbt_utilsのマクロ呼び出し時にまずmy_project内のオーバーライド実装を検索し、なければdbt_utilsのデフォルトを使用する。' WHERE id = 'card-dbt-ae-041-opt-1';
UPDATE card_options SET explanation = 'dispatch設定はマクロの検索順序を制御するものであり、名前空間への登録は行わない。my_projectのマクロはmy_projectの名前空間に留まる。' WHERE id = 'card-dbt-ae-041-opt-2';
UPDATE card_options SET explanation = 'dispatch設定はマクロの実行順序ではなく検索順序を制御する。両方のマクロが順に実行されるわけではなく、最初に見つかった実装のみが使用される。' WHERE id = 'card-dbt-ae-041-opt-3';

-- card-dbt-ae-042: Jinja の比較演算子
UPDATE card_options SET explanation = 'target.nameはJinjaテンプレート内で参照可能な変数である。targetオブジェクトはdbtの実行コンテキストで常に利用できる。' WHERE id = 'card-dbt-ae-042-opt-0';
UPDATE card_options SET explanation = 'Jinjaでは=は代入演算子であり、条件比較には==を使う必要がある。{% if target.name == ''prod'' %}が正しい構文である。' WHERE id = 'card-dbt-ae-042-opt-1';
UPDATE card_options SET explanation = '{% endif %}はコード内に正しく記述されている。構文上の問題は比較演算子にある。' WHERE id = 'card-dbt-ae-042-opt-2';
UPDATE card_options SET explanation = 'ref()の引数にシングルクォートを使うのは正しい。Jinjaでは文字列にシングルクォートとダブルクォートの両方が使用できる。' WHERE id = 'card-dbt-ae-042-opt-3';

-- card-dbt-ae-044: snapshot のメタカラム
UPDATE card_options SET explanation = 'dbt_valid_fromはsnapshotが自動追加するメタカラムであり、レコードが有効になった日時を記録する。SCD Type 2の有効期間管理に使用される。' WHERE id = 'card-dbt-ae-044-opt-0';
UPDATE card_options SET explanation = 'dbt_valid_toはsnapshotが自動追加するメタカラムであり、レコードが無効になった日時を記録する。現在有効なレコードはNULLとなる。' WHERE id = 'card-dbt-ae-044-opt-1';
UPDATE card_options SET explanation = 'dbt_updated_atはsnapshotが自動追加するメタカラムであり、dbtが検出した更新日時を記録する。' WHERE id = 'card-dbt-ae-044-opt-2';
UPDATE card_options SET explanation = 'dbt_created_atはsnapshotが追加するメタカラムには存在しない。作成日時はdbt_valid_fromで記録される。' WHERE id = 'card-dbt-ae-044-opt-3';
UPDATE card_options SET explanation = 'dbt_scd_idはsnapshotが自動追加するメタカラムであり、SCD Type 2レコードの一意なサロゲートキーとして機能する。' WHERE id = 'card-dbt-ae-044-opt-4';

-- card-dbt-ae-045: microbatch の必須設定
UPDATE card_options SET explanation = 'unique_keyはmerge strategyで重複排除に使用されるが、microbatch strategyの必須設定ではない。microbatchではevent_timeが必須である。' WHERE id = 'card-dbt-ae-045-opt-0';
UPDATE card_options SET explanation = 'event_timeはmicrobatch strategyの必須設定であり、この列の値に基づいてデータをバッチに分割して処理する。時系列データの効率的な処理に使用される。' WHERE id = 'card-dbt-ae-045-opt-1';
UPDATE card_options SET explanation = 'check_colsはcheck strategyで変更検知に使用されるカラムを指定する設定であり、microbatch strategyとは無関係である。' WHERE id = 'card-dbt-ae-045-opt-2';
UPDATE card_options SET explanation = 'updated_atはsnapshot のtimestamp strategyで使用される設定であり、microbatch strategyの必須設定ではない。microbatchではevent_timeを使用する。' WHERE id = 'card-dbt-ae-045-opt-3';

-- card-dbt-ae-046: generate_schema_name マクロ
UPDATE card_options SET explanation = 'target.nameがprodの場合、if文の条件が真となりcustom_schema_nameがそのまま返される。例えばcustom_schema_nameがanalyticsならスキーマ名はanalyticsとなる。' WHERE id = 'card-dbt-ae-046-opt-0';
UPDATE card_options SET explanation = 'target.schema + _ + custom_schema_nameの形式はelse節（prod以外の環境）で使用される。prod環境ではcustom_schema_nameのみが返される。' WHERE id = 'card-dbt-ae-046-opt-1';
UPDATE card_options SET explanation = 'target.schemaがそのまま使われるのではなく、custom_schema_nameが返される。target.schemaはprod以外の環境でプレフィックスとして使用される。' WHERE id = 'card-dbt-ae-046-opt-2';
UPDATE card_options SET explanation = 'custom_schema_nameが設定されていればその値が返されるため空にはならない。ただしcustom_schema_nameが未設定（空）の場合は空文字列になる可能性がある。' WHERE id = 'card-dbt-ae-046-opt-3';

-- card-dbt-ae-047: グラフセレクター +N
UPDATE card_options SET explanation = 'my_model+2はmy_modelとその2ホップ先までの下流モデルを選択するグラフセレクター構文である。+の後の数字でホップ数を制限できる。' WHERE id = 'card-dbt-ae-047-opt-0';
UPDATE card_options SET explanation = '+2はグラフの下流ホップ数を指定する構文であり、モデルの実行回数を指定するものではない。' WHERE id = 'card-dbt-ae-047-opt-1';
UPDATE card_options SET explanation = '+2はグラフセレクターのホップ数であり、モデルのバージョン指定ではない。バージョン指定にはv:構文を使用する。' WHERE id = 'card-dbt-ae-047-opt-2';
UPDATE card_options SET explanation = '+2は下流ホップ数の制限であり、実行するモデルの数を指定するものではない。実際に実行されるモデル数はDAGの構造に依存する。' WHERE id = 'card-dbt-ae-047-opt-3';

-- card-dbt-ae-048: sources.yml の問題点
UPDATE card_options SET explanation = 'テーブル名とsource名の重複自体はエラーではない。問題は同一スキーマの複数テーブルを別々のsourceとして定義している点にある。' WHERE id = 'card-dbt-ae-048-opt-0';
UPDATE card_options SET explanation = 'sourceはdatabase + schemaの組み合わせに対応するため、同一スキーマのテーブルは1つのsource配下にtablesとしてまとめるべきである。これによりschemaやdatabaseの設定を一箇所で管理できる。' WHERE id = 'card-dbt-ae-048-opt-1';
UPDATE card_options SET explanation = 'schemaプロパティが未指定の場合、source nameがスキーマ名として使用される。これは必須プロパティではないが、明確にするために指定するのがベストプラクティスである。主な問題は構造の冗長性にある。' WHERE id = 'card-dbt-ae-048-opt-2';
UPDATE card_options SET explanation = 'identifierはnameとDWH上のテーブル名が異なる場合にのみ必要であり、ここではnameとテーブル名が一致しているため不要である。' WHERE id = 'card-dbt-ae-048-opt-3';

-- card-dbt-ae-051: quoting 設定
UPDATE card_options SET explanation = 'quoting設定はSQL内の文字列リテラルではなく、dbtが生成するSQLでのデータベース名・スキーマ名・識別子名のクォートを制御する。' WHERE id = 'card-dbt-ae-051-opt-0';
UPDATE card_options SET explanation = 'quoting設定はdbtが生成するSQLでdatabase、schema、identifierをクォート（例: "my_schema"）するかどうかを制御する。大文字小文字の区別が必要な場合等に使用する。' WHERE id = 'card-dbt-ae-051-opt-1';
UPDATE card_options SET explanation = 'YAML内のクォート方法はYAMLの仕様で決まるものであり、dbtのquoting設定とは無関係である。' WHERE id = 'card-dbt-ae-051-opt-2';
UPDATE card_options SET explanation = 'Jinjaテンプレート内のクォートはJinjaの構文で制御されるものであり、dbtのquoting設定はDWH上のオブジェクト名のクォートを制御する。' WHERE id = 'card-dbt-ae-051-opt-3';

-- card-dbt-ae-053: path: セレクター
UPDATE card_options SET explanation = 'path:セレクターは指定したディレクトリパス内のすべてのリソースを選択する。models/staging配下の全モデルが実行対象となる。' WHERE id = 'card-dbt-ae-053-opt-0';
UPDATE card_options SET explanation = 'path:はディレクトリパスでフィルタリングするセレクターであり、モデル名でのフィルタリングではない。モデル名で選択するにはモデル名を直接指定する。' WHERE id = 'card-dbt-ae-053-opt-1';
UPDATE card_options SET explanation = 'ソースを参照するモデルを選択するにはsource:セレクターを使用する。path:はファイルシステムのパスでフィルタリングする。' WHERE id = 'card-dbt-ae-053-opt-2';
UPDATE card_options SET explanation = 'タグでモデルを選択するにはtag:セレクターを使用する。path:はファイルパスでフィルタリングするセレクターである。' WHERE id = 'card-dbt-ae-053-opt-3';

-- card-dbt-ae-059: incremental materialization
UPDATE card_options SET explanation = 'incremental materializationは大量データで新規行が追加されるパターンに最適である。毎回全テーブルを再構築せず、新規データのみを処理するためコストと時間を削減できる。' WHERE id = 'card-dbt-ae-059-opt-0';
UPDATE card_options SET explanation = '毎回全テーブルが再構築されるのはtable materializationの動作である。incrementalは差分データのみを処理する。' WHERE id = 'card-dbt-ae-059-opt-1';
UPDATE card_options SET explanation = 'on_schema_change設定（append_new_columns, sync_all_columns等）でスキーマ変更に対応できるため、必ずDROPして再構築する必要はない。--full-refreshは任意で使用する。' WHERE id = 'card-dbt-ae-059-opt-2';
UPDATE card_options SET explanation = 'is_incremental()マクロは差分処理のWHERE句を条件分岐するために使用するのが一般的なパターンである。使わなくても動作はするが、効果的な差分処理には不可欠である。' WHERE id = 'card-dbt-ae-059-opt-3';
UPDATE card_options SET explanation = 'データの大部分が毎回更新されるケースではincremental materializationのメリットが薄い。その場合はtable materializationの方が適切である。' WHERE id = 'card-dbt-ae-059-opt-4';

-- card-dbt-ae-064: Python モデルの materialization
UPDATE card_options SET explanation = 'table materializationはPythonモデルで使用可能である。Pythonモデルはデータフレームを返し、テーブルとして実体化できる。' WHERE id = 'card-dbt-ae-064-opt-0';
UPDATE card_options SET explanation = 'incremental materializationはPythonモデルで使用可能である。差分処理のロジックをPythonで記述できる。' WHERE id = 'card-dbt-ae-064-opt-1';
UPDATE card_options SET explanation = 'view materializationはPythonモデルでは使用できない。PythonコードはSQLビューとして定義できないため、tableまたはincrementalのみがサポートされる。ephemeralも同様に不可。' WHERE id = 'card-dbt-ae-064-opt-2';
UPDATE card_options SET explanation = 'tableとincremental の両方ともPythonモデルで使用可能であるため、「AとBの両方」が使用できないという記述は誤りである。' WHERE id = 'card-dbt-ae-064-opt-3';

-- card-dbt-ae-065: is_incremental() が True を返す条件
UPDATE card_options SET explanation = 'materializationがincrementalであることはis_incremental()がTrueを返す3つの必須条件の1つである。' WHERE id = 'card-dbt-ae-065-opt-0';
UPDATE card_options SET explanation = 'ターゲットテーブルがDWHに既に存在することはis_incremental()がTrueを返す3つの必須条件の1つである。初回実行時はテーブルが存在しないためFalseとなる。' WHERE id = 'card-dbt-ae-065-opt-1';
UPDATE card_options SET explanation = '--full-refreshフラグが付いていないことはis_incremental()がTrueを返す3つの必須条件の1つである。--full-refresh時はFalseとなり全データが再処理される。' WHERE id = 'card-dbt-ae-065-opt-2';
UPDATE card_options SET explanation = '前回の実行が成功しているかどうかはis_incremental()の条件に含まれない。テーブルがDWHに存在するかのみが確認され、前回の実行結果は参照されない。' WHERE id = 'card-dbt-ae-065-opt-3';

-- card-dbt-ae-070: selector YAML 定義
UPDATE card_options SET explanation = 'selector YAMLはモデル選択のルールを定義するものであり、cron式によるスケジュール設定の機能はない。スケジューリングはdbt CloudやCI/CDツールで行う。' WHERE id = 'card-dbt-ae-070-opt-0';
UPDATE card_options SET explanation = 'selectors.ymlで名前付きセレクターを定義すると、dbt run --selector nightly_runのように--selectorフラグで呼び出せる。複雑な選択条件を再利用可能な形で定義できる。' WHERE id = 'card-dbt-ae-070-opt-1';
UPDATE card_options SET explanation = 'selector定義はモデル、テスト、スナップショット等のあらゆるリソースの選択に使用でき、テストの実行対象に限定されるものではない。' WHERE id = 'card-dbt-ae-070-opt-2';
UPDATE card_options SET explanation = 'ソースのfreshnessチェック対象はdbt source freshness --selectで指定する。selector YAMLは汎用的なリソース選択の定義であり、freshness専用ではない。' WHERE id = 'card-dbt-ae-070-opt-3';

-- card-dbt-ae-071: snapshot YAML構文（v1.9+）
UPDATE card_options SET explanation = 'v1.9以降ではsnapshots/ディレクトリにYAMLファイルでsnapshotを定義できる。relation:で参照先を指定し、config:でstrategy等を設定する新しい構文である。' WHERE id = 'card-dbt-ae-071-opt-0';
UPDATE card_options SET explanation = 'snapshotはmodels/ディレクトリではなくsnapshots/ディレクトリに定義する。models/はSQLモデル用のディレクトリである。' WHERE id = 'card-dbt-ae-071-opt-1';
UPDATE card_options SET explanation = 'snapshotの定義はdbt_project.ymlに直接記述するものではない。dbt_project.ymlにはsnapshotのデフォルト設定（config値）のみを記述する。' WHERE id = 'card-dbt-ae-071-opt-2';
UPDATE card_options SET explanation = 'profiles.ymlは接続情報（DWHの認証情報等）を管理するファイルであり、snapshotの定義場所ではない。' WHERE id = 'card-dbt-ae-071-opt-3';

-- card-dbt-ae-072: CSV ロードコマンド（穴埋め）
UPDATE card_options SET explanation = 'dbt seedはプロジェクト内のCSVファイルをDWHにテーブルとしてロードする正しいコマンドである。小さな参照テーブルやマッピングデータに適している。' WHERE id = 'card-dbt-ae-072-opt-0';
UPDATE card_options SET explanation = 'dbt loadというコマンドはdbtには存在しない。CSVファイルのロードにはdbt seedを使用する。' WHERE id = 'card-dbt-ae-072-opt-1';
UPDATE card_options SET explanation = 'dbt importというコマンドはdbtには存在しない。CSVファイルのロードにはdbt seedを使用する。' WHERE id = 'card-dbt-ae-072-opt-2';
UPDATE card_options SET explanation = 'dbt runはモデルのSQLを実行してテーブル/ビューを構築するコマンドであり、CSVファイルのロードには使用しない。CSVロードにはdbt seedを使用する。' WHERE id = 'card-dbt-ae-072-opt-3';

-- card-dbt-ae-074: {{ this }} マクロ（穴埋め）
UPDATE card_options SET explanation = '{{ this }}はincrementalモデル内で自身の出力テーブルを参照するための正しいマクロである。例: select max(updated_at) from {{ this }}のように使用する。' WHERE id = 'card-dbt-ae-074-opt-0';
UPDATE card_options SET explanation = '{{ self }}というマクロはdbtには存在しない。自身のテーブルを参照するには{{ this }}を使用する。' WHERE id = 'card-dbt-ae-074-opt-1';
UPDATE card_options SET explanation = '{{ current }}というマクロはdbtには存在しない。自身のテーブルを参照するには{{ this }}を使用する。' WHERE id = 'card-dbt-ae-074-opt-2';
UPDATE card_options SET explanation = '{{ target }}は接続情報（profiles.ymlのターゲット設定）を参照する変数であり、自身のテーブル参照には使えない。自身のテーブルには{{ this }}を使用する。' WHERE id = 'card-dbt-ae-074-opt-3';

-- card-dbt-ae-077: snapshot のデフォルト strategy
UPDATE card_options SET explanation = 'timestampはsnapshotの有効なstrategyだが、デフォルト値として自動的に設定されるわけではない。明示的な指定が必要である。' WHERE id = 'card-dbt-ae-077-opt-0';
UPDATE card_options SET explanation = 'checkはsnapshotの有効なstrategyだが、デフォルト値として自動的に設定されるわけではない。明示的な指定が必要である。' WHERE id = 'card-dbt-ae-077-opt-1';
UPDATE card_options SET explanation = 'snapshotのstrategyにはデフォルト値が存在せず、timestampまたはcheckを必ず明示的に指定する必要がある。未指定の場合はエラーとなる。' WHERE id = 'card-dbt-ae-077-opt-2';
UPDATE card_options SET explanation = 'mergeはsnapshotのstrategyとしては存在しない。有効な値はtimestampとcheckの2つのみである。' WHERE id = 'card-dbt-ae-077-opt-3';

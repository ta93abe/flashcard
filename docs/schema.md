# データ設計

## D1 テーブル

D1はSQLiteベース。`prepare().bind().all()` / `.run()` / `.first()` でクエリを実行する。

```sql
-- 試験定義 (試験ガイドから自動生成)
CREATE TABLE exams (
  id            TEXT PRIMARY KEY,
  name          TEXT NOT NULL,          -- 'SnowPro Core COF-C03'
  provider      TEXT,                   -- 'Snowflake'
  guide_key     TEXT NOT NULL,          -- R2キー 'guides/snowpro-core/guide.md'
  spec_key      TEXT,                   -- R2キー 'specs/snowpro-core/spec.md' (解析後に設定)
  total_questions INTEGER,              -- 試験の総問題数
  passing_score TEXT,                   -- '750/1000'
  time_minutes  INTEGER,               -- 試験時間 (分)
  status        TEXT NOT NULL DEFAULT 'pending', -- 'pending' | 'analyzing' | 'ready' | 'error'
  created_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 試験の出題トピック (試験ガイドから自動抽出)
CREATE TABLE exam_topics (
  id         TEXT PRIMARY KEY,
  exam_id    TEXT NOT NULL REFERENCES exams(id),
  name       TEXT NOT NULL,             -- 'Snowflake Architecture'
  weight     REAL,                      -- 配点比率 (0.0-1.0)
  position   INTEGER NOT NULL,          -- 表示順
  UNIQUE(exam_id, position)
);

-- 試験で使われる問題形式 (試験ガイドから自動抽出)
CREATE TABLE exam_card_types (
  exam_id      TEXT NOT NULL REFERENCES exams(id),
  card_type_id TEXT NOT NULL REFERENCES card_types(id),
  PRIMARY KEY (exam_id, card_type_id)
);

-- 問題デッキ
CREATE TABLE decks (
  id         TEXT PRIMARY KEY,
  exam_id    TEXT REFERENCES exams(id), -- 紐づく試験 (任意)
  name       TEXT NOT NULL,
  description TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 問題形式の定義 (レジストリ)
CREATE TABLE card_types (
  id           TEXT PRIMARY KEY,     -- 'single_select', 'matching', etc.
  label        TEXT NOT NULL,        -- 表示名 '4択1正解'
  description  TEXT,                 -- 形式の説明
  grading      TEXT NOT NULL,        -- 採点方式 (後述)
  ui_component TEXT NOT NULL,        -- フロントエンドの描画コンポーネント名
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 問題カード
CREATE TABLE cards (
  id            TEXT PRIMARY KEY,
  deck_id       TEXT NOT NULL REFERENCES decks(id),
  type          TEXT NOT NULL DEFAULT 'single_select' REFERENCES card_types(id),
  topic_id      TEXT REFERENCES exam_topics(id), -- 出題トピック (任意)
  question      TEXT NOT NULL,        -- 問題文 (Markdown)
  explanation   TEXT,                 -- 解説 (Markdown)
  media_key     TEXT,                 -- R2オブジェクトキー (画像/図表)
  source_url    TEXT,                 -- 出典URL
  quality_score REAL,                 -- LLM-as-a-Judge 品質スコア (0.0-1.0)
  quality_note  TEXT,                 -- 品質評価の理由
  version       INTEGER NOT NULL DEFAULT 1,
  created_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 選択肢
CREATE TABLE card_options (
  id         TEXT PRIMARY KEY,
  card_id    TEXT NOT NULL REFERENCES cards(id),
  position   INTEGER NOT NULL,       -- 表示順序
  label      TEXT,                   -- 選択肢ラベル ('A', 'B', ... or null)
  body       TEXT NOT NULL,          -- 選択肢のテキスト
  media_key  TEXT,                   -- 選択肢に画像がある場合
  group_name TEXT,                   -- matching用 ('left' | 'right')
  UNIQUE(card_id, position)
);

-- 正解定義
CREATE TABLE card_answers (
  id            TEXT PRIMARY KEY,
  card_id       TEXT NOT NULL REFERENCES cards(id),
  option_id     TEXT REFERENCES card_options(id), -- 正解の選択肢 (選択系)
  text_value    TEXT,               -- 許容テキスト (fill_blank) / キーポイント (free_recall)
  sort_order    INTEGER,            -- 正しい順序 (ordering) / マッチング先のposition (matching)
  region_x      INTEGER,            -- hotspot領域
  region_y      INTEGER,
  region_w      INTEGER,
  region_h      INTEGER,
  child_card_id TEXT REFERENCES cards(id)  -- scenario の子カード参照
);

-- タグ
CREATE TABLE tags (
  id   TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE card_tags (
  card_id TEXT NOT NULL REFERENCES cards(id),
  tag_id  TEXT NOT NULL REFERENCES tags(id),
  PRIMARY KEY (card_id, tag_id)
);

-- 学習記録 (SM-2パラメータ)
CREATE TABLE reviews (
  id            TEXT PRIMARY KEY,
  card_id       TEXT NOT NULL REFERENCES cards(id),
  easiness      REAL NOT NULL DEFAULT 2.5,  -- EF (容易度)
  interval      INTEGER NOT NULL DEFAULT 0, -- 次回までの日数
  repetitions   INTEGER NOT NULL DEFAULT 0, -- 連続正解数
  next_review   TEXT NOT NULL,              -- 次回出題日 (ISO 8601)
  last_quality  INTEGER,                    -- 前回の回答品質 (0-5)
  reviewed_at   TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 問題フィードバック
CREATE TABLE feedbacks (
  id                  TEXT PRIMARY KEY,
  card_id             TEXT NOT NULL REFERENCES cards(id),
  type                TEXT NOT NULL,   -- 'incorrect_answer' | 'ambiguous' | 'outdated' | 'other'
  comment             TEXT,            -- ユーザーからの自由記述
  status              TEXT NOT NULL DEFAULT 'pending',
    -- 'pending' → 'checking' → 'reviewed' → 'fixed' | 'dismissed'
    -- pending:   報告受付済み (未処理)
    -- checking:  AIファクトチェック実行中
    -- reviewed:  AI判定完了 → 管理者レビュー待ち
    -- fixed:     管理者が承認し問題を修正済み
    -- dismissed: 管理者が却下
  ai_verdict          TEXT,            -- ファクトチェック判定理由
  ai_confidence       REAL,            -- AIの確信度 (0.0-1.0)
  ai_suggested_question TEXT,          -- AI修正案: 問題文
  ai_suggested_answer   TEXT,          -- AI修正案: 正解
  human_decision      TEXT,            -- 管理者判断 ('approve' | 'reject' | 'edit')
  human_note          TEXT,            -- 管理者コメント
  created_at          TEXT NOT NULL DEFAULT (datetime('now')),
  resolved_at         TEXT
);

-- カード改訂履歴
CREATE TABLE card_revisions (
  id           TEXT PRIMARY KEY,
  card_id      TEXT NOT NULL REFERENCES cards(id),
  feedback_id  TEXT REFERENCES feedbacks(id),
  old_question TEXT NOT NULL,
  old_answer   TEXT NOT NULL,       -- 人間可読なテキスト形式 (card_options/card_answers の要約)
  new_question TEXT NOT NULL,
  new_answer   TEXT NOT NULL,       -- 同上。実際の cards 更新は card_options/card_answers テーブルに対して行う
  revised_by   TEXT NOT NULL,       -- 'human' | 'auto'
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);
```

## 問題形式レジストリ (`card_types`)

問題形式を `card_types` テーブルで管理し、新形式の追加を **レコード追加 + UIコンポーネント追加** で行えるようにする。

**レジストリの役割:**

```
card_types テーブル
  ├── grading       → card_answers の採点方式を決定
  └── ui_component  → フロントエンドの描画コンポーネント名
```

- **出題時**: `ui_component` に対応するReactコンポーネントを動的に描画。未知の `ui_component` はフォールバックUIで表示
- **採点時**: `grading` に定義された方式で `card_answers` テーブルを参照して正誤判定

**採点方式 (`grading`):**

| grading | 採点ロジック | 使用テーブル |
|---|---|---|
| `exact_match` | 選択した option_id が正解行と一致 | `card_answers.option_id` |
| `partial_credit` | 正解行との一致数で部分点 | `card_answers.option_id` |
| `ordered_match` | sort_order 順に一致 | `card_answers.sort_order` |
| `set_match` | 順序不問でペアが一致 | `card_answers.option_id` + `sort_order` |
| `region_hit` | タップ座標が領域内 | `card_answers.region_*` |
| `fuzzy_text` | 正規化後にテキスト一致 | `card_answers.text_value` |
| `llm_judge` | Workers AIで妥当性判定 | `card_answers.text_value` (キーポイント) |
| `composite` | 子カードの採点結果を集約 | `card_answers.child_card_id` |

**初期レジストリデータ (seeds):**

```sql
INSERT INTO card_types (id, label, description, grading, ui_component) VALUES
('single_select', '4択1正解',     '選択肢から1つ選ぶ',               'exact_match',     'SingleSelect'),
('multi_select',  '複数選択',     '正解が複数ある選択問題',           'partial_credit',  'MultiSelect'),
('domc',          '逐次正誤判定', '選択肢を1つずつ正誤判定する',       'partial_credit',  'DOMC'),
('fill_blank',    '穴埋め',       'テキスト入力で空欄を埋める',       'fuzzy_text',      'FillBlank'),
('free_recall',   '自由記述',     '知識を自由に記述する',             'llm_judge',       'FreeRecall'),
('matching',      '対応付け',     '左右の項目をマッチングする',       'set_match',       'Matching'),
('ordering',      '並べ替え',     '正しい順序に並べる',               'ordered_match',   'Ordering'),
('hotspot',       '画像領域選択', '画像上の正しい領域をタップする',    'region_hit',      'Hotspot'),
('scenario',      'シナリオ問題', 'シナリオに紐づく問題群',           'composite',       'Scenario');
```

**各形式のデータ例（正規化後）:**

```sql
-- ■ single_select: 4択1正解
-- cards: question='stop_reasonがtool_useのとき行うべき処理は？'
-- card_options:
--   (position=0, label='A', body='ループを終了する')
--   (position=1, label='B', body='ツールを実行し結果を追加')  ← 正解
--   (position=2, label='C', body='確認メッセージを送る')
--   (position=3, label='D', body='スキップする')
-- card_answers:
--   (option_id → position=1 の option)

-- ■ multi_select: 複数選択
-- card_answers: option_id を正解の数だけ行を作る

-- ■ fill_blank: 穴埋め (question内の {{blank}} を埋める)
-- card_options: なし
-- card_answers:
--   (text_value='dbt deps')          -- 許容回答1
--   (text_value='dbt-deps')          -- 許容回答2

-- ■ matching: 対応付け
-- card_options:
--   (position=0, body='{{ }}',  group_name='left')
--   (position=1, body='{% %}',  group_name='left')
--   (position=2, body='{# #}', group_name='left')
--   (position=0, body='コメント',     group_name='right')
--   (position=1, body='式の出力',     group_name='right')
--   (position=2, body='制御構造',     group_name='right')
-- card_answers:
--   (option_id → left position=0, sort_order=1)  -- {{ }} → 式の出力
--   (option_id → left position=1, sort_order=2)  -- {% %} → 制御構造
--   (option_id → left position=2, sort_order=0)  -- {# #} → コメント

-- ■ ordering: 並べ替え
-- card_options:
--   (position=0, body='packages.ymlにパッケージを定義')
--   (position=1, body='dbt depsを実行')
--   (position=2, body='マクロやモデルを利用')
-- card_answers:
--   (option_id → position=0, sort_order=0)  -- 1番目
--   (option_id → position=1, sort_order=1)  -- 2番目
--   (option_id → position=2, sort_order=2)  -- 3番目

-- ■ hotspot: 画像領域選択 (media_key で画像参照)
-- card_options: なし
-- card_answers:
--   (region_x=120, region_y=80, region_w=200, region_h=50)

-- ■ domc: 逐次正誤判定
-- card_options:
--   (position=0, body='ignore')
--   (position=1, body='fail')
-- card_answers: 正解の選択肢のみ行を作る
--   (option_id → position=0)  -- ignore は正解
--   (option_id → position=1)  -- fail は正解
-- ※ card_answers に行がない option は不正解

-- ■ free_recall: 自由記述
-- card_options: なし
-- card_answers:
--   (text_value='Database Storage layer')   -- キーポイント1
--   (text_value='Compute layer')            -- キーポイント2
--   (text_value='Cloud Services layer')     -- キーポイント3

-- ■ scenario: シナリオ問題 (親カード → 子カード参照)
-- cards: question='シナリオ: Customer Support Resolution Agent...'
-- card_answers:
--   (child_card_id='card-001')
--   (child_card_id='card-002')
--   (child_card_id='card-003')
```

**新しい問題形式を追加するには:**

1. `card_types` に1レコードINSERT（採点方式 + UIコンポーネント名）
2. `card_options` / `card_answers` の既存カラムの組み合わせでデータを表現
3. フロントエンドに対応するReactコンポーネントを1つ追加
4. 既存の `grading` で対応できない場合のみ、採点ロジックを1つ追加

カラムの組み合わせ（`option_id`, `text_value`, `sort_order`, `region_*`, `child_card_id`）で多様な正解パターンを表現できるため、新形式追加時にスキーママイグレーションが不要。

## KV

グローバル結果整合性。読み取り高速だが、書き込み伝搬に最大60秒。セッションやキャッシュに適する。

| キーパターン | 用途 | TTL |
|---|---|---|
| `session:{id}` | セッション情報 | 24h |
| `stats:{deck_id}:daily:{date}` | 日次学習統計キャッシュ | 1h |
| `ai:explain:{card_id}` | AI解説キャッシュ | 7d |

## R2

試験ガイド・解析済み仕様・問題の画像を格納。エグレス料金なし。

バケット名: `flashcard-bucket`

```
flashcard-bucket/
  guides/                         # 試験ガイド (入力)
    {exam_id}/guide.md
  specs/                          # 解析済み試験仕様 (自動生成)
    {exam_id}/spec.md
  media/                          # 問題の画像・図表
    cards/{card_id}/{filename}
```

- `Content-Type` を正しく設定してアップロード
- 公開バケットまたはPresigned URLでクライアントに配信
- `cards.media_key` / `card_options.media_key` は `media/cards/{card_id}/{filename}` 形式で格納
- `exams.guide_key` は `guides/{exam_id}/guide.md`、`exams.spec_key` は `specs/{exam_id}/spec.md`

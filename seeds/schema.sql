-- 問題形式の定義 (レジストリ)
CREATE TABLE IF NOT EXISTS card_types (
  id           TEXT PRIMARY KEY,
  label        TEXT NOT NULL,
  description  TEXT,
  grading      TEXT NOT NULL,
  ui_component TEXT NOT NULL,
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 試験定義
CREATE TABLE IF NOT EXISTS exams (
  id              TEXT PRIMARY KEY,
  name            TEXT NOT NULL,
  provider        TEXT,
  guide_key       TEXT NOT NULL,
  spec_key        TEXT,
  total_questions INTEGER,
  passing_score   TEXT,
  time_minutes    INTEGER,
  status          TEXT NOT NULL DEFAULT 'pending',
  created_at      TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 試験の出題トピック
CREATE TABLE IF NOT EXISTS exam_topics (
  id       TEXT PRIMARY KEY,
  exam_id  TEXT NOT NULL REFERENCES exams(id),
  name     TEXT NOT NULL,
  weight   REAL,
  position INTEGER NOT NULL,
  UNIQUE(exam_id, position)
);

-- 試験で使われる問題形式
CREATE TABLE IF NOT EXISTS exam_card_types (
  exam_id      TEXT NOT NULL REFERENCES exams(id),
  card_type_id TEXT NOT NULL REFERENCES card_types(id),
  PRIMARY KEY (exam_id, card_type_id)
);

-- 問題デッキ
CREATE TABLE IF NOT EXISTS decks (
  id          TEXT PRIMARY KEY,
  exam_id     TEXT REFERENCES exams(id),
  name        TEXT NOT NULL,
  description TEXT,
  created_at  TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 問題カード
CREATE TABLE IF NOT EXISTS cards (
  id            TEXT PRIMARY KEY,
  deck_id       TEXT NOT NULL REFERENCES decks(id),
  type          TEXT NOT NULL DEFAULT 'single_select' REFERENCES card_types(id),
  topic_id      TEXT REFERENCES exam_topics(id),
  question      TEXT NOT NULL,
  explanation   TEXT,
  media_key     TEXT,
  source_url    TEXT,
  quality_score REAL,
  quality_note  TEXT,
  version       INTEGER NOT NULL DEFAULT 1,
  created_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 選択肢
CREATE TABLE IF NOT EXISTS card_options (
  id         TEXT PRIMARY KEY,
  card_id    TEXT NOT NULL REFERENCES cards(id),
  position   INTEGER NOT NULL,
  label      TEXT,
  body       TEXT NOT NULL,
  media_key  TEXT,
  group_name TEXT,
  UNIQUE(card_id, position)
);

-- 正解定義
CREATE TABLE IF NOT EXISTS card_answers (
  id            TEXT PRIMARY KEY,
  card_id       TEXT NOT NULL REFERENCES cards(id),
  option_id     TEXT REFERENCES card_options(id),
  text_value    TEXT,
  sort_order    INTEGER,
  region_x      INTEGER,
  region_y      INTEGER,
  region_w      INTEGER,
  region_h      INTEGER,
  child_card_id TEXT REFERENCES cards(id)
);

-- タグ
CREATE TABLE IF NOT EXISTS tags (
  id   TEXT PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS card_tags (
  card_id TEXT NOT NULL REFERENCES cards(id),
  tag_id  TEXT NOT NULL REFERENCES tags(id),
  PRIMARY KEY (card_id, tag_id)
);

-- 学習記録 (SM-2パラメータ)
CREATE TABLE IF NOT EXISTS reviews (
  id           TEXT PRIMARY KEY,
  card_id      TEXT NOT NULL REFERENCES cards(id),
  easiness     REAL NOT NULL DEFAULT 2.5,
  interval     INTEGER NOT NULL DEFAULT 0,
  repetitions  INTEGER NOT NULL DEFAULT 0,
  next_review  TEXT NOT NULL,
  last_quality INTEGER,
  reviewed_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

-- 問題フィードバック
CREATE TABLE IF NOT EXISTS feedbacks (
  id                    TEXT PRIMARY KEY,
  card_id               TEXT NOT NULL REFERENCES cards(id),
  type                  TEXT NOT NULL,
  comment               TEXT,
  status                TEXT NOT NULL DEFAULT 'pending',
  ai_verdict            TEXT,
  ai_confidence         REAL,
  ai_suggested_question TEXT,
  ai_suggested_answer   TEXT,
  human_decision        TEXT,
  human_note            TEXT,
  created_at            TEXT NOT NULL DEFAULT (datetime('now')),
  resolved_at           TEXT
);

-- カード改訂履歴
CREATE TABLE IF NOT EXISTS card_revisions (
  id           TEXT PRIMARY KEY,
  card_id      TEXT NOT NULL REFERENCES cards(id),
  feedback_id  TEXT REFERENCES feedbacks(id),
  old_question TEXT NOT NULL,
  old_answer   TEXT NOT NULL,
  new_question TEXT NOT NULL,
  new_answer   TEXT NOT NULL,
  revised_by   TEXT NOT NULL,
  created_at   TEXT NOT NULL DEFAULT (datetime('now'))
);

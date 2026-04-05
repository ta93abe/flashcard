# Claude Code 開発ガイドライン

このプロジェクトでの Claude Code の活用方針。

## ディレクトリ構成 (目標)

実装の進行に応じて段階的に追加する。現時点では `settings.local.json` のみ存在。

```
.claude/
├── CLAUDE.md              # プロジェクト共有の指示 (git管理)
├── settings.json          # 共有設定・Hooks (git管理)
├── settings.local.json    # 個人設定 (.gitignore)
├── skills/                # カスタムSkill
│   ├── generate-questions/
│   │   └── SKILL.md
│   └── review-exam/
│       └── SKILL.md
├── agents/                # カスタムSubagent
│   └── fact-checker.md
└── rules/                 # パス別ルール
    ├── api.md             # paths: ["src/api/**/*.ts"]
    ├── frontend.md        # paths: ["src/pages/**", "src/components/**"]
    └── tests.md           # paths: ["**/*.test.ts"]
CLAUDE.md                  # プロジェクトルート (こちらでも可)
CLAUDE.local.md            # 個人メモ (.gitignore)
```

## CLAUDE.md の書き方

200行以内を目標に、Claude が推測できないことだけ書く。

```markdown
# CLAUDE.md
## ビルド・テスト
- `pnpm run dev` — ローカル開発
- `pnpm run test` — Vitest (API: @cloudflare/vitest-pool-workers)
- `pnpm run test:e2e` — Playwright

## コード規約
- ESModules (import/export)、CommonJS禁止
- Hono の型は `Hono<{ Bindings: CloudflareBindings }>` で推論
- D1 クエリは `prepare().bind().all()` パターン

## アーキテクチャ
- API: Hono on Workers (src/index.ts)
- フロントエンド: Astro on Workers
- データ: D1 (SQLite), KV, R2
- AI: Workers AI + AI Gateway + Vectorize + AI Search

@README.md
```

**原則:**
- Claude が既に正しくやっていることは書かない
- 矛盾するルールがないか定期的に見直す
- 長くなったら `.claude/rules/` に分割

## `.claude/rules/` — パス別ルール

特定のファイルパターンに対してのみロードされるルール。CLAUDE.md のコンテキスト消費を削減。

```markdown
# .claude/rules/api.md
---
paths:
  - "src/api/**/*.ts"
  - "src/routes/**/*.ts"
---
- Honoの `c.env` 経由でバインディングにアクセス
- エラーレスポンスは `{ error: string, code: string }` 形式
- 全エンドポイントに入力バリデーション (zod)
```

```markdown
# .claude/rules/tests.md
---
paths:
  - "**/*.test.ts"
  - "e2e/**"
---
- API テストは @cloudflare/vitest-pool-workers で実D1を使う
- モックは AI 呼び出しなど外部依存のみ
- E2E はモバイル (375px) とデスクトップ (1280px) の両方をテスト
```

## Skills — 再利用可能なワークフロー

Skills は `.claude/skills/<name>/SKILL.md` に配置。Claude が自動判断で使うか、`/name` で手動呼び出し。

```yaml
# .claude/skills/generate-questions/SKILL.md
---
name: generate-questions
description: 試験ガイドに基づいて問題を生成する。「問題を作って」「10問追加して」のようなリクエストで自動的に使用。
argument-hint: [exam_id] [count] [topic]
context: fork
allowed-tools: Read Grep Bash WebFetch
---

$ARGUMENTS に基づいて問題を生成する。

1. D1 の exams, exam_topics から試験仕様を取得
2. R2 の specs/ から詳細仕様を読み取り
3. AI Search で公式ドキュメントを検索
4. card_types の形式に沿って問題を生成
5. LLM-as-a-Judge で品質チェック (quality_score >= 0.6)
6. D1 の cards, card_options, card_answers に保存

## ルール
- トピックの配点比率に応じて問題数を配分
- 各問題に source_url を含める
- explanation に判定根拠を記載
```

**主要フィールド:**

| フィールド | 用途 |
|---|---|
| `name` | `/name` で呼び出す名前 |
| `description` | Claude が自動判断する際の手がかり (250文字以内推奨) |
| `context: fork` | サブエージェントで隔離実行。メインのコンテキストを汚さない |
| `disable-model-invocation: true` | 手動呼び出し専用 (デプロイなど副作用あるもの) |
| `user-invocable: false` | Claude のみ使用。ユーザーメニューに非表示 |
| `allowed-tools` | Skill実行中に許可するツール |
| `argument-hint` | 補完時に表示するヒント |
| `paths` | 特定ファイルパターンでのみ自動ロード |

**`$ARGUMENTS` 変数:**
- `$ARGUMENTS` — 全引数
- `$0`, `$1`, ... — 位置引数
- `${CLAUDE_SKILL_DIR}` — SKILL.md のディレクトリ

**動的コンテキスト注入:**
`` !`command` `` でシェルコマンドの結果を展開できる（プリプロセス）。

```yaml
---
name: pr-review
description: PRをレビューする
context: fork
agent: Explore
---
## PR情報
- diff: !`gh pr diff`
- comments: !`gh pr view --comments`

上記のPRをレビューしてください。
```

## Hooks — 確定的なワークフロー自動化

CLAUDE.md は助言（Claude が従わない可能性あり）。Hooks は確定的に実行される。

```jsonc
// .claude/settings.json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "npx eslint --fix $CLAUDE_PROJECT_DIR/$(echo '$TOOL_INPUT' | jq -r '.file_path // empty')",
            "timeout": 30
          }
        ]
      }
    ],
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "$CLAUDE_PROJECT_DIR/.claude/hooks/block-destructive.sh"
          }
        ]
      }
    ]
  }
}
```

**主要イベント:**

| イベント | 用途 | ブロック可能 |
|---|---|---|
| `PreToolUse` | ツール実行前 (危険コマンドのブロック等) | Yes |
| `PostToolUse` | ツール実行後 (自動lint/format等) | Yes |
| `Stop` | Claude の応答完了時 | Yes |
| `SessionStart` | セッション開始時 | No |
| `UserPromptSubmit` | プロンプト送信前 | Yes |

**Hook vs CLAUDE.md の使い分け:**
- ファイル編集後に必ずlint → **Hook** (確定的)
- 「できればテストを書いて」 → **CLAUDE.md** (助言)
- 特定コマンドをブロック → **Hook** (確定的)
- コーディングスタイル → **CLAUDE.md** (助言)

## Subagents — 隔離されたタスク委譲

`.claude/agents/` にカスタムサブエージェントを定義。メインのコンテキストを汚さずに調査・検証を実行。

```markdown
# .claude/agents/fact-checker.md
---
name: fact-checker
description: 問題のファクトチェックを実行
tools: Read, Grep, Glob, Bash, WebFetch
model: opus
---
あなたはファクトチェッカーです。
指定された問題と回答の正確性を検証してください。

1. AI Search で公式ドキュメントを検索
2. 問題文と回答を検索結果と照合
3. 各評価観点でスコアリング (0.0-1.0)
4. 修正が必要な場合は修正案を生成
```

**使い分け:**
- コードベース調査 → `agent: Explore` (読み取り専用、高速)
- 設計の検討 → `agent: Plan` (変更不可、計画に集中)
- 汎用タスク → `agent: general-purpose` (全ツール利用可)
- 特化タスク → カスタムエージェント (`.claude/agents/`)

## ワークフローのベストプラクティス

**コンテキスト管理 (最重要):**
- 無関係なタスク間で `/clear` を実行
- 大量のファイル読み込みはサブエージェントに委譲
- 2回修正しても改善しない → `/clear` して最初からやり直す
- `/compact` でコンテキストを要約（自動発動もあり）

**探索 → 計画 → 実装の3フェーズ:**
1. Plan Mode でコードを読んで理解（変更なし）
2. 実装計画を作成（`Ctrl+G` でエディタで編集可能）
3. Normal Mode に戻して実装 + テスト

**検証を必ず提供:**
- テストコマンド、lint、スクリーンショットなど
- 「テストを書いて、実行して、失敗したら修正して」が最強パターン

**プロンプトは具体的に:**
- Bad: `"テストを追加して"`
- Good: `"src/api/review.ts の SM-2 計算のエッジケース (quality=0,3,5) をテスト。モック不要、@cloudflare/vitest-pool-workers で実D1を使う"`

**CI/CD連携:**
```bash
# 非インタラクティブ実行
claude -p "全APIエンドポイントのlintエラーを修正" --output-format json

# 構造化出力
claude -p "変更されたファイルをレビュー" --output-format stream-json

# 権限制限付き
claude -p "型エラーを修正" --allowedTools "Edit,Bash(npx tsc *)"
```

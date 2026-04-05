# 日次ファクトチェック スケジュール設定手順

## 概要

Claude Code のリモートエージェント (CCR) を使って、毎日20問のファクトチェックを自動実行する。

## 前提条件

### 1. Claude GitHub App のインストール

https://claude.ai/code/onboarding?magic=github-app-setup から `ta93abe/flashcard` リポジトリにインストール。

### 2. Cloudflare API Token の設定

リモートエージェントが `wrangler d1 execute --remote` を実行するために必要。

1. [Cloudflare ダッシュボード](https://dash.cloudflare.com/profile/api-tokens) → API トークン作成
2. 権限: `D1: Edit`, `R2: Edit`
3. リポジトリの GitHub Secrets に `CLOUDFLARE_API_TOKEN` として追加、または CCR 環境変数に設定

## スケジュール作成

Claude Code で以下を実行:

```
/schedule fact-checkスキルを1日1回動かして
```

または手動で設定:

- **スケジュール**: `0 21 * * *` (毎日 06:00 JST = 21:00 UTC)
- **モデル**: `claude-sonnet-4-6`
- **環境**: `claude-code-default`
- **リポジトリ**: `https://github.com/ta93abe/flashcard`

### プロンプト

```
このリポジトリはdbt資格試験のフラッシュカードアプリです。
.claude/skills/fact-check/SKILL.md の手順に従ってファクトチェックを実行してください。

1. 直近7日間にチェック済みのカードを除外し、ランダムに20問取得
2. 各カードの選択肢と正解を取得して、dbt公式ドキュメントの知識に基づき検証
3. 結果をfact_checksテーブルにSQL INSERT
4. incorrectでconfidence >= 0.85のカードは自動修正
5. model_usedは 'claude-code-scheduled' とする

実行後、チェック結果のサマリーを出力してください。
```

## 確認方法

- スケジュール管理: https://claude.ai/code/scheduled
- 実行結果: https://flashcard.ta93abe.workers.dev/fact-checks
- API: `GET /api/batch/fact-check/history`

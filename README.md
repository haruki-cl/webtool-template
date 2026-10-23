# Web ツール開発ワークショップのテンプレート

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/haruki-cl/webtool-template)

## 中身

- `backend/src/index.ts`：Hono の API。`/api/health` だけ入っている
- `backend/migrations/`：テーブル定義の SQL を置く
- `frontend/`：Vite で作る。まだなければ仮ページが配信される
- `Dockerfile`、`compose.yaml`、`bootstrap.yaml`：参加者の手元の環境。講師が参加者の PC に用意する
- `wrangler.jsonc`、`scripts/`、`.claude/`：講師が管理している。変更しない

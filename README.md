# Web ツール開発ワークショップのテンプレート

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/haruki-cl/webtool-template)

班ごとに、上のボタンから Worker と D1 を作る。設定画面では次を入れる。

| 項目 | 値の例 |
|---|---|
| リポジトリ名 | `team-a` |
| Worker 名 | `team-a` |
| D1 の名前 | `team-a-db` |

作られたリポジトリでは、main への push のたびに自動でビルドとデプロイが走る。

## 中身

- `backend/src/index.ts`：Hono の API。`/api/health` だけ入っている
- `backend/migrations/`：テーブル定義の SQL を置く
- `frontend/`：Vite で作る。まだなければ仮ページが配信される
- `wrangler.jsonc`、`scripts/`：主催者が管理する

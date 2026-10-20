# Web ツール開発ワークショップのテンプレート

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/haruki-cl/webtool-template)

班の代表者が、上のボタンから自分の GitHub と Cloudflare のアカウントにリポジトリと Worker を作る。
以後は main への push のたびに、自動でビルドとデプロイが走る。

## 代表者がやること

1. Cloudflare のアカウント（無料）を作っておく
2. 上のボタンを押し、Cloudflare にログインする
3. 設定画面で次を入れて Deploy を押す
   - Git account：自分の GitHub アカウント（初回は GitHub との連携を許可する）
   - Create private Git repository：チェックを入れる
   - Project name：班の名前（例 `team-a`）。これがリポジトリ名、Worker 名、URL の先頭になる
   - Select D1 database：そのまま（`tool-app-db`）
   - Build command と Deploy command：そのまま（`npm run build`、`npm run deploy`）
4. 終わったら、公開 URL（`https://team-a.<自分のサブドメイン>.workers.dev`）を開いて「準備中」の画面が出ることを確かめる
5. GitHub で、作られたリポジトリに班員と主催者を collaborator として招待する

## 中身

- `backend/src/index.ts`：Hono の API。`/api/health` だけ入っている
- `backend/migrations/`：テーブル定義の SQL を置く
- `frontend/`：Vite で作る。まだなければ仮ページが配信される
- `wrangler.jsonc`、`scripts/`、`.claude/`：主催者が管理している。変更しない

## 手元で動かす

```bash
npm install
npm run db:migrate:local   # テーブルをローカルの D1 に作る
npm run build              # frontend/ をビルドする（なければ仮ページ）
npm run dev                # http://localhost:8787
```

# Web ツール開発ワークショップのテンプレート

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/haruki-cl/webtool-template)

講師が班ごとに、班用の GitHub と Cloudflare のアカウントで上のボタンを押し、リポジトリと Worker を作る。
以後は main への push のたびに、自動でビルドとデプロイが走る。
参加者の PC には Docker だけを入れ、Node、git、Claude Code はコンテナの中で動かす。

## 講師がやること（班ごと）

1. 班用の GitHub アカウントと Cloudflare アカウント（無料）を作っておき、代表者の PC のブラウザで GitHub にログインしておく
2. その PC で上のボタンを押し、班の Cloudflare アカウントでログインする
3. 設定画面で次を入れて Deploy を押す
   - Git account：班の GitHub アカウント（初回は GitHub との連携を許可する）
   - Create private Git repository：チェックを入れる
   - Project name：班の名前（例 `team-a`）。これがリポジトリ名、Worker 名、URL の先頭になる
   - Select D1 database：そのまま（`tool-app-db`）
   - Build command と Deploy command：そのまま（`npm run build`、`npm run deploy`）
4. 終わったら、公開 URL（`https://team-a.<班のサブドメイン>.workers.dev`）を開いて「準備中」の画面が出ることを確かめる
5. 班員が自分の GitHub アカウントで作業するなら、作られたリポジトリに collaborator として招待する

## 中身

- `backend/src/index.ts`：Hono の API。`/api/health` だけ入っている
- `backend/migrations/`：テーブル定義の SQL を置く
- `frontend/`：Vite で作る。まだなければ仮ページが配信される
- `Dockerfile`、`compose.yaml`、`bootstrap.yaml`：参加者の手元の環境。講師が参加者の PC に用意する
- `wrangler.jsonc`、`scripts/`、`.claude/`：講師が管理している。変更しない

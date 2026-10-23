# このリポジトリについて

社内向けの小さな Web ツールを、frontend/（Vite + React）と backend/（Hono on Cloudflare Workers + D1）で作る。
1つの Worker が、frontend/dist の画面と `/api/...` の API をまとめて配信する。

## 触らないファイル

- `wrangler.jsonc`、`scripts/`、`.claude/`、`Dockerfile`、`compose.yaml`、`package.json` の scripts は主催者が管理している。変更するとデプロイや手元の環境が壊れるので、変更しない
- 依存パッケージの追加（`npm install`）はしてよい
- デプロイは main への push で自動的に行われる。`wrangler deploy` を手元で実行しない

## 決まりごと

- API は backend/src/ に書く。D1 のバインディング名は `DB`
- テーブル定義は backend/migrations/ に SQL で置く。手元では `npm run db:migrate:local` で当てる
- frontend/ は Vite で作り、`npm run build` の出力先は frontend/dist のままにする
- frontend/ を作ったら、ルートの `.npmrc` を frontend/ にもコピーする（npm は package.json のあるディレクトリの .npmrc しか読まない）
- 手元で動かすときは、コンテナの中（`docker compose exec app bash`）で、ルートで `npm run build` のあと `npm run dev`。PC 側では npm を実行しない
- `.dev.vars` や `.env` は読まない

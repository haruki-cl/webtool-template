#!/usr/bin/env bash
# frontend/ をビルドして frontend/dist に出す。
# frontend/ がまだなければ、仮ページを frontend/dist に置いてデプロイが通るようにする。
set -eu
cd "$(dirname "$0")/.."

if [ -f frontend/package.json ]; then
  # npm は package.json のあるディレクトリの .npmrc しか読まないので、ルートの .npmrc を frontend/ にも置く
  [ -f frontend/.npmrc ] || cp .npmrc frontend/.npmrc
  # Workers Builds はビルド環境に Cloudflare のトークンを渡してくる。
  # 参加者のコードと npm パッケージが動く frontend/ の工程では、それを外しておく
  (
    cd frontend
    export -n CLOUDFLARE_API_TOKEN CLOUDFLARE_ACCOUNT_ID CLOUDFLARE_API_BASE_URL 2>/dev/null || true
    unset CLOUDFLARE_API_TOKEN CLOUDFLARE_ACCOUNT_ID CLOUDFLARE_API_BASE_URL
    if [ -f package-lock.json ]; then npm ci; else npm install; fi
    npm run build
  )
else
  echo "frontend/ がまだないので、仮ページを配信します"
  rm -rf frontend/dist
  mkdir -p frontend/dist
  cp placeholder/index.html frontend/dist/index.html
fi

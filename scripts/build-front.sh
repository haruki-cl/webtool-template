#!/usr/bin/env bash
# frontend/ をビルドして frontend/dist に出す。
# frontend/ がまだなければ、仮ページを frontend/dist に置いてデプロイが通るようにする。
set -eu
cd "$(dirname "$0")/.."

if [ -f frontend/package.json ]; then
  # npm は package.json のあるディレクトリの .npmrc しか読まないので、ルートの .npmrc を frontend/ にも置く
  [ -f frontend/.npmrc ] || cp .npmrc frontend/.npmrc
  (
    cd frontend
    if [ -f package-lock.json ]; then npm ci; else npm install; fi
    npm run build
  )
else
  echo "frontend/ がまだないので、仮ページを配信します"
  rm -rf frontend/dist
  mkdir -p frontend/dist
  cp placeholder/index.html frontend/dist/index.html
fi

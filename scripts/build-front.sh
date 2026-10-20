#!/usr/bin/env bash
# frontend/ をビルドして frontend/dist に出す。
# frontend/ がまだなければ、仮ページを frontend/dist に置いてデプロイが通るようにする。
set -eu
cd "$(dirname "$0")/.."

if [ -f frontend/package.json ]; then
  if [ -f frontend/package-lock.json ]; then
    npm --prefix frontend ci
  else
    npm --prefix frontend install
  fi
  npm --prefix frontend run build
else
  echo "frontend/ がまだないので、仮ページを配信します"
  rm -rf frontend/dist
  mkdir -p frontend/dist
  cp placeholder/index.html frontend/dist/index.html
fi

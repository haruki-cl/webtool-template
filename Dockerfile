# 参加者の手元の環境。PC には Docker だけを入れ、Node、git、gh、Claude Code はこの中で動かす。
# 主催者が管理する。参加者は変更しない。
FROM node:24-bookworm

ENV TZ=Asia/Tokyo \
    DISABLE_AUTOUPDATER=1

RUN apt-get update \
 && apt-get install -y --no-install-recommends gh \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g @anthropic-ai/claude-code \
 && git config --system --add safe.directory '*'

USER node
WORKDIR /work
CMD ["sleep", "infinity"]

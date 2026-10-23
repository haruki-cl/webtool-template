FROM node:24-bookworm

ENV TZ=Asia/Tokyo \
    DISABLE_AUTOUPDATER=1

RUN apt-get update \
 && apt-get install -y --no-install-recommends gh vim nano less curl \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g @anthropic-ai/claude-code \
 && git config --system --add safe.directory '*'

USER node
WORKDIR /work
CMD ["sleep", "infinity"]

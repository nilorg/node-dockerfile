FROM node:24.14-alpine
RUN set -eux; \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
	apk --no-cache add ca-certificates tzdata || \
	(sed -i 's/mirrors.aliyun.com/dl-cdn.alpinelinux.org/g' /etc/apk/repositories && apk --no-cache add ca-certificates tzdata)
ENV TZ=Asia/Shanghai

RUN npm version

RUN npm install -g corepack@latest

RUN corepack enable pnpm
RUN pnpm version

RUN corepack enable yarn
RUN yarn --version


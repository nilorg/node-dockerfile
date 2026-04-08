FROM node:24.14-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --no-cache add ca-certificates
RUN apk --no-cache add -U tzdata
ENV TZ=Asia/Shanghai

RUN npm version

RUN npm install -g corepack@latest

RUN corepack enable pnpm
RUN pnpm version

RUN corepack enable yarn
RUN yarn --version


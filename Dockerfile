FROM node:18.20.8-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --no-cache add ca-certificates
RUN apk --no-cache add -U tzdata
ENV TZ=Asia/Shanghai

RUN npm version
RUN npm install -g pnpm@latest-10

RUN pnpm version
RUN pnpm install yarn tyarn -g

RUN yarn --version
RUN tyarn --version

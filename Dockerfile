FROM node:15.3.0-alpine
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk --no-cache add ca-certificates
RUN apk --no-cache add -U tzdata
ENV TZ=Asia/Shanghai

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org
RUN cnpm install yarn tyarn -g

RUN npm version
RUN cnpm version
RUN yarn --version
RUN tyarn --version
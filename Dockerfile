FROM alpine:3.14@sha256:0f2d5c38dd7a4f4f733e688e3a6733cb5ab1ac6e3cb4603a5dd564e5bfb80eed

RUN apk add --no-cache \
    nodejs

COPY package.json ./    

RUN  apk add --no-cache npm \
 && npm i --no-optional \
 && npm cache clean --force \
 && apk del npm

COPY . /app

CMD ["node", "/app/app.js"]

EXPOSE 3000

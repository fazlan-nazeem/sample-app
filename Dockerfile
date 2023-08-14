FROM alpine:3.14

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

FROM node:16-alpine3.15

ENV NODE_ENV=production

RUN addgroup -g 1017 -S appgroup \
  && adduser -u 1017 -S appuser -G appgroup \
  && apk update \
  && apk add --update python3 py3-pip

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY app/ ./app
COPY docs/ ./docs
COPY gulp/ ./gulp
COPY lib/ ./lib
COPY *.js ./
COPY start.sh ./

RUN chown -R appuser:appgroup /app

USER 1017

CMD ["./start.sh"]

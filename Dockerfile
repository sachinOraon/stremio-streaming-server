FROM node:14.15.0-alpine

WORKDIR /stremio

ARG VERSION=master

RUN apk add --no-cache wget ffmpeg
RUN wget -q http://dl.strem.io/four/${VERSION}/stremio.asar
COPY server.js .

ENTRYPOINT [ "node", "server.js" ]

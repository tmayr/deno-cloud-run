FROM hayd/alpine-deno:latest as builder

ENV TZ="America/Santiago"

WORKDIR /app
COPY . /app

# generate a layer with index.ts deps
RUN deno cache index.ts

EXPOSE $PORT

CMD ["run", "--allow-net", "--allow-env",  "index.ts"]

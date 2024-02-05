FROM alpine:3.19
EXPOSE 1313

RUN apk add --no-cache hugo git

WORKDIR /app
COPY . .

RUN git submodule update --init --recursive

CMD ["hugo", "server", "--disableFastRender", "--bind", "0.0.0.0"]

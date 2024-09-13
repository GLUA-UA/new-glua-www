FROM alpine:3.19
EXPOSE 1313

RUN apk add --no-cache hugo git go

WORKDIR /app
COPY . .

CMD ["hugo", "server", "--disableFastRender", "--bind", "0.0.0.0"]

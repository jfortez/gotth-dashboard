
FROM golang:1.22.2-alpine as builder

WORKDIR /app
COPY . .
RUN go build -o main cmd/api/main.go

FROM alpine

WORKDIR /app
COPY --from=builder /app/main .
EXPOSE ${APP_PORT}
ENTRYPOINT ["./main"]
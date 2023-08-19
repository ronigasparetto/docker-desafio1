
FROM golang:1.21.0 as builder

WORKDIR /app

COPY . /app

RUN go build -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]
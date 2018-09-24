FROM golang:1.11.0-alpine3.8 as builder

WORKDIR /go-grace/

COPY . ./

RUN go build -o app

FROM alpine:3.8

WORKDIR /root/

COPY --from=builder /go-grace/app .

CMD ["./app"]

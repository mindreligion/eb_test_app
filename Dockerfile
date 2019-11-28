FROM golang:1.13-alpine3.10

LABEL stage=builder

ADD . /home/root
WORKDIR /home/root
ENV CGO_ENABLED=0
RUN go build -mod=vendor  -o ./bin/server ./cmd/server


FROM alpine:3.10
WORKDIR /root/
COPY /home/root/bin/ ./

ENTRYPOINT ./server
EXPOSE 8080
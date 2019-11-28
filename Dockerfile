FROM golang:1.13-alpine3.10

LABEL stage=builder

ADD . /home/root
WORKDIR /home/root
ENV CGO_ENABLED=0
RUN go build -mod=vendor  -o ./bin/server ./cmd/server

WORKDIR /home/root/bin

ENTRYPOINT ./server
EXPOSE 8080
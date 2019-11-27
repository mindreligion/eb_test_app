FROM golang:1.13-alpine3.10 as builder

#LABEL stage=builder

ADD . /home/root
WORKDIR /home/root
ENV CGO_ENABLED=0
RUN go build -mod=vendor  -o ./bin/server ./cmd/server


FROM alpine:3.10
WORKDIR /root/
COPY --from=builder /home/root/bin/ ./

ENTRYPOINT ./server
EXPOSE 8080
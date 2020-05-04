FROM golang:1.14.2

WORKDIR /go/src/github.com/yujinlim/blockchain-monitoring
ADD go.mod go.sum /go/src/github.com/yujinlim/blockchain-monitoring/
RUN go mod download
ADD . .
RUN go build -o /go/bin/blockchain-monitoring .

FROM debian
COPY --from=0 /go/bin/blockchain-monitoring /bin/blockchain-monitoring
ENTRYPOINT ["/bin/blockchain-monitoring"]

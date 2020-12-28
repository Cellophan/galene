FROM golang:1.14 as build

WORKDIR /go/src/app
COPY . .

RUN CGO_ENABLED=0 go build -ldflags='-s -w'


FROM scratch

COPY --from=build /go/src/app/galene /

ENTRYPOINT ["/galene"]


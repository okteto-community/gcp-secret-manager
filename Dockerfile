FROM golang:1.21.3-bullseye

WORKDIR /usr/src/app
ADD . .
RUN go build -o /usr/local/bin/hello-world

EXPOSE 8080
CMD ["/usr/local/bin/hello-world"]
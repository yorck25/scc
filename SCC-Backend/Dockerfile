FROM ubuntu:latest
LABEL authors="yorckdombrowsky"

ENTRYPOINT ["top", "-b"]

FROM golang:latest
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
EXPOSE 5555
ENV SECRET_KEY=Der_Docker_Key
CMD [ "/docker-gs-ping" ]
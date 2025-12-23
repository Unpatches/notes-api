FROM golang:1.25 AS builder
WORKDIR /app

# зависимости
COPY go.mod go.sum ./
RUN go mod download

# исходники
COPY . .

# сборка
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build -trimpath -ldflags="-s -w" \
    -o /out/notes-api ./cmd/api

# runtime
FROM alpine:3.20
RUN addgroup -S app && adduser -S -G app app
COPY --from=builder /out/notes-api /usr/local/bin/notes-api
USER app

EXPOSE 8080
ENTRYPOINT ["notes-api"]

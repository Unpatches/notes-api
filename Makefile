APP_NAME := notes-api
BIN_DIR  := bin
BIN      := $(BIN_DIR)/$(APP_NAME)

DOCKER_IMAGE := $(APP_NAME):local

.PHONY: help tidy fmt vet test build run clean \
        docker-build docker-run docker-stop \
        compose-up compose-down compose-logs compose-ps

help:
	@echo "Targets:"
	@echo "  make tidy          - go mod tidy"
	@echo "  make fmt           - gofmt"
	@echo "  make vet           - go vet"
	@echo "  make test          - go test"
	@echo "  make build         - build binary to ./bin/notes-api"
	@echo "  make run           - run locally (go run)"
	@echo "  make clean         - remove ./bin"
	@echo "  make docker-build  - docker build image"
	@echo "  make docker-run    - run container on :8080"
	@echo "  make docker-stop   - stop container notes-api"
	@echo "  make compose-up    - docker compose up -d --build"
	@echo "  make compose-down  - docker compose down"
	@echo "  make compose-logs  - docker compose logs -f"
	@echo "  make compose-ps    - docker compose ps"

tidy:
	go mod tidy

fmt:
	gofmt -w .

vet:
	go vet ./...

test:
	go test ./...

build:
	mkdir -p $(BIN_DIR)
	go build -o $(BIN) ./cmd/api

run:
	go run ./cmd/api

clean:
	rm -rf $(BIN_DIR)

docker-build:
	docker build -t $(DOCKER_IMAGE) .

docker-run:
	docker run -d --name $(APP_NAME) -p 8083:8080 $(DOCKER_IMAGE)

docker-stop:
	-docker rm -f $(APP_NAME)

compose-up:
	docker compose up -d --build

compose-down:
	docker compose down

compose-logs:
	docker compose logs -f --tail=200

compose-ps:
	docker compose ps

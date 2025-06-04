SHA := $(shell git rev-parse --short=8 HEAD)
GITVERSION := $(shell git describe --long --all)
BUILDDATE := $(shell date -Iseconds)
VERSION := $(or ${VERSION},$(shell git describe --tags --exact-match 2> /dev/null || git symbolic-ref -q --short HEAD || git rev-parse --short HEAD))

CGO_ENABLED := 1
LINKMODE := -extldflags '-static -s -w'

MINI_LAB_KUBECONFIG := $(shell pwd)/../mini-lab/.kubeconfig

all: server

.PHONY: server
server:
	go build -o bin/server github.com/haruue-net/mwgp/cmd/mwgp
	strip bin/server

.PHONY: test
test:
	go test ./... -race -coverpkg=./... -coverprofile=coverage.out -covermode=atomic -p 2 -timeout=300s && go tool cover -func=coverage.out

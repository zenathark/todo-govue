VERSION := $(shell git describe --tags)
BUILD := $(shell git rev-parse --short HEAD)
PROJECTNAME := $(shell basename "$(PWD)")

GOBASE := $(shell pwd)
GOPATH := $(GOBASE)/vendor:$(GOBASE)
GOBIN := $(GOBASE)/bin
GOFILES := $(wildcard *.go)

clean:
	@echo " > Cleaning build ..."
	rm -rf bin/*

serve: build-server build-ui
	bin/server

kill:
	pkill server

build-server:
	@echo " > Building binary..."
	go build -o bin/server cmd/server/main.go

build-ui:
	@echo " > Building js ..."
	cd web/todo-ui; npm run build
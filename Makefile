BIN = forego
SRC = $(shell ls *.go)
OS = linux
ARCH = amd64

.PHONY: all build clean lint release test

all: build

clean:
	rm -f $(BIN)

lint: $(SRC)
	go fmt

release:
	bin/release

test: lint build
	go test -v -race -cover ./...

build:
	GOOS=$(OS) GOARCH=$(ARCH) go build -o $(BIN)
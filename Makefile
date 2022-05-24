PROJECT := puppeteer
NAME   := $(PROJECT)
TAG    := dev-$$(git rev-parse --short HEAD)
IMG    := $(NAME):$(TAG)
LATEST := $(NAME):latest-dev
PUPPETEER_VERSION := "14.1.0"

.PHONY: build force-build run push

ARGS= -t $(IMG) --build-arg PUPPETEER_VERSION=$(PUPPETEER_VERSION)
BUILD=@docker build
TAGS=@docker tag $(IMG) $(LATEST)

build:
	$(BUILD) $(ARGS) .
	$(TAGS)

force-build:
	$(BUILD) --no-cache $(ARGS) .
	$(TAGS)

run-bash:
	@docker run -it --rm -v $$(pwd):/data --name $(PROJECT) -t $(LATEST) /bin/bash

test: build
	$(MAKE) -C tests/ build-test
	$(MAKE) -C tests/ run-test
	$(MAKE) -C tests/ cleanup
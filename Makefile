.SHELL := /bin/bash
.DEFAULT_GOAL:=help

.PHONY: install
install: ## Install all
	sh ./git/install
	sh ./system/install
	sh ./docker/install
	sh ./node/install
	sh ./php/install
	sh ./browsers/install
	sh ./utilities/install

.PHONY: help
help: ## Display this help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

SHELL = /bin/bash
.ONESHELL:
.DEFAULT_GOAL: help

help: ## Prints available commands
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[.a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

setup: ## Setup the application
	@bin/setup

nginx.pf: ## Port-forward NGINX to the port 8080
	@kubectl port-forward deploy/nginx-pod 8080:80

nginx.test: ## Run the NGINX configuration test
	@kubectl exec deploy/nginx-pod -- nginx -t

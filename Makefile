SHELL = /bin/bash
.ONESHELL:
.DEFAULT_GOAL: help

help: ## Prints available commands
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[.a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

setup: ## Setup everything
	@bin/setup

nginx.pf: ## Port-forward NGINX to the port 4000
	@kubectl port-forward deploy/nginx-pod 4000:80

nginx.test: ## Run the NGINX configuration test
	@kubectl exec deploy/nginx-pod -- nginx -t

prom.pf: ## Port-forward Prometheus to the port 9090
	@kubectl -n monitoring port-forward deploy/prometheus-pod 9090:9090

grafana.pf: ## Port-forward Grafana to the port 3000
	@kubectl -n monitoring port-forward deploy/grafana-pod 3000:3000

kube-state-metrics.pf: ## Port-forward kube-state-metrics to the port 8080
	@kubectl -n kube-system port-forward deploy/kube-state-metrics-pod 8080:8080

tekton.pf: ## Port-forward Tekton Dashboard to the port 9097
	@kubectl -n tekton-pipelines port-forward svc/tekton-dashboard 9097:9097

tekton.triggers.pf: ## Port-forward Tekton triggers to the port 8443
	@kubectl -n tekton-pipelines port-forward svc/tekton-triggers-core-interceptors 8443:8443

tekton.el.pf: ## Port-forward Tekton Event Listener to the port 8080
	@kubectl port-forward svc/el-github-pr 8080:8080

tekton.triggers.ngrok: ## NGROK Tekton triggers webhook
	@ngrok http https://localhost:8443

tekton.el.ngrok: ## NGROK Tekton Event Listener Webhook
	@ngrok http https://localhost:8080

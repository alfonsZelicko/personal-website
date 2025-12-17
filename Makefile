.PHONY: help
help: ## Shows all commands
	@echo 'All Makefile commands:'
	@grep -h -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: server
server: ## Start development server
	hugo server

.PHONY: dev
dev: ## Opens browser and starts server
	start http://localhost:1313 && hugo server

.PHONY: build
build: ## Builds production website for alfonszelicko.com
	hugo -d public --minify --gc
# 	hugo -d public --minify --gc -b https://alfonszelicko.com

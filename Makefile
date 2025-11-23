.DEFAULT_GOAL := help

.PHONY: help
help:
	@printf "%-30s %-60s\n" "[Sub command]" "[Description]"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %-60s\n", $$1, $$2}'

.PHONY: pr-merge-main
pr-merge-main: ## feature ブランチを作成して main ブランチに merge
	@bash scripts/pr-merge-main.sh

.PHONY: pr-create-pre-production
pr-create-pre-production: ## pre-production ブランチを production ブランチに merge する PR をつくる
	@bash scripts/pr-create-pre-production.sh

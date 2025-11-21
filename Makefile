.DEFAULT_GOAL := help

.PHONY: help
help:
	@printf "%-30s %-60s\n" "[Sub command]" "[Description]"
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %-60s\n", $$1, $$2}'

.PHONY: pr_merge_main
pr_merge_main: ## pr_merge_main
	@BRANCH="feature/$$(openssl rand -hex 4)" && \
	TIMESTAMP=$$(date '+%Y-%m-%dT%H:%M:%S') && \
	git branch "$${BRANCH}" && \
	git switch "$${BRANCH}" && \
	COMMIT="$${TIMESTAMP}_$$(openssl rand -hex 6)" && \
	touch files/$${COMMIT}.txt && \
	git add -A && \
	git commit -m "$${COMMIT}" && \
	COMMIT="$${TIMESTAMP}_$$(openssl rand -hex 6)" && \
	touch files/$${COMMIT}.txt && \
	git add -A && \
	git commit -m "$${COMMIT}" && \
	COMMIT="$${TIMESTAMP}_$$(openssl rand -hex 6)" && \
	touch files/$${COMMIT}.txt && \
	git add -A && \
	git commit -m "$${COMMIT}" && \
	git push -u origin "$${BRANCH}" && \
	gh pr create && \
	gh pr merge --auto --squash


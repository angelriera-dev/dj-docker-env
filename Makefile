

SHELL := /bin/sh

.PHONY: dev temp

dev:
	@docker compose up -d --build

clear:
	@docker compose down


temp:
	@tty_flag=""; if [ -t 0 ]; then tty_flag="-t"; fi; \
	docker run -i $$tty_flag --rm -v "$(PWD):/app" -w /app --name my-dev-container python:bullseye bash

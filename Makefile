BUF=buf

.PHONY: generate
generate: generate-py
	$(BUF) generate

generate-py:
	$(BUF) generate --template buf.gen.py.yaml

.PHONY: lint
lint:
	$(BUF) lint

.PHONY: format
format:
	$(BUF) format -w

.PHONY: breaking
breaking:
	$(BUF) breaking --against '.git#branch=main'

.PHONY: dep-update
dep-update:
	$(BUF) dep update

.PHONY: clean
clean:
	rm -rf gen

.PHONY: all
all: format lint generate
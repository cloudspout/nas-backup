.PHONY: install run


install:
	brew install pre-commit gawk coreutils cfn-lint
	brew install checkov semgrep markdownlint-cli shellcheck
	pre-commit install

run:
	pre-commit run -a

update:
	pre-commit autoupdate

audit-secrets:
	detect-secrets scan > .secrets.baseline
	detect-secrets audit .secrets.baseline

default: run

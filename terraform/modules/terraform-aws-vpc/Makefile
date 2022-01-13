.PHONY: test docs version

default:
	test

# currently we only test linting, in future we may need integration test
test:
	terraform fmt && terraform init && terraform validate .

docs:
	terraform-docs --sort-by required md . > docs/variables_and_outputs.md

version:
	@cat version

.PHONY: help

help: ## Show this help
	@echo "Usage: make [target]"
	@echo ""
	@echo "Terraform (tf-*):"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' terraform/Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36mtf-%-12s\033[0m %s\n", $$1, $$2}'

tf-%:
	@$(MAKE) -C terraform $* --no-print-directory

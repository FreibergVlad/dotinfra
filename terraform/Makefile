TF ?= tofu

.PHONY: init plan apply destroy fmt validate refresh output ip ipv6 ssh ssh-config clean

init: ## Initialize
	$(TF) init

plan: ## Show execution plan
	$(TF) plan

apply: ## Apply changes
	$(TF) apply

destroy: ## Destroy all infrastructure
	$(TF) destroy

refresh: ## Refresh state
	$(TF) refresh

fmt: ## Format .tf files
	$(TF) fmt

validate: ## Validate configuration
	$(TF) validate

output: ## Show all outputs
	$(TF) output

ip: ## Show server IPv4
	@$(TF) output -raw server_ipv4

ipv6: ## Show server IPv6
	@$(TF) output -raw server_ipv6

ssh: ## SSH into server
	@$$($(TF) output -raw ssh_command)

ssh-config: ## Print SSH config block
	@$(TF) output -raw ssh_config

clean: ## Remove .terraform and backups
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate.backup

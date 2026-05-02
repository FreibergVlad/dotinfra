# dotinfra

Personal infrastructure. Single Hetzner VPS running k3s.

## What's inside

**Server** (~5€/mo on Hetzner cx22):
- Ubuntu 24.04, unattended upgrades with 4am reboots
- k3s — batteries-included Kubernetes (Traefik, CoreDNS, local-path)
- SSH on non-standard port, key-only auth
- fail2ban + ufw on top of cloud firewall

**Code:**
```
terraform/   # Provisions VPS, configures everything via cloud-init
k8s/         # Manifests (empty for now)
```

## Quick start

```sh
cp terraform/terraform.example.tfvars terraform/terraform.tfvars
vim terraform/terraform.tfvars  # add Hetzner token and SSH private key path
make tf-init && make tf-apply

# Add to SSH config and connect
make ssh-config >> ~/.ssh/config
ssh dotinfra
```

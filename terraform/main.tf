resource "hcloud_ssh_key" "main" {
  name       = "${var.name_prefix}-ssh-key"
  public_key = file(pathexpand(var.ssh_public_key_path))
}

resource "hcloud_firewall" "main" {
  name = "${var.name_prefix}-firewall"

  # SSH
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = var.ssh_port
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  # HTTP
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  # HTTPS
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  # ICMP (ping)
  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
}

resource "hcloud_server" "main" {
  name        = "${var.name_prefix}-vps"
  image       = var.server_image
  server_type = var.server_type
  location    = var.server_location
  user_data = templatefile("${path.module}/cloud-init.yaml", {
    username       = var.username
    ssh_public_key = file(pathexpand(var.ssh_public_key_path))
    ssh_port       = var.ssh_port
  })
  ssh_keys     = [hcloud_ssh_key.main.name]
  firewall_ids = [hcloud_firewall.main.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}
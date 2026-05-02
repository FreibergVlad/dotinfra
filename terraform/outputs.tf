output "server_ipv4" {
  value = hcloud_server.main.ipv4_address
}

output "server_ipv6" {
  value = hcloud_server.main.ipv6_address
}

output "ssh_command" {
  value = "ssh -i ${trimsuffix(var.ssh_public_key_path, ".pub")} -p ${var.ssh_port} ${var.username}@${hcloud_server.main.ipv4_address}"
}

output "ssh_config" {
  value = <<-EOF
    Host ${var.name_prefix}
      HostName ${hcloud_server.main.ipv4_address}
      User ${var.username}
      Port ${var.ssh_port}
      IdentityFile ${trimsuffix(var.ssh_public_key_path, ".pub")}
  EOF
}

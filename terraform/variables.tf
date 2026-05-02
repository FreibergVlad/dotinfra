variable "name_prefix" {
  type = string
}

variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "ssh_public_key_path" {
  type = string
}

variable "server_type" {
  type = string
}

variable "server_image" {
  type = string
}

variable "server_location" {
  type = string
}

variable "ssh_port" {
  type = number
}

variable "username" {
  type = string
}

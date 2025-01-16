variable "proxmox_host" {
  type        = string
  description = "proxmox host"
}

variable "proxmox_token_id" {
  type        = string
  description = "proxmox token id"
  sensitive   = true
}

variable "proxmox_token_secret" {
  type        = string
  description = "proxmox token secret"
  sensitive   = true
}

variable "proxmox_node" {
  type        = string
  description = "name of the proxmox node"
}

variable "proxmox_storage_location" {
  type        = string
  description = "target resource pool on the proxmox server"
}

variable "hostname" {
  type        = string
  description = "hostname of the lxc"
}

variable "mesh_proxmox_template_image" {
  type        = string
  description = "name of the template you have already setup in proxmox"
  default     = "debian-cloud"
}

variable "mesh_local_user" {
  type        = string
  description = "local user username"
  default     = "debian"
}

variable "local_password" {
  type        = string
  description = "password for the local user"
  sensitive   = true
}

variable "vm_nic" {
  type        = string
  description = "nic for the vm"
  default     = "vmbr0"
}

variable "vm_mgt_ip" {
  type        = string
  description = "IP for the managment interface"
}

variable "internal_host_identifier" {
  type        = string
  description = "Host identifier for the internal network interface eth0"
  default     = "24"
}

variable "vm_mgt_default_gateway" {
  type        = string
  description = "IP of the default gateway of the managment interface"
}

variable "router_id" {
  type        = string
  description = "IP to use for the router id"
}

variable "bird_neighbor" {
  type        = string
  description = "neighbor for the ospf router"
}

variable "bird_network" {
  type        = string
  description = "ospf network"
}

variable "ntp_ip" {
  type        = string
  description = "IP to use for the ntp service"
  default     = "10.69.0.0/16"
}

variable "datadog_api_key" {
  type        = string
  description = "datadog API key"
  sensitive   = true
}

variable "datadog_site" {
  type        = string
  description = "datadog site url"
  sensitive   = true
}

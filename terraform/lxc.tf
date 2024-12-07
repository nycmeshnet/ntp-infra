resource "proxmox_lxc" "ntp_server" {
  target_node  = var.proxmox_node
  hostname     = var.hostname
  description  = "NTP server managed IaC via https://github.com/nycmesh/ntp-infra"
  ostemplate   = var.system_image
  password     = var.local_password
  cores        = 1
  memory       = 1024
  unprivileged = true
  start        = true
  onboot       = true

  ssh_public_keys = file("${path.root}/ntp.pub")

  rootfs {
    storage = var.proxmox_storage_location
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = var.vm_nic
    ip     = "${var.vm_mgt_ip}/${var.internal_host_identifier}"
    gw     = var.vm_mgt_default_gateway
  }

  tags = "ntp,managed_by_iac"
}

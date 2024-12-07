resource "proxmox_vm_qemu" "ntp_server" {
  name        = var.hostname
  desc        = "NTP server managed IaC via https://github.com/nycmesh/ntp-infra"
  target_node = var.proxmox_node

  clone = var.mesh_proxmox_template_image

  cores                   = 1
  sockets                 = 1
  memory                  = 1024
  os_type                 = "cloud-init"
  agent                   = 1
  cloudinit_cdrom_storage = var.proxmox_storage_location
  ciuser                  = var.mesh_local_user
  cipassword              = var.local_password

  scsihw = "virtio-scsi-pci"

  disks {
    scsi {
      scsi0 {
        disk {
          backup  = false
          size    = "20G"
          storage = var.proxmox_storage_location
        }
      }
    }
  }

  network {
    bridge = var.vm_nic
    model  = "virtio"
  }

  ipconfig0 = "ip=${var.vm_mgt_ip}/${var.internal_host_identifier},gw=${var.vm_mgt_default_gateway}"

  ssh_user        = "root"
  ssh_private_key = file("${path.root}/ntp")

  sshkeys = file("${path.root}/ntp.pub")

  serial {
    id   = 0
    type = "socket"
  }

  tags = "managed_by_iac,ntp"

  lifecycle {
    ignore_changes = [
      qemu_os,
    ]
  }
}

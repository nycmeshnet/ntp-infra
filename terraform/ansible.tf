resource "ansible_group" "ntp_mgt_group" {
  name = "ntp_mgt"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/ntp"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    DATADOG_API_KEY              = var.datadog_api_key
    DATADOG_SITE                 = var.datadog_site
    VM_HOSTNAME                  = var.hostname
    bird_router_id               = var.router_id
    bird_network                 = var.bird_network
    NTP_IP                       = var.ntp_ip
    INTERNAL_NETWORK_RANGE       = var.internal_host_identifier
    local_password               = var.local_password
  }
}

resource "ansible_host" "ntp_mgt" {
  name   = var.vm_mgt_ip
  groups = [ansible_group.ntp_mgt_group.name]
}

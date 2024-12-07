resource "ansible_group" "ntp_mgt_group" {
  name = "ntp_mgt"
  variables = {
    ansible_user                 = var.mesh_local_user
    ansible_ssh_private_key_file = "../terraform/messh"
    ansible_ssh_common_args      = "-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
    DATADOG_API_KEY              = var.datadog_api_key
    DATADOG_SITE                 = var.datadog_site
    VM_HOSTNAME                  = var.hostname
    ROUTER_ID                    = var.router_id
    BIRD_NETWORK                 = bar.bird_network
    BIRD_NEIGHBOR                = var.bird_neighbor
    NTP_IP                       = var.ntp_ip
  }
}

resource "ansible_host" "ntp_mgt" {
  name   = var.vm_mgt_ip
  groups = [ansible_group.ntp_mgt_group.name]
}

resource "ovh_cloud_project_network_private" "this" {
  service_name = var.service_name
  name         = var.name
  regions      = [var.region]
  vlan_id      = 0
}

resource "ovh_cloud_project_network_private_subnet" "this" {
  service_name = var.service_name
  network_id   = ovh_cloud_project_network_private.this.id
  region       = var.region
  start        = var.dhcp_start
  end          = var.dhcp_end
  network      = var.cidr
  dhcp         = true
  no_gateway   = false
}

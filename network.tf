resource "ovh_cloud_project_network_private" "private_network" {
  service_name = var.service_name
  name         = "private-network"
  regions      = [var.region]
  vlan_id      = 0
}

resource "ovh_cloud_project_network_private_subnet" "private_subnet" {
  service_name = var.service_name
  network_id   = ovh_cloud_project_network_private.private_network.id
  region       = var.region
  start        = "10.0.0.100"
  end          = "10.0.0.200"
  network      = "10.0.0.0/24"
  dhcp         = true
  no_gateway   = false
}

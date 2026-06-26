output "private_network_openstackid" {
  value = [
    for r in ovh_cloud_project_network_private.this.regions_attributes :
    r.openstackid if r.region == var.region
  ][0]
  depends_on = [ovh_cloud_project_network_private_subnet.this]
}

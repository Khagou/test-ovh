locals {
  # Extrait l'ID OpenStack du réseau privé pour la région cible
  private_network_openstackid = [
    for r in ovh_cloud_project_network_private.private_network.regions_attributes :
    r.openstackid if r.region == var.region
  ][0]
}

resource "ovh_cloud_project_kube" "cluster" {
  service_name = var.service_name
  name         = var.cluster_name
  region       = var.region

  private_network_id = local.private_network_openstackid

  private_network_configuration {
    default_vrack_gateway              = ""
    private_network_routing_as_default = false
  }

  depends_on = [ovh_cloud_project_network_private_subnet.private_subnet]
}

resource "ovh_cloud_project_kube_nodepool" "node_pool" {
  service_name  = var.service_name
  kube_id       = ovh_cloud_project_kube.cluster.id
  name          = "default-pool"
  flavor_name   = "b3-8"
  desired_nodes = var.node_pool_min_nodes
  min_nodes     = var.node_pool_min_nodes
  max_nodes     = var.node_pool_max_nodes
  autoscale     = true
}

locals {
  region_short = regex("^[A-Za-z]+", var.region)

  network    = yamldecode(file("${path.module}/data/network.yaml"))
  kubernetes = yamldecode(file("${path.module}/data/kubernetes.yaml"))
  database   = yamldecode(file("${path.module}/data/database.yaml"))
  registry   = yamldecode(file("${path.module}/data/registry.yaml"))
}

module "network" {
  source       = "./modules/network"
  service_name = var.service_name
  region       = var.region
  name         = local.network.name
  cidr         = local.network.cidr
  dhcp_start   = local.network.dhcp_start
  dhcp_end     = local.network.dhcp_end
}

module "kubernetes" {
  for_each = { for c in local.kubernetes.clusters : c.name => c }

  source             = "./modules/kubernetes"
  service_name       = var.service_name
  region             = var.region
  cluster_name       = each.value.name
  private_network_id = module.network.private_network_openstackid
  node_flavor        = each.value.node_flavor
  min_nodes          = each.value.min_nodes
  max_nodes          = each.value.max_nodes
}

module "database" {
  for_each = { for d in local.database.databases : d.name => d }

  source         = "./modules/database"
  service_name   = var.service_name
  region         = local.region_short
  description    = each.value.name
  engine_version = each.value.version
  plan           = each.value.plan
  flavor         = each.value.flavor
}

module "registry" {
  for_each = { for r in local.registry.registries : r.name => r }

  source        = "./modules/registry"
  service_name  = var.service_name
  region        = local.region_short
  registry_name = each.value.name
}

data "ovh_cloud_project_containerregistry_capabilities" "this" {
  service_name = var.service_name
  region_name  = var.region
}

locals {
  plan = [
    for p in data.ovh_cloud_project_containerregistry_capabilities.this.plans :
    p if p.name == var.plan
  ][0]
}

resource "ovh_cloud_project_containerregistry" "this" {
  service_name = var.service_name
  name         = var.name
  region       = var.region
  plan_id      = local.plan.id
}

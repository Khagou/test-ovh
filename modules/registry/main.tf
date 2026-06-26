terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.46"
    }
  }
}

data "ovh_cloud_project_capabilities_containerregistry" "this" {
  service_name = var.service_name
}

locals {
  plan = [
    for p in data.ovh_cloud_project_capabilities_containerregistry.this.plans :
    p if p.name == var.plan
  ][0]
}

resource "ovh_cloud_project_containerregistry" "this" {
  service_name = var.service_name
  name         = var.name
  region       = var.region
  plan_id      = local.plan.id
}

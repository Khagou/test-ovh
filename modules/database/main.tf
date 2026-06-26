terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.46"
    }
  }
}

resource "ovh_cloud_project_database" "this" {
  service_name = var.service_name
  description  = var.description
  engine       = "postgresql"
  version      = var.engine_version
  plan         = var.plan

  nodes {
    region = var.region
    flavor = var.flavor
  }
}

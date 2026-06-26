resource "ovh_cloud_project_database" "this" {
  service_name = var.service_name
  description  = var.description
  engine       = "postgresql"
  version      = var.engine_version
  plan         = var.plan
  flavor       = var.flavor

  nodes {
    region = var.region
  }
}

data "ovh_cloud_project_capabilities_containerregistry_filter" "regcap" {
  service_name = var.service_name
  plan_name    = var.registry_plan
  region       = var.region
}
resource "ovh_cloud_project_containerregistry" "registry" {
  service_name = data.ovh_cloud_project_capabilities_containerregistry_filter.regcap.service_name
  plan_id      = data.ovh_cloud_project_capabilities_containerregistry_filter.regcap.id
  region       = data.ovh_cloud_project_capabilities_containerregistry_filter.regcap.region
  name         = var.registry_name
}

# resource "ovh_cloud_project_containerregistry_user" "ci_user" {
#   service_name = ovh_cloud_project_containerregistry.registry.service_name
#   registry_id  = ovh_cloud_project_containerregistry.registry.id
#   email        = "ci@example.com"
#   login        = "ci-user"
# }
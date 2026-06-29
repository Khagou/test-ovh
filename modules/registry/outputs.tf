output "id" {
  value = ovh_cloud_project_containerregistry.registry.id
}

output "url" {
  value = ovh_cloud_project_containerregistry.registry.url
}
output "password" {
  value     = ovh_cloud_project_containerregistry_user.ci_user.password
  sensitive = true
}

output "id" {
  value = ovh_cloud_project_database.this.id
}

output "endpoints" {
  value     = ovh_cloud_project_database.this.endpoints
  sensitive = true
}

output "status" {
  value = ovh_cloud_project_database.this.status
}

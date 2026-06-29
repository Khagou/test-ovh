output "cluster_ids" {
  value = { for k, v in module.kubernetes : k => v.cluster_id }
}

output "cluster_statuses" {
  value = { for k, v in module.kubernetes : k => v.cluster_status }
}

output "kubeconfigs" {
  value     = { for k, v in module.kubernetes : k => v.kubeconfig }
  sensitive = true
}

output "database_ids" {
  value = { for k, v in module.database : k => v.id }
}

output "database_endpoints" {
  value     = { for k, v in module.database : k => v.endpoints }
  sensitive = true
}

output "registry_urls" {
  value = { for k, v in module.registry : k => v.url }
}

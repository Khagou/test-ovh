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

output "registry_users" {
  value = { for k, v in module.registry : k => v.user }
}

output "registry_passwords" {
  value     = { for k, v in module.registry : k => v.password }
  sensitive = true
}

# Outputs singuliers pour le registry "registry" (utilisés par le workflow CI)
output "registry_url" {
  value       = module.registry["registry"].url
  description = "URL du Container Registry OVH"
}

output "registry_login" {
  value       = module.registry["registry"].user
  description = "Login du CI user sur le registry"
}

output "registry_password" {
  value       = module.registry["registry"].password
  sensitive   = true
  description = "Mot de passe du CI user sur le registry"
}

# output "app_url" {
#   value       = "http://${module.app.load_balancer_ip}"
#   description = "URL publique de l'application déployée sur Kubernetes"
# }

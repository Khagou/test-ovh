output "load_balancer_ip" {
  description = "IP externe du Service LoadBalancer (disponible après provisionnement OVH)"
  value       = try(kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip, "pending")
}

output "service_name" {
  description = "Nom du Service Kubernetes"
  value       = kubernetes_service.app.metadata[0].name
}

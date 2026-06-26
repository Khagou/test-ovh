output "cluster_id" {
  value = ovh_cloud_project_kube.this.id
}

output "cluster_status" {
  value = ovh_cloud_project_kube.this.status
}

output "kubeconfig" {
  value     = ovh_cloud_project_kube.this.kubeconfig
  sensitive = true
}

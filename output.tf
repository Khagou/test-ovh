output "cluster_id" {
  value = ovh_cloud_project_kube.cluster.id
}

output "cluster_status" {
  value = ovh_cloud_project_kube.cluster.status
}

output "kubeconfig" {
  value     = ovh_cloud_project_kube.cluster.kubeconfig
  sensitive = true
}

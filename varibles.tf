variable "ovh_client_id" {
  type      = string
  sensitive = true
}

variable "ovh_client_secret" {
  type      = string
  sensitive = true
}

variable "service_name" {
  type        = string
  description = "ID du projet OVH Public Cloud (visible dans l'URL du manager : /public-cloud/pci/projects/<ID>)"
}

variable "region" {
  type        = string
  default     = "GRA9"
  description = "Région OVH Public Cloud"
}

variable "cluster_name" {
  type    = string
  default = "my-kube-cluster"
}

variable "node_pool_min_nodes" {
  type    = number
  default = 1
}

variable "node_pool_max_nodes" {
  type    = number
  default = 3
}

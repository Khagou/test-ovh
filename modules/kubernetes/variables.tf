variable "service_name" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "kube-cluster"
}

variable "private_network_id" {
  type = string
}

variable "node_flavor" {
  type    = string
  default = "b3-8"
}

variable "min_nodes" {
  type    = number
  default = 1
}

variable "max_nodes" {
  type    = number
  default = 3
}

variable "service_name" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type    = string
  default = "private-network"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "dhcp_start" {
  type    = string
  default = "10.0.0.100"
}

variable "dhcp_end" {
  type    = string
  default = "10.0.0.200"
}

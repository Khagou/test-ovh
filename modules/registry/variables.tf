variable "service_name" {
  type = string
}

variable "region" {
  type        = string
  description = "Région courte (ex: GRA, SBG) — format OVH Registry"
}

variable "registry_name" {
  type    = string
  default = "registry"
}

variable "registry_plan" {
  type = string
  description = "Taille du registry"
  default = "SMALL"
}

variable "email" {
  type = string
  description = "email du user"
}

variable "login" {
  type = string
  description = "login du user"
}
variable "service_name" {
  type = string
}

variable "region" {
  type        = string
  description = "Région courte (ex: GRA, SBG) — format OVH Registry"
}

variable "name" {
  type    = string
  default = "registry"
}

variable "plan_id" {
  type        = string
  description = "ID du plan OVH Registry — GET /cloud/project/{id}/capabilities/containerRegistry"
}

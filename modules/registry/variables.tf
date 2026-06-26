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

variable "plan" {
  type        = string
  default     = "SMALL"
  description = "Plan OVH Registry : SMALL (5GB), MEDIUM (100GB), LARGE (unlimited)"
}

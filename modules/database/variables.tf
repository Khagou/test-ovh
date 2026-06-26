variable "service_name" {
  type = string
}

variable "region" {
  type        = string
  description = "Région courte (ex: GRA, SBG) — format OVH Databases"
}

variable "description" {
  type    = string
  default = "postgresql"
}

variable "engine_version" {
  type    = string
  default = "16"
}

variable "plan" {
  type    = string
  default = "essential"
}

variable "flavor" {
  type        = string
  default     = "db1-4"
  description = "Flavor OVH Databases (db1-4, db1-7, db1-15…)"
}

variable "app_name" {
  type        = string
  description = "Nom de l'application (utilisé comme label Kubernetes)"
}

variable "image" {
  type        = string
  description = "Référence complète de l'image (registry_url/project/name:tag)"
}

variable "replicas" {
  type        = number
  default     = 2
  description = "Nombre de réplicas du Deployment"
}

variable "port" {
  type        = number
  default     = 80
  description = "Port exposé par le container"
}

variable "registry_url" {
  type        = string
  description = "URL du Container Registry OVH (ex: registry-xxx.ovh.net)"
}

variable "registry_username" {
  type        = string
  description = "Login du CI user sur le registry"
}

variable "registry_password" {
  type        = string
  sensitive   = true
  description = "Mot de passe du CI user sur le registry"
}

terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = ">= 0.46.0, < 0.50.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "test-tfstate"
    region = "eu-west-par"

    endpoints = {
      s3 = "https://s3.eu-west-par.io.cloud.ovh.net"
    }

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    use_path_style              = true
  }
}


provider "ovh" {
  endpoint      = "ovh-eu"
  client_id     = var.ovh_client_id
  client_secret = var.ovh_client_secret
}

# Le kubeconfig est parsé depuis le module kubernetes (disponible après le premier apply -target).
# Premier apply : terraform apply -target=module.network -target=module.kubernetes -target=module.registry -target=module.database
# Deuxième apply : terraform apply  (déploie l'app via ce provider)
provider "kubernetes" {
  host                   = local._kube.clusters[0].cluster.server
  cluster_ca_certificate = base64decode(local._kube.clusters[0].cluster["certificate-authority-data"])
  client_certificate     = base64decode(local._kube.users[0].user["client-certificate-data"])
  client_key             = base64decode(local._kube.users[0].user["client-key-data"])
}

terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.46"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "test-tfstate"
    key    = "ovh/terraform.tfstate"
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

# Le kubeconfig est produit par le module kubernetes après création du cluster.
# Premier apply : terraform apply -target=module.network -target=module.kubernetes -target=module.registry -target=module.database
# Deuxième apply : terraform apply  (déploie l'app via ce provider)
provider "kubernetes" {
  config_raw = module.kubernetes["kube-cluster"].kubeconfig
}

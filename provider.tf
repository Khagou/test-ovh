terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.46"
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

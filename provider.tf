terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "~> 0.46"
    }
  }

  backend "s3" {
    bucket = "test-tfstate"   # nom de ton bucket OVH Object Storage
    key    = "ovh/terraform.tfstate"
    region = "eu-west-par"

    endpoints = {
      s3 = "https://s3.eu-west-par.io.cloud.ovh.net"
    }

    # Credentials S3 de l'OpenStack user créé pour le bucket
    # Passés via env vars AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY
    # (ou -backend-config à l'init)

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    use_path_style              = true
  }
}

provider "ovh" {
  endpoint      = "ovh-eu"
  client_id     = "EU.12e8aed2e6667fcf"
  client_secret = "064b3412188866a5ff2f58acefd48044Q"
}

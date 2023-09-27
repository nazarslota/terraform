# https://developer.hashicorp.com/terraform/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-staging"
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13"
    }
  }
}

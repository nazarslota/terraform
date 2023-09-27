# https://developer.hashicorp.com/terraform/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = var.backend_bucket
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>4.0"
    }
  }
}

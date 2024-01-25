# modules/net/subnet/providers.tf

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>5.12"
    }
  }
}

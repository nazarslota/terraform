# https://developer.hashicorp.com/terraform/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket"
    prefix = "terraform/state"
  }
}

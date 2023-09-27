# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

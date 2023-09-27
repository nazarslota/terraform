# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "primary" {
  name     = var.k8s_cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = var.k8s_node_count
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.k8s_node_pool_name
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.k8s_node_count

  node_config {
    preemptible  = true
    machine_type = "f1-micro"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "primary" {
  name               = var.k8s_cluster_name
  location           = var.zone
  initial_node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

resource "google_container_cluster" "primary" {
  name               = "primary"
  location           = var.region
  initial_node_count = 1

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  addons_config {
    network_policy_config {
      disabled = false
    }

    http_load_balancing {
      disabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  node_pool {
    name       = "default-pool"
    node_count = 1

    node_config {
      preemptible  = false
      machine_type = "n1-standard-1"

      metadata = {
        disable-legacy-endpoints = "true"
      }

      oauth_scopes = [
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/devstorage.read_only",
      ]
    }
  }

  network    = "default"
  subnetwork = "default"
}


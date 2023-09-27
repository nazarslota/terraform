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

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
  client_certificate     = base64decode(google_container_cluster.primary.master_auth[0].client_certificate)
  client_key             = base64decode(google_container_cluster.primary.master_auth[0].client_key)
}

resource "kubernetes_deployment" "my-go-app" {
  metadata {
    name = "my-go-app-deployment"
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "my-go-app"
      }
    }
    template {
      metadata {
        labels = {
          app = "my-go-app"
        }
      }
      spec {
        container {
          name  = "my-go-app"
          image = "gcr.io/${var.project_id}/my-go-app"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "my-go-app" {
  metadata {
    name = "my-go-app-service"
  }
  spec {
    selector = {
      app = "my-go-app"
    }
    port {
      port        = 80
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}

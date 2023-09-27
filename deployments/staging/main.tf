provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "google_container_cluster" "primary" {
  name     = var.k8s_cluster_name
  location = var.zone

  initial_node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"
  }
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
      app = kubernetes_deployment.my-go-app.spec.0.template.0.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

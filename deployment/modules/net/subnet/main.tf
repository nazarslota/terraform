# modules/vpc/subnets/main.tf

resource "google_compute_subnetwork" "subnet" {
  name = "${var.name}-subnet"

  region        = var.region
  network       = var.vpc_self_link
  ip_cidr_range = var.ip_cidr_range

  secondary_ip_range {
    range_name    = "${var.name}-cluster-secondary-range"
    ip_cidr_range = var.cluster_secondary_ip_range
  }

  secondary_ip_range {
    range_name    = "${var.name}-services-secondary-range"
    ip_cidr_range = var.services_secondary_ip_range
  }
}

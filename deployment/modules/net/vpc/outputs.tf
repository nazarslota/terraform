# modules/net/vpc/main.tf

output "self_link" {
  value       = google_compute_network.vpc.self_link
  description = "The URI of the VPC, with generated suffix."
}

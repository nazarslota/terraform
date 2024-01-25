# modules/net/subnet/outputs.tf.tf

output "self_link" {
  value       = google_compute_subnetwork.subnet.self_link
  description = "The subnet self link."
}

output "ip_cidr_range" {
  value       = google_compute_subnetwork.subnet.ip_cidr_range
  description = "The subnet IP CIDR range."
}

output "cluster_secondary_range_name" {
  value       = google_compute_subnetwork.subnet.secondary_ip_range.0.range_name
  description = "The cluster secondary range name."
}

output "services_secondary_range_name" {
  value       = google_compute_subnetwork.subnet.secondary_ip_range.1.range_name
  description = "The services secondary range name."
}

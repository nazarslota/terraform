# modules/net/subnet/variables.tf

variable "name" {
  type        = string
  description = "The name of the subnet. Will be used as a prefix for all resources."
}

variable "region" {
  type        = string
  description = "The region to create the subnet in. e.g. us-central1"
}

variable "vpc_self_link" {
  type        = string
  description = "The self link of the VPC to create the subnet in."
}

variable "ip_cidr_range" {
  type        = string
  description = "The IP CIDR range of the subnet. e.g. 10.0.0.0/20"
}

variable "cluster_secondary_ip_range" {
  type        = string
  description = "The secondary IP range of the cluster. e.g. 10.0.16.0/20"
}

variable "services_secondary_ip_range" {
  type        = string
  description = "The secondary IP range of the services. e.g. 10.0.32.0/20"
}

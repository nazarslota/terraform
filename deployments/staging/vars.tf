variable "project_id" {
  description = "The ID of the project in GCP"
  type        = string
  default     = "unotes-000"
}

variable "region" {
  description = "The region where resources should be created in GCP"
  type        = string
  default     = "us-east4"
}

variable "zone" {
  description = "The zone where resources should be created in GCP"
  type        = string
  default     = "us-east4-a"
}

# Kubernetes cluster variables.
variable "k8s_cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "staging"
}

variable "k8s_node_pool_name" {
  description = "The name of the Kubernetes node pool."
  type        = string
  default     = "staging-pool"
}

variable "k8s_machine_type" {
  description = "The machine type to use for the Kubernetes cluster."
  type        = string
  default     = "e2-medium"
}

variable "k8s_node_count" {
  description = "The number of nodes in the Kubernetes cluster."
  type        = number
  default     = 1
}

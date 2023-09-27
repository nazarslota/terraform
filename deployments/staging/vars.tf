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

variable "backend_bucket" {
  description = "The name of the bucket to store terraform state"
  type        = string
  default     = "terraform-state-bucket-staging"
}

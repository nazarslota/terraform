# backends.tf

terraform {
  backend "gcs" {
    bucket = "devops-411922"
    prefix = "terraform/state"
  }
}

# main.tf

provider "google" {
  project = var.project
}

module "vpc" {
  source = "./modules/net/vpc"
  name   = "global"
}

module "subnet" {
  source = "./modules/net/subnet"

  name          = "subnet"
  region        = "us-central1"
  vpc_self_link = module.vpc.self_link

  ip_cidr_range               = "10.0.0.0/20"
  cluster_secondary_ip_range  = "10.0.16.0/20"
  services_secondary_ip_range = "10.0.32.0/20"

  depends_on = [module.vpc]
}

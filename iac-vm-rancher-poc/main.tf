# Define the provider for GCP
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Import network module
module "network" {
  source            = "./network"
  network_name      = var.network_name
  subnetwork_name   = var.subnetwork_name
}

# Import Rancher module
module "rancher_instance" {
  source = "./modules/rancher"

  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  rancher_image = var.rancher_image

  network    = module.network.network_name
  subnetwork = module.network.subnetwork_name
}

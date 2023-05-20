# Define el proveedor de GCP
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Importar configuración de la red y subred
module "network" {
  source = "./modules/network"
}

# Llama al módulo de Rancher
module "rancher_instance" {
  source = "./modules/rancher"

  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  rancher_image = var.rancher_image

  network = module.network.network_name
  subnetwork = module.network.subnetwork_name
}
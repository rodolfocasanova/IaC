# Define el proveedor de GCP
provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

# Importar configuración de la red y subred
module "network" {
  source            = "./modules/network"
  network_name      = "my-network"
  subnetwork_name   = "my-subnetwork"
}

# Llama al módulo de Rancher
module "rancher_instance" {
  source = "./modules/rancher"

  instance_name  = var.instance_name
  machine_type   = var.machine_type
  zone           = var.zone
  rancher_image  = var.rancher_image
  gcp_region    = var.gcp_region
  network        = module.network.network_name
  subnetwork     = module.network.subnetwork_name
}

output "instance_name" {
  description = "Nombre de la instancia de VM"
  value       = module.rancher_instance.instance_name
}

output "rancher_public_ip" {
  description = "Dirección IP pública de la instancia de Rancher"
  value       = module.rancher_instance.rancher_public_ip
}

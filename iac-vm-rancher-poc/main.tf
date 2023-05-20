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
resource "google_compute_address" "rancher_ip" {
  name   = "rancher-ip"
  region = var.gcp_region
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
resource "google_compute_instance" "rancher_vm" {
  name         = var.instance_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-minimal-2204-jammy-v20230428"
    }
  }

  network_interface {
    network = "default"
  }

  # Otros argumentos y configuraciones necesarios para la instancia de VM
}

resource "google_compute_address" "rancher_ip" {
  name = "rancher-ip"

  # Otros argumentos y configuraciones necesarios para la dirección IP
}


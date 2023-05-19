# Define el proveedor de GCP
provider "google" {
#  credentials = file("<PATH_TO_SERVICE_ACCOUNT_KEY>")
  project     = var.gcp_project_id
  region      = var.gcp_region
}

# Llama al módulo de Rancher
module "rancher_instance" {
  source = "./modules/rancher"

  instance_name = var.instance_name
  machine_type  = var.machine_type
  zone          = var.zone
  rancher_image = var.rancher_image
}

# Crea una dirección IP pública
resource "google_compute_address" "rancher_ip" {
  name   = "rancher-public-ip"
  region = var.gcp_region
}

# Asocia la dirección IP pública a la instancia de VM
resource "google_compute_address_association" "rancher_ip_association" {
  name          = "rancher-ip-association"
  address       = google_compute_address.rancher_ip.address
  instance_name = module.rancher_instance.instance_name
}

# Define variables
variable "instance_name" {
  description = "Nombre de la instancia de VM"
  type        = string
  default     = "rancher-instance"
}

variable "machine_type" {
  description = "Tipo de máquina de la instancia de VM"
  type        = string
  default     = "n1-standard-1"
}

variable "zone" {
  description = "Zona de GCP donde se creará la instancia de VM"
  type        = string
  default     = "us-central1-a"
}

variable "rancher_image" {
  description = "Imagen de Docker para Rancher"
  type        = string
  default     = "rancher/rancher"
}

variable "gcp_project_id" {
  description = "ID del proyecto de GCP"
  type        = string
  default     = "training-384005"
}

variable "gcp_region" {
  description = "Región de GCP"
  type        = string
  default     = "us-central1"
}

# Define outputs
output "rancher_public_ip" {
  description = "Dirección IP pública de la instancia de Rancher"
  value       = google_compute_address.rancher_ip.address
}

output "rancher_instance_name" {
  description = "Nombre de la instancia de Rancher"
  value       = module.rancher_instance.instance_name
}

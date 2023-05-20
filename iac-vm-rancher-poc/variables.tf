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

variable "network_name" {
  description = "Nombre de la red virtual"
  type        = string
  default     = "my-network"
}

variable "subnetwork_name" {
  description = "Nombre de la subred"
  type        = string
  default     = "my-subnetwork"
}



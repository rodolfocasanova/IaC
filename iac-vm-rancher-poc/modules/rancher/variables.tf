variable "instance_name" {
  description = "Nombre de la instancia de VM"
  type        = string
}

variable "machine_type" {
  description = "Tipo de máquina de la instancia de VM"
  type        = string
}

variable "zone" {
  description = "Zona de GCP donde se creará la instancia de VM"
  type        = string
}

variable "rancher_image" {
  description = "Imagen de Docker para Rancher"
  type        = string
}

variable "network" {
  description = "Nombre de la red virtual"
  type        = string
}

variable "subnetwork" {
  description = "Nombre de la subred"
  type        = string
}

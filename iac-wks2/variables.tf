// Variables para el proyecto raíz
variable "project_id" {
  type        = string
  description = "ID del proyecto de GCP"
  default     = "training-384005"
}

// Variables para el módulo compute-engine
variable "name" {
  type        = string
  description = "Nombre de la instancia"
  default     = "my-instance"
}

variable "zone" {
  type        = string
  description = "Zona en la que se creará la instancia"
  default     = "us-central1-a"
}

variable "disk_image" {
  type        = string
  description = "Imagen del sistema operativo a utilizar en la instancia"
  default     = "ubuntu-os-cloud/ubuntu-minimal-2204-jammy-arm64-v20230428"
}

variable "machine_type" {
  type        = string
  description = "Tipo de máquina a utilizar para la instancia"
  default     = "f1-micro"
}
variable "disk_size_gb" {
  type        = number
  description = "The size of the boot disk in GB"
  default     = 10
}
variable "tags" {
  type        = list(string)
  description = "Etiquetas para la instancia"
  default     = ["web"]
}

#project_id = "my-project-id"
#region = "us-central1"
#machine_type = "f1-micro"
#disk_image = "debian-cloud/debian-10"
#disk_size_gb = 10
#network = "default"
#subnetwork = "default"
#instance_name = "my-instance"
#ssh_username = "my-username"
#ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4q3b4...JvdF9ib3VuY2VzIiwidGxzMSI6IjE1MjIxOTc3MDEifQ== my-username"
#tags = ["web"]
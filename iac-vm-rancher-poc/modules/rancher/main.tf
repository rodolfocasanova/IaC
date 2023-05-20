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

resource "google_compute_instance" "rancher_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.rancher_image
    }
  }

  network_interface {
    network = var.network
    subnetwork = var.subnetwork
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Instala Rancher
    docker run -d --restart=unless-stopped -p 80:80 -p 443:443 ${var.rancher_image}

    # Otros comandos de configuración o instalación
    # ...

    EOF
}

output "instance_name" {
  description = "Nombre de la instancia de VM"
  value       = google_compute_instance.rancher_vm.name
}

output "rancher_public_ip" {
  description = "Dirección IP pública de la instancia de Rancher"
  value       = google_compute_instance.rancher_vm.network_interface[0].access_config[0].nat_ip
}

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
    network    = var.network
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

# Agregar el recurso google_compute_address fuera del bloque del recurso "google_compute_instance"
resource "google_compute_address" "rancher_ip" {
  name   = "rancher-ip"
  region = var.gcp_region
}

output "instance_name" {
  description = "Nombre de la instancia de VM"
  value       = google_compute_instance.rancher_vm.name
}

output "rancher_public_ip" {
  description = "Dirección IP pública de la instancia de Rancher"
  value       = google_compute_address.rancher_ip.address
}

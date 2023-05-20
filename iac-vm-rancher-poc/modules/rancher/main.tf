resource "google_compute_instance" "rancher_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  # Agregar el recurso google_compute_address
  resource "google_compute_address" "rancher_ip" {
    name   = "rancher-ip"
    region = var.region
  }
  
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
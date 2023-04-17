// Crear instancia de Compute Engine
resource "google_compute_instance" "instance" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type
#  image        = var.image

  boot_disk {
    initialize_params {
      image = var.image
 #     size  = var.size
 #     type  = "pd-standard"
     
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Asignar IP externa
    }
  }

  tags = var.tags
}

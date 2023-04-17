provider "google" {
  project = var.project_id
  region  = var.zone
}

module "compute-engine" {
  source         = "./modules/compute-engine"
  zone           = var.zone
  machine_type   = var.machine_type
  image          = var.disk_image
  size           = var.disk_size_gb
  tags           = var.tags
  name           = var.name
  
#  network        = var.network
#  subnetwork     = var.subnetwork
#  instance_name  = var.instance_name

}

resource "google_compute_instance" "instance" {
  name         = "example-instance"
  machine_type = module.compute-engine.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      size = var.disk_size_gb
    }
  }

  network_interface {
    network = "default"
  }

  metadata_startup_script = "echo hello world"
}


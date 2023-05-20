terraform {
  required_providers {
    google = "~> 3.70.0"
  }

  provider google {
    project = var.project_id
    region = var.region
  }

  resource "google_compute_instance" "rancher" {
    name = var.instance_name
    machine_type = var.machine_type
    zone = var.zone

    boot_disk {
      initialize_params {
        image = var.rancher_image
      }
    }

    network_interface {
      network = var.network_name
      subnetwork = var.subnetwork_name
    }
  }

  output "rancher_ip" {
    value = google_compute_instance.rancher.network_interface.0.access_config.0.assigned_nat_ip
  }
}

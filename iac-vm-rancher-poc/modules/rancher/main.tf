resource "google_compute_instance" "rancher_vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Install Rancher
    docker run -d --restart=unless-stopped -p 80:80 -p 443:443 ${var.rancher_image}

    # Other configuration or installation commands
    # ...
  EOF
}

output "instance_name" {
  description = "Name of the VM instance"
  value       = google_compute_instance.rancher_vm.name
}

output "rancher_public_ip" {
  description = "Public IP address of the Rancher instance"
  value       = google_compute_instance.rancher_vm.network_interface[0].access_config[0].nat_ip
}

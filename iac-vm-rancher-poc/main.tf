# Provider configuration
provider "google" {
  project = "training-384005"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# Create the network
resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

# Create a subnet within the network
resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.my_network.self_link
}

# Public IP address resource definition
resource "google_compute_address" "public_ip" {
  name    = "my-public-ip"
  project = "training-384005"
  region  = "us-central1"
}

# Firewall rule to allow HTTP and HTTPS traffic
resource "google_compute_firewall" "allow_http_https" {
  name    = "allow-http-https"
  network = google_compute_network.my_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22","80", "443","8080","8443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = toset(google_compute_instance.vm_instance.tags)
}

# VM resource definition
resource "google_compute_instance" "vm_instance" {
  name         = "my-vm"
  machine_type = "n1-standard-1"
  tags         = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "ubuntu-minimal-2304-lunar-amd64-v20230501"
    }
  }

  network_interface {
    network    = google_compute_network.my_network.self_link
    subnetwork = google_compute_subnetwork.my_subnet.self_link
    access_config {
      nat_ip = google_compute_address.public_ip.address
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo service nginx start
    sudo apt-get install -y docker.io
    #sudo docker run -d --restart=unless-stopped -p 8080:80 -p 8443:443 rancher/server:stable
    docker run -d --restart=unless-stopped \
    -p 8080:80 -p 443:443 \
    -e CATTLE_BOOTSTRAP_PASSWORD=johnwick \
    --privileged \
    rancher/rancher:latest

  EOF
}

# Output the public IP address
output "public_ip_address" {
  value = google_compute_address.public_ip.address
}

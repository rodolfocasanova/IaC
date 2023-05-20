resource "google_compute_network" "my_network" {
  name = var.network_name
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = var.subnetwork_name
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.my_network.name
}

output "network_name" {
  description = "Name of the virtual network"
  value       = google_compute_network.my_network.name
}

output "subnetwork_name" {
  description = "Name of the subnetwork"
  value       = google_compute_subnetwork.my_subnetwork.name
}

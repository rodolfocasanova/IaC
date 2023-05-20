resource "google_compute_network" "my_network" {
  name = "my-network"
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.my_network.name
}

output "network_name" {
  description = "Nombre de la red virtual"
  value       = google_compute_network.my_network.name
}

output "subnetwork_name" {
  description = "Nombre de la subred"
  value       = google_compute_subnetwork.my_subnetwork.name
}

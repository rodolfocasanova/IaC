# main.tf

# Define el recurso de red virtual
resource "google_compute_network" "my_network" {
  name = "my-network"
}

# Define el recurso de subred
resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.my_network.self_link
}

# Output de nombre de la red virtual
output "network_name" {
  description = "Nombre de la red virtual"
  value       = google_compute_network.my_network.name
}

# Output de nombre de la subred
output "subnetwork_name" {
  description = "Nombre de la subred"
  value       = google_compute_subnetwork.my_subnetwork.name
}

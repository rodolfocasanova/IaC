# Creación de la red virtual
resource "google_compute_network" "my_network" {
  name = "my-network"
}

# Creación de la subred
resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.my_network.name
}

output "instance_name" {
  value = google_compute_instance.instance.name
}

output "machine_type" {
  value = var.machine_type
}
output "instance_ip" {
  value = google_compute_instance.instance.network_interface.0.access_config.0.nat_ip
}
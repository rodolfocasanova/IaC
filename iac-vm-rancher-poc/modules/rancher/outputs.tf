output "instance_name" {
  description = "Nombre de la instancia de VM"
  value       = google_compute_instance.rancher_vm.name
}

output "rancher_public_ip" {
  description = "Dirección IP pública de la instancia de Rancher"
  value       = google_compute_address.rancher_ip.address
}
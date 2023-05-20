output "instance_name" {
  description = "Nombre de la instancia de VM"
  value       = module.rancher_instance.instance_name
}

output "rancher_public_ip" {
  description = "Dirección IP pública de la instancia de Rancher"
  value       = module.rancher_instance.rancher_public_ip
}

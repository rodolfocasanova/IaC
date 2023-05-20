output "instance_name" {
  description = "Name of the VM instance"
  value       = module.rancher_instance.instance_name
}

output "rancher_public_ip" {
  description = "Public IP address of the Rancher instance"
  value       = module.rancher_instance.rancher_public_ip
}

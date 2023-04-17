// Valores de salida para el proyecto raíz
output "project_id" {
  value = var.project_id
}

// Valores de salida para el módulo compute-engine

output "instance_name" {
  description = "The name of the compute instance"
  value       = google_compute_instance.instance.name
}

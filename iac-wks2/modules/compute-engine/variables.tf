variable "name" {
  type        = string
  description = "Nombre de la instancia"
}

variable "zone" {
  type        = string
  description = "Zona en la que se creará la instancia"
}

variable "image" {
  type        = string
  description = "Imagen del sistema operativo a utilizar en la instancia"
}
variable "size" {
  type        = number
  description = "Tamanio del HD"
}

variable "machine_type" {
  type        = string
  description = "Tipo de máquina a utilizar para la instancia"
}

variable "tags" {
  type        = list(string)
  description = "Etiquetas para la instancia"
}

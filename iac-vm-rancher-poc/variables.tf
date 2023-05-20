# Define variables
variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "rancher-instance"
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
  default     = "n1-standard-1"
}

variable "zone" {
  description = "GCP zone where the VM will be created"
  type        = string
  default     = "us-central1-a"
}

variable "rancher_image" {
  description = "Docker image for Rancher"
  type        = string
  default     = "rancher/rancher"
}

variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
  default     = "training-384005"
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "my-network"
}

variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
  default     = "my-subnetwork"
}

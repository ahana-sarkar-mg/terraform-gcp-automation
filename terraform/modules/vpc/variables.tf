variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "subnets" {
  description = "List of subnets to create"
  type = list(object({
    name   = string
    cidr   = string
    region = string
  }))
}

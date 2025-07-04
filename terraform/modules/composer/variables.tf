variable "composer_name" {
    description = "The name of the composer"
    type = string
}

variable "region" {
  description = "GCP region for dev"
  type        = string
}

variable "network" {
    description = "GCP network for dev"
    type        = string
}

variable "subnetwork" {
      description = "GCP subnetwork for dev"
  type        = string
}

variable "service_account" {
      description = "GCP sa for dev"
  type        = string
}
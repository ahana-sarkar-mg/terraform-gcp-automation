variable "project_id" {
  description = "GCP project ID for dev"
  type        = string
}

variable "region" {
  description = "GCP region for dev"
  type        = string
}

variable "account_id" {
  description = "Composer service account for dev"
  type        = string
}

variable "display_name" {
  description = "Composer display name for dev"
  type        = string
}

variable "dataset_id" {
  description = "BigQuery dataset ID"
  type        = string
}

variable "friendly_name" {
  description = "BigQuery dataset friendly name"
  type        = string
}

variable "description" {
  description = "BigQuery dataset description"
  type        = string
}

variable "location" {
  description = "BigQuery dataset location"
  type        = string
}

variable "dataplex_location" {
  description = "Dataplex location"
  type        = string
}


variable "composer_name" {
  description = "The name of the composer"
  type        = string
}

variable "dataplex_name" {
  description = "The name of the dataplex"
  type        = string
}
variable "account_id" {
  description = "Composer service account for dev"
  type        = string
}

variable "display_name" {
  description = "Composer display name for dev"
  type        = string
}

variable "project_id" {
  description = "GCP project ID for dev"
  type        = string
}

variable "service_account_roles" {
  description = "List of roles to assign to the service account"
  type        = list(string)
  default = [
    "roles/bigquery.dataEditor",
    "roles/composer.environmentAndStorageObjectUser",
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/composer.worker"
  ]
}
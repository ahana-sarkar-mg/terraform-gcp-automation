terraform {
  backend "gcs" {
    bucket = "terraform-gcp-automation-bucket-state-prod"
    prefix = "envs/prod"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
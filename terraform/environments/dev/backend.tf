terraform {
  backend "gcs" {
    bucket = "iterraform-gcp-automation-bucket-state"
    prefix = "envs/dev"
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
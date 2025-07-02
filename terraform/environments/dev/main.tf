terraform {
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

resource "google_storage_bucket" "test" {
  name     = var.bucket_name
  location = var.region
  uniform_bucket_level_access = true
}

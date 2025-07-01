terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  
  backend "gcs" {
    # Bucket name will be provided via backend config in GitHub Actions
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "Name for the GCS bucket"
  type        = string
}

# Create a simple GCS bucket
resource "google_storage_bucket" "main" {
  name     = var.bucket_name
  location = var.region
  
  # Enable versioning
  versioning {
    enabled = true
  }
  
  # Lifecycle rule to delete objects after 30 days
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
  
  # Uniform bucket-level access
  uniform_bucket_level_access = true
}

output "bucket_name" {
  description = "Name of the created bucket"
  value       = google_storage_bucket.main.name
}

output "bucket_url" {
  description = "URL of the created bucket"
  value       = google_storage_bucket.main.url
}
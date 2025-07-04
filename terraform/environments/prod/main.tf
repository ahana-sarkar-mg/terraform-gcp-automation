terraform {
  backend "gcs" {
    bucket = "YOUR_TF_STATE_BUCKET"
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

module "vpc" {
  source       = "../../modules/vpc"
  project_id   = var.project_id
  network_name = "prod-vpc"
  subnets = [
    {
      name   = "prod-subnet-1"
      cidr   = "10.30.0.0/24"
      region = var.region
    }
  ]
}

variable "project_id" {
  description = "GCP project ID for prod"
  type        = string
}

variable "region" {
  description = "GCP region for prod"
  type        = string
  default     = "us-central1"
}

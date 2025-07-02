terraform {
  backend "gcs" {
    bucket = "terraform-gcp-automation-bucket-state-prod"
    prefix = "envs/prod"
  }
}

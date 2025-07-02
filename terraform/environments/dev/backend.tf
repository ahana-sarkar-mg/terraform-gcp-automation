terraform {
  backend "gcs" {
    bucket = "terraform-gcp-automation-bucket-state"
    prefix = "envs/dev"
  }
}

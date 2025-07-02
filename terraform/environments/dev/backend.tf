terraform {
  backend "gcs" {
    bucket = "terraform-gcp-automation-state-bucket"
    prefix = "envs/dev"
  }
}

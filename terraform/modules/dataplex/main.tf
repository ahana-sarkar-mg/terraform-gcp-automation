resource "google_project_service" "dataplex_api" {
  service = "dataplex.googleapis.com"
  
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
  
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_project_service" "composer_api" {
  service = "composer.googleapis.com"
  
  disable_dependent_services = true
  disable_on_destroy         = false
}

resource "google_dataplex_lake" "dataplex_env" {
  location     = var.dataplex_location
  name         = var.dataplex_name

   depends_on = [
    google_project_service.dataplex_api,
    google_project_service.compute_api,
    google_project_service.composer_api
  ]
}
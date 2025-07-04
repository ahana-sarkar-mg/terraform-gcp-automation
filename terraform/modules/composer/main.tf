resource "google_composer_environment" "composer_env" {
  name   = var.composer_name
  region = var.region
 config {
    software_config {
      image_version = "composer-3-airflow-2"

        pypi_packages = {
            airflow_dbt_python = ""
            apache-airflow-providers-slack = ""
            apache-airflow-providers-google = ""
        }
    }

    environment_size = "ENVIRONMENT_SIZE_SMALL"

    node_config {
      network    = var.network
      subnetwork = var.subnetwork
      service_account = var.service_account
    }
 }
}
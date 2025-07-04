module "vpc" {
  source       = "../../modules/vpc"
  project_id   = var.project_id
  network_name = "im-data-platform-prod-vpc"
  subnets = [
    {
      name   = "im-data-platform-prod-subnet-1"
      cidr   = "10.10.0.0/24"
      region = var.region
    },
    {
      name   = "im-data-platform-prod-subnet-2"
      cidr   = "10.10.1.0/24"
      region = var.region
    }
  ]
}

module "iam" {
  source       = "../../modules/iam"
  account_id   = var.account_id
  display_name = var.display_name
  project_id   = var.project_id
}

module "bigquery" {
  source        = "../../modules/bigquery"
  dataset_id    = var.dataset_id
  friendly_name = var.friendly_name
  description   = var.description
  location      = var.location
}

module "composer" {
  source        = "../../modules/composer"
  composer_name = var.composer_name
  region        = var.region

  depends_on      = [module.iam, module.vpc]
  network         = module.vpc.network_name
  subnetwork      = module.vpc.subnet_names[0]
  service_account = module.iam.sa_name
}

module "dataplex" {
  source = "../../modules/dataplex"

  dataplex_location = var.dataplex_location
  dataplex_name     = var.dataplex_name
}
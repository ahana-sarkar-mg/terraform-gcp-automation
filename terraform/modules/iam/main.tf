resource "google_service_account" "service_account" {
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_project_iam_member" "sa-roles" {
  for_each = toset(var.service_account_roles) 
  project  = var.project_id
  role     = each.value
  member = "serviceAccount:${google_service_account.service_account.email}"
}
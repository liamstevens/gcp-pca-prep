resource "google_project" "billing_account" {
  name                = "EHR Billing Project"
  project_id          = "ehr-billing-account-gcp-pca-prep"
  org_id              = var.organisation_id
  auto_create_network = false
}

resource "google_folder" "department1" {
  display_name = "Department 1"
  parent       = "organizations/1234567"
}

resource "google_project" "compute_project" {
  name                = "EHR Compute Project"
  project_id          = "ehr-compute-project-gcp-pca-prep"
  org_id              = var.organisation_id
  billing_account     = google_project.billing_account.id
  auto_create_network = false
}

resource "google_project" "network_project" {
  name                = "EHR Network Project"
  project_id          = "ehr-network-project-gcp-pca-prep"
  org_id              = var.organisation_id
  billing_account     = google_project.billing_account.id
  auto_create_network = false
}

resource "google_project" "analytics_project" {
  name                = "EHR Analytics Project"
  project_id          = "ehr-analytics-project-gcp-pca-prep"
  billing_account     = google_project.billing_account.id
  org_id              = var.organisation_id
  auto_create_network = false
}

resource "google_project" "database_project" {
  name                = "EHR Database Project"
  project_id          = "ehr-database-project-gcp-pca-prep"
  billing_account     = google_project.billing_account.id
  org_id              = var.organisation_id
  auto_create_network = false
}
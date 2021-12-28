resource "google_project" "billing_account" {
  
}

resource "google_folder" "department1" {
  display_name = "Department 1"
  parent       = "organizations/1234567"
}

resource "google_project" "compute_project" {
  name       = "Compute Project"
  project_id = "ehr-compute-project"
  org_id     = var.organisation_id
  billing_id = google_project.billing_account.id
  auto_create_network = false
}

resource "google_project" "network_project" {
  name       = "Network Project"
  project_id = "ehr-network-project"
  org_id     = var.organisation_id
  billing_id = google_project.billing_account.id
  auto_create_network = false
}

resource "google_project" "analytics_project" {
  
}

resource "google_project" "database_project" {
  
}
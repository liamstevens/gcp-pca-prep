resource "google_project" "billing_account" {
  name                = "Helicopter Racing League Billing Project"
  project_id          = "helicopter-billing-account-gcp-pca-prep"
  org_id              = var.organisation_id
  auto_create_network = false
}

resource "google_project" "presentation" {
  name                = "Helicopter Racing League Presentation Project"
  project_id          = "heli-racing-presentation-gcp-pca-prep"
  billing_account     = google_project.billing_account.id
  org_id              = var.organisation_id
  auto_create_network = false
}

resource "google_project" "analytics" {
  name                = "Helicopter Racing League Analytics Project"
  project_id          = "heli-racing-analytics-gcp-pca-prep"
  org_id              = var.organisation_id
  auto_create_network = false
}
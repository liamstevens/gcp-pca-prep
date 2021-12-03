resource "google_project" "compute_project" {
  name       = "Compute Project"
  project_id = "ehr-compute-project"
  org_id     = var.organisation_id
  billing_id = var.billing_id
  auto_create_network = false
}
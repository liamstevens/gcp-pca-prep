provider "google" {
  alias = "network"
  project = google_project.network_project.id
  region  = var.cluster_location
}

provider "google" {
  alias = "compute"
  project = google_project.compute_project.id
  region  = var.cluster_location
}
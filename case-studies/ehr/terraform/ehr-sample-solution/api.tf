resource "google_project_service" "gke_compute" {
  project = google_project.compute_project.id
  service = "compute.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_identity" {
  project = google_project.compute_project.id
  service = "iam.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "gke_monitoring" {
  project = google_project.compute_project.gke_identity
  service = "monitoring.googleapis.com"
  imeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}
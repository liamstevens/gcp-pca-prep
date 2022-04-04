#Presentation Project
resource "google_project_service" "presentation_gcs" {
  project = google_project.presentation.id
  service = "storage-component.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "presentation_dns" {
  project = google_project.presentation.id
  service = "dns.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}


#Analytics Project
resource "google_project_service" "analytics_gcs" {
  project = google_project.analytics.id
  service = "storage-component.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_apigee" {
  project = google_project.analytics.id
  service = "apigee.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_cfn" {
  project = google_project.analytics.id
  service = "cloudfunctions.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_ml" {
  project = google_project.analytics.id
  service = "ml.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_auto_ml" {
  project = google_project.analytics.id
  service = "automl.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_project_service" "analytics_language" {
  project = google_project.analytics.id
  service = "language.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}


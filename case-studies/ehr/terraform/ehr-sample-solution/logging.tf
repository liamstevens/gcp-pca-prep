resource "google_logging_project_sink" "gke_syslogs" {
    name = "gke-syslog-sink"

  # Can export to pubsub, cloud storage, or bigquery
  destination = google_logging_project_bucket_config.basic.id
  # Log all WARN or higher severity messages relating to instances
  filter = "resource.type=(\"k8s_container\" OR \"container\" OR \"k8s_cluster\" OR \"gke_cluster\" OR \"gke_nodepool\" OR \"k8s_node\")"

  # Use a unique writer (creates a unique service account used for writing)
  unique_writer_identity = true
}

resource "google_logging_project_bucket_config" "basic" {
    project    = google_project.analytics_project
    location  = "global"
    retention_days = 30
    bucket_id = "gke_logging"
}
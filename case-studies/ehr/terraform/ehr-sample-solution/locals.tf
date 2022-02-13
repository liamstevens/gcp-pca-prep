locals {
    base_gke = ["roles/monitoring.viewer", "roles/monitoring.metricWriter", "roles/logging.logWriter", "roles/stackdriver.resourceMetadata.writer"]
}
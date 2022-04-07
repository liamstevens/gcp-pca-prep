resource "google_container_cluster" "primary" {
     for_each = google_compute_subnetwork.regional_subnet
    name = "${var.env}-${each.name}-cluster"
    location = each.name
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_secondary_range_name  = each.value.seecondary_ip_range.pod_range
    services_secondary_range_name = each.value.seecondary_ip_range.service_range
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  release_channel {
    channel = "STABLE"
  }

}

resource "google_container_node_pool" "regional_pools" {
    for_each = google_compute_subnetwork.regional_subnet
    name = "${each.name}-cluster"
    location = each.name
    node_count = var.base_node_count
    cluster    = google_container_cluster.primary.name

    node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
  management {
    auto_repair  = true
    auto_upgrade = true
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 1
  }

  timeouts {
    create = "40m"
    update = "30m"
  }
  
}


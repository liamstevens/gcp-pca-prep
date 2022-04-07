resource "google_container_cluster" "primary" {
  name     = "mountkirk-${var.env}"
  location = "us-central1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "regional_pools" {
    for_each = google_compute_subnetwork.regional_subnet
    name = "${each.name}-cluster"
    location = each.name
    node_count = var.base_node_count

}
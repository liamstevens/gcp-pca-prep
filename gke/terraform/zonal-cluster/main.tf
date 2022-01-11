resource "google_container_cluster" "zonal_cluster" {
  name     = "example_zonal_cluster"
  location = var.cluster_location
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = "VPC_NATIVE" # This is the recommended configuration by google and simplifies a great many things around networking
  network                  = var.shared_vpc_id

}

resource "google_container_node_pool" "zonal_nodes" {
  name       = "example_zonal_nodes"
  location   = var.cluster_location
  cluster    = google_container_cluster.zonal_cluster.name
  node_count = 1

  node_config {
    preemptible  = true #This is mostly a cost saving setting for the examples, in case you forget to delete this!
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
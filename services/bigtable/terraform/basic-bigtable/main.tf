provider "google" {
  project = var.google_project_id
  region = var.google_region
}

resource "google_bigtable_instance" "production-instance" {
  name = var.bigtable_table_name

  cluster {
    cluster_id   = "tf-instance-cluster"
    num_nodes    = 1
    storage_type = "HDD"
  }

  labels = {
    my-label = "prod-label"
  }
}
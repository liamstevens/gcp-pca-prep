resource "google_storage_bucket" "bucket" {
  name     = "function_bucket-gcp-pca-prep"
  location = var.region
}
resource "google_storage_bucket" "tf_state_buckets" {
  for_each = var.tf_buckets
  
}
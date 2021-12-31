resource "google_storage_bucket" "tf_state_buckets" {
  for_each = var.tf_buckets
  
  name = each.key
  location      = "AU"
  force_destroy = true

  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}
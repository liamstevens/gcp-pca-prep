resource "google_storage_bucket" "tf_state_buckets" {
  for_each = toset(var.tf_buckets)
  
  name = each.key
  location      = "AUSTRALIA-SOUTHEAST1"
  force_destroy = true

  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}
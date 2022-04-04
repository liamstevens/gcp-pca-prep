resource "google_storage_bucket" "bucket" {
  name     = "function_bucket-gcp-pca-prep"
  location = var.region
}

resource "google_storage_bucket" "streaming_content" {
  name     = "helicopter_streaming-gcp-pca-prep"
  location = "US" #Multi-region bucket for improved latency
}
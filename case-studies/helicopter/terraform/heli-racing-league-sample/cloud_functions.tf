resource "google_storage_bucket_object" "archive" {
  name   = "example.zip"
  bucket = google_storage_bucket.bucket.name
  source = zip("./src/example_function.py")
}

resource "google_cloudfunctions_function" "test" {
  name        = "function-test"
  description = "My function"
  runtime     = "python37"

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http          = true
  timeout               = 60
  entry_point           = "hello"
}
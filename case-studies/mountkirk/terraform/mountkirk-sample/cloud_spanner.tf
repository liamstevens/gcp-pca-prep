resource "google_spanner_instance" "spanner_instances" {
  config       = "nam-eur-asia1"
  display_name = "mountkirk-spanner"
  num_nodes    = 3
  labels = {
    "foo" = "bar"
  }
}
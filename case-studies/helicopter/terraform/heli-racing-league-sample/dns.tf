resource "google_dns_managed_zone" "heli_domain" {
  name        = "helicopter-racing-domain"
  dns_name    = "hrl.gcp-pca-prep.info"
  description = "Main domain zone"
}


resource "google_dns_record_set" "a" {
  name         = "backend.${google_dns_managed_zone.prod.dns_name}"
  managed_zone = google_dns_managed_zone.prod.name
  type         = "A"
  ttl          = 300

  rrdatas = []#apigee endpoint
}

resource "google_dns_managed_zone" "heli_domain_api" {
  name        = "helicopter-racing-api"
  dns_name    = "hrl-api.gcp-pca-prep.info"
  description = "Main API domain zone"
}

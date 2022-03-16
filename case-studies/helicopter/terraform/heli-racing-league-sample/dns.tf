resource "google_dns_managed_zone" "heli_domain" {
  name        = "helicopter-racing-domain"
  dns_name    = "hrl.gcp-pca-prep.info"
  description = "Main domain zone"
}


resource "google_dns_record_set" "a" {
  name         = "api.${google_dns_managed_zone.heli_domain_api.dns_name}"
  managed_zone = google_dns_managed_zone.heli_domain_api.name
  type         = "A"
  ttl          = 300

  rrdatas = []#apigee endpoint
}

resource "google_dns_managed_zone" "heli_domain_api" {
  name        = "helicopter-racing-api"
  dns_name    = "hrl-access.gcp-pca-prep.info"
  description = "Main API domain zone"
}

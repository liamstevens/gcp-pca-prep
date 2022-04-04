resource "google_api_gateway_api" "api_gw" {
  provider = google-beta
  api_id   = "api-gw"
}

resource "null_resource" "replace_definition" {
  provisioner "local-exec" {
    command = "sed -i 's/CLOUDFUNCTION_BASE_URL/${google_cloud_function.test.https_trigger_url} open_api_def.yml"
  }
}

resource "google_api_gateway_api_config" "api_gw" {
  provider      = google-beta
  api           = google_api_gateway_api.api_gw.api_id
  api_config_id = "config"

  openapi_documents {
    document {
      path     = "spec.yaml"
      contents = filebase64("open_api_def.yml")
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    null_resource.replace_definition
  ]
}

resource "google_api_gateway_gateway" "api_gw" {
  provider   = google-beta
  api_config = google_api_gateway_api_config.api_gw.id
  gateway_id = "api-gw"
}
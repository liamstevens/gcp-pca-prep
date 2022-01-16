

resource "google_compute_instance" "basic" {
    name = "basic_instance"
    machine_type = "e2-medium"
    zone = var.google_zone

    boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

}
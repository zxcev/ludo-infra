# VPC
resource "google_compute_network" "main" {
  name                    = "main"
  auto_create_subnetworks = false
}

# Subnet
resource "google_compute_subnetwork" "public" {
  network = google_compute_network.main.id

  name          = "public"
  ip_cidr_range = "10.0.0.0/20"
}

resource "google_compute_subnetwork" "private" {
  network = google_compute_network.main.id

  name          = "private"
  ip_cidr_range = ""
}

resource "google_compute_subnetwork" "isolated_private" {
  network = google_compute_network.main.id

  name          = "isolated_private"
  ip_cidr_range = ""
}

# Firewall(SG in AWS)
resource "google_compute_firewall" "ssh" {
  network = google_compute_network.main.id

  name      = "ingress-ssh"
  direction = "INGRESS"

  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = [""]
}

resource "google_compute_firewall" "http" {
  network = google_compute_network.main.id

  name      = "ingress-http"
  direction = "INGRESS"

  allow {
    ports    = ["80"]
    protocol = "tcp"
  }

  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = [""]

}


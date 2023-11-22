resource "google_vertex_ai_endpoint" "endpoint" {
  name         = "cng-llama2"
  display_name = "cng"
  description  = "llama2 vertex endpoint"
  location     = "us-east1"
  region       = "us-east1"
  network      = "projects/${data.google_project.cng.number}/global/networks/${data.google_compute_network.vertex_network.name}"
  encryption_spec {
    kms_key_name = google_kms_crypto_key.cng.id
  }
  depends_on = [
    google_service_networking_connection.vertex_vpc_connection,
    google_kms_crypto_key_iam_member.crypto_key
  ]
}

resource "google_service_networking_connection" "vertex_vpc_connection" {
  network                 = data.google_compute_network.vertex_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.vertex_range.name]
}

resource "google_compute_global_address" "vertex_range" {
  name          = "llama2"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = data.google_compute_network.vertex_network.id
}

data "google_compute_network" "vertex_network" {
  name = "default"
}

resource "google_kms_key_ring" "keyring" {
  name     = "keyring-cng"
  location = "us-east1"
}

resource "google_kms_crypto_key" "cng" {
  name     = "kms-cng"
  key_ring = google_kms_key_ring.keyring.id

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_member" "crypto_key" {
  crypto_key_id = google_kms_crypto_key.cng.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.cng.number}@gcp-sa-aiplatform.iam.gserviceaccount.com"
}

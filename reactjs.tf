resource "google_cloud_run_v2_service" "reactjs" {
  name     = "reactjs-service"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = 1
    }

    containers {
      image = var.reactjs_image
      ports {
        container_port = 3000
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }
}

resource "google_cloud_run_service_iam_binding" "reactjs" {
  location = google_cloud_run_v2_service.reactjs.location
  service  = google_cloud_run_v2_service.reactjs.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}

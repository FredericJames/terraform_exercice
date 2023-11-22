resource "google_cloud_run_v2_service" "fastapi" {
  name     = "fastapi-service"
  location = "us-central1"
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    scaling {
      max_instance_count = 1
    }

    containers {
      name  = "fastapi"
      image = var.fastapi_image
      ports {
        container_port = 8000
      }

      env {
        name  = "INSTANCE_CONNECTION_NAME"
        value = google_sql_database_instance.instance.connection_name
      }
      env {
        name  = "DB_IAM_USER"
        value = google_sql_user.iam_service_account_user.name
      }
      env {
        name  = "DB_NAME"
        value = google_sql_database.database.name
      }
    }

    service_account = google_service_account.fastapi.email
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }

  depends_on = [google_sql_database_instance.instance]
}

resource "google_cloud_run_service_iam_binding" "fastapi" {
  location = google_cloud_run_v2_service.fastapi.location
  service  = google_cloud_run_v2_service.fastapi.name
  role     = "roles/run.invoker"
  members = [
    "allUsers"
  ]
}
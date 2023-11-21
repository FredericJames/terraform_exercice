resource "google_service_account" "fastapi" {
  account_id = "fastapi"
  display_name = "fastapi"
}

resource "google_sql_database_instance" "instance" {
  name             = "cng"
  region           = "us-east1"
  database_version = "POSTGRES_14"
  settings {
    tier = "db-f1-micro"
  }
  deletion_protection  = "false"
}

resource "google_sql_database" "database" {
  name     = "cng"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "iam_user" {
  name     = "james.frederic@gmail.com"
  instance = google_sql_database_instance.instance.name
  type     = "CLOUD_IAM_USER"
}

resource "google_sql_user" "iam_service_account_user" {
  name     = trimsuffix(google_service_account.fastapi.email, ".gserviceaccount.com")
  instance = google_sql_database_instance.instance.name
  type     = "CLOUD_IAM_SERVICE_ACCOUNT"
}
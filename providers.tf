provider "google" {
  project = "third-node-405813"
  region  = "us-east1"
}

terraform {
  backend "gcs" {
    bucket = "fjames-cng-tfstate"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.7.0"
    }
  }
  required_version = ">= 1.6.4"
}
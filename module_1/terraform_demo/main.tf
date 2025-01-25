terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "weighty-pixel-448710-u7"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "data-lake-bucket" {
  name     = "tf-demo-data-bucket"
  location = "us-central1"

  # Optional, but recommended settings:
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30 // days
    }
  }

  force_destroy = true
}


resource "google_bigquery_dataset" "dataset" {
  dataset_id = "bq_data"
}

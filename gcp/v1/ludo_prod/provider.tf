terraform {
  required_version = "~> 1.9"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.3"
    }
  }

}

provider "google" {
  project = local.project
  region  = local.region
}

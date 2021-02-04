terraform {
  backend "remote" {
    organization = "<your terraform cloud organization>"
 
    workspaces {
      name = "<your terraform cloud workspaces>"
    }
  }
}
 
provider "google" {
  project = var.google_project
  region  = var.google_region
}
 
provider "google-beta" {
  project = var.google_project
  region  = var.google_region
}

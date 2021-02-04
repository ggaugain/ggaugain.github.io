# Creating bucket
resource "google_storage_bucket" "bucket" {
  project = var.google_project
 
  name          = "demo-bucket-${var.environment}"
  location      = var.google_location
  force_destroy = true
 
  storage_class = var.bucket_storage_class
 
  labels = {
    env = var.environment
  }
}

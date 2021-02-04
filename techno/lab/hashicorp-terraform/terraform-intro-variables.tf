variable "google_project" {
  type        = string
  description = "Google Project to deploy resources."
}
 
variable "google_region" {
  type        = string
  description = "Google Region to deploy resources."
  default     = "europe-west1"
}
 
variable "google_location" {
  type        = string
  description = "Google Location to deploy resources."
  default     = "EU"
}
 
variable "environment" {
  type        = string
  description = "Environnement to deploy resources."
}
 
variable "bucket_storage_class" {
  type        = string
  description = "Storage class."
  default     = "COLDLINE"
}

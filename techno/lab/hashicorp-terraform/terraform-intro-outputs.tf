output "bucket_name" {
  description = "Bucket name."
  value       = google_storage_bucket.bucket.name
}
 
output "bucket_base_url" {
  description = "Bucket base URL."
  value       = google_storage_bucket.bucket.url
}

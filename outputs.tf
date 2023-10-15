output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.home_nomadiachi_hosting.bucket_name
}

output "s3_website_endpoint" {
  description = "website endpoint for the statically hosted website"
  value       = module.home_nomadiachi_hosting.website_endpoint
}

output "cloudfront_url" {
  value = module.home_nomadiachi_hosting.domain_name
}

output "cloudfront_distribution_id" {
  value = module.home_nomadiachi_hosting.cloudfront_distribution_id
}

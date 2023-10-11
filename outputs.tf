output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value       = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "website endpoint for the statically hosted website"
  value       = module.terrahouse_aws.website_endpoint
}

# output "cloudfront_distribution_id" {
#   value = module.terrahouse_aws.s3_distribution
# }

locals {
  root_path = path.root
}

output "root_path" {
  value = local.root_path
}
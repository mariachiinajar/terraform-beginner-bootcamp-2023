output "bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket
}

output "website_endpoint" {
  description = "website endpoint for the statically hosted website"
  value       = aws_s3_bucket_website_configuration.website_configuration.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
  description = "The CloudFront distribution domain name"
 }

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}
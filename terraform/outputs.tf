output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.this.domain_name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket hosting the static site"
  value       = aws_s3_bucket.this.id
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket hosting the static site"
  value       = aws_s3_bucket.this.arn
}

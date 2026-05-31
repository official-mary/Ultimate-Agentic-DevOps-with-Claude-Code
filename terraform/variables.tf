variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Name of the project, used for resource naming and tagging"
  type        = string
  default     = "portfolio-site"
}

variable "environment" {
  description = "Deployment environment (e.g. production, staging)"
  type        = string
  default     = "production"
}

variable "bucket_name" {
  description = "S3 bucket name for the static site"
  type        = string
  default     = "portfolio-site-ogbonna-nwannekamary-production"
}

variable "domain_name" {
  description = "Custom domain name for the CloudFront distribution (leave empty to skip)"
  type        = string
  default     = ""
}

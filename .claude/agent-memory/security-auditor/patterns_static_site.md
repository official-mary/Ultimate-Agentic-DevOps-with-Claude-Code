---
name: security patterns for static S3+CloudFront sites
description: Recurring security gaps found in static website deployments using S3 and CloudFront — use as a checklist for future reviews
type: reference
---

## Pattern: tfstate files committed to git
Very common in educational/tutorial repos. tfstate exposes AWS account IDs, resource IDs, ARNs, and domain names. Always check git history. Remediation: add terraform.tfstate and *.tfstate.backup to .gitignore; use S3 remote backend with encrypt=true.

## Pattern: Missing CloudFront response headers policy
No security headers (CSP, X-Frame-Options, HSTS, etc.) are applied by default. Must create aws_cloudfront_response_headers_policy and attach via response_headers_policy_id on the cache behavior.

## Pattern: cloudfront_default_certificate keeps TLSv1 minimum
When cloudfront_default_certificate = true, Terraform accepts any minimum_protocol_version, but the default applied by AWS is TLSv1 — weak. Custom ACM cert + TLSv1.2_2021 is required for production.

## Pattern: S3 SSE declared only in AWS defaults, not in Terraform
AWS now enables AES256 by default on new buckets, but the configuration is not in Terraform code, so it is not version-controlled or enforced. Always add aws_s3_bucket_server_side_encryption_configuration.

## Pattern: CloudFront access logging absent
logging_config block omitted. Standard requirement for compliance and incident response. Needs a separate S3 bucket with ACL enabled for delivery.

## Pattern: Remote state backend commented out / local state in repo
Commonly seen in bootstrap instructions where state migration is a manual follow-up step. The state file ends up committed and contains sensitive values.

## Pattern: WAF not attached to CloudFront
web_acl_id left empty. For public-facing distributions, a WAF with managed rule groups (AWSManagedRulesCommonRuleSet) provides DDoS and injection protection at low cost.

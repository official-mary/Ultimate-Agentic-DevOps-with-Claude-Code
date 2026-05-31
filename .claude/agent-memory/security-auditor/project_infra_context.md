---
name: portfolio-site infrastructure context
description: Architecture and security posture of the static portfolio site Terraform deployment (S3 + CloudFront)
type: project
---

## Stack
- AWS S3 (eu-north-1) + CloudFront (PriceClass_200) for a static HTML/CSS portfolio site
- Owner: Ogbonna Nwanneka Mary (DMI Cohort 2)
- Terraform files: terraform/main.tf, variables.tf, outputs.tf, providers.tf, backend.tf

## What is deployed correctly
- S3 public access block: all four flags set to true
- BucketOwnerEnforced ownership controls
- CloudFront OAC (not legacy OAI) with sigv4 / always signing
- Bucket policy scoped to specific CloudFront distribution ARN via AWS:SourceArn condition
- viewer_protocol_policy = "redirect-to-https"
- IAM bucket policy uses minimal s3:GetObject only
- S3 SSE-AES256 now declared in Terraform via aws_s3_bucket_server_side_encryption_configuration with bucket_key_enabled = true (added 2026-03-13)

## SSE state discrepancy (audit 2026-03-13)
- main.tf now has aws_s3_bucket_server_side_encryption_configuration with sse_algorithm = "AES256" and bucket_key_enabled = true
- terraform.tfstate (serial 11) shows the resource is NOT yet present — the SSE config resource has been added to code but terraform apply has not been run
- tfstate shows bucket_key_enabled = false in the aws_s3_bucket resource's server_side_encryption_configuration, meaning the live bucket still has AWS-default AES256 (no bucket key)
- Next terraform apply will deploy the resource and enable bucket_key_enabled = true

## Known security findings (audit 2026-03-13)
1. CRITICAL  — terraform.tfstate and terraform.tfstate.backup committed to git; exposes AWS account ID (667659727321), CloudFront distribution ID (E37ZRCQTBQZFX5), S3 ARN, domain names, bucket canonical ID
2. HIGH      — No CloudFront response headers policy; missing Content-Security-Policy, X-Frame-Options, X-Content-Type-Options, Strict-Transport-Security, Referrer-Policy, Permissions-Policy
3. HIGH      — viewer_certificate uses cloudfront_default_certificate = true with minimum_protocol_version = "TLSv1" (confirmed in tfstate); custom ACM cert + TLSv1.2_2021 required
4. HIGH      — No CloudFront access logging configured (logging_config = [] confirmed in tfstate)
5. HIGH (partial) — SSE resource added to main.tf but NOT yet applied; live bucket still running AWS-default AES256 without bucket key; terraform apply needed
6. MEDIUM    — S3 access logging not configured (no aws_s3_bucket_logging resource)
7. MEDIUM    — S3 versioning disabled (versioning.enabled = false confirmed in tfstate)
8. MEDIUM    — Remote state backend is commented out; state stored locally and committed to repo
9. MEDIUM    — IPv6 disabled on CloudFront (is_ipv6_enabled = false confirmed in tfstate)
10. MEDIUM   — No WAF (web_acl_id = "" confirmed in tfstate)
11. LOW      — No S3 lifecycle policy (lifecycle_rule = [] confirmed in tfstate)
12. LOW      — No CloudFront HTTP/3 (http_version = "http2" confirmed in tfstate)

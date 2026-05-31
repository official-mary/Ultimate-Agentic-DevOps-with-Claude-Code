---
name: Portfolio Site AWS Architecture
description: Static HTML portfolio website deployed to S3 + CloudFront in eu-north-1 with OAC
type: project
---

## Infrastructure Components

**Active Resources:**
- AWS S3 bucket: `portfolio-site-ogbonna-nwannekamary-production` (eu-north-1)
- CloudFront distribution: `E37ZRCQTBQZFX5` (PriceClass_200)
- CloudFront Origin Access Control (OAC)

**Project Details:**
- Static HTML/CSS only (no JavaScript, no build system)
- Student portfolio project deployed by Ogbonna Nwanneka Mary
- All files deployed to S3, served globally via CloudFront
- Currently uses CloudFront default certificate (no custom domain)

**Current Configuration:**
- Cache policy: CachingOptimized (658327ea-f89d-4fab-a63d-7e88639e58f6)
- HTTP version: HTTP/2
- Compression: Enabled
- Custom error handling: 404 → /index.html (10s min TTL)
- Region: eu-north-1 (lower-cost region)
- S3 Versioning: Disabled
- S3 Encryption: AES256 (default)

**Terraform State:**
- Currently stored locally (backend.tf is commented out)
- No remote state configured yet

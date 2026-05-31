---
name: Portfolio Site Infrastructure Architecture
description: Static HTML/CSS portfolio site deployed to AWS S3 + CloudFront
type: project
---

## Infrastructure Overview

This is a static website deployment (no backend, no database, no compute).

### Components
- **S3 Bucket**: Stores static HTML, CSS, and image assets
- **CloudFront Distribution**: Global CDN for serving content with OAC (Origin Access Control)
- **Region**: eu-north-1 (Northern Europe)

### Key Configuration
- No custom domain configured (using CloudFront default domain)
- No SSL/TLS certificate configuration
- Public access blocked on S3 (all access via CloudFront)
- 404 error handling configured to serve index.html (SPA-style)
- CachingOptimized policy from AWS managed cache policies

### AWS Resources Currently Deployed
1. S3 Bucket (portfolio-site-ogbonna-nwannekamary-production)
2. CloudFront Distribution (PriceClass_200)
3. Origin Access Control (OAC)
4. S3 Bucket Policy
5. Ownership Controls
6. Public Access Block


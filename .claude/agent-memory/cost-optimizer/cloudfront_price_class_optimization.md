---
name: CloudFront Price Class Analysis
description: Opportunity to reduce CloudFront costs by changing from PriceClass_200 to PriceClass_100
type: reference
---

## Current Configuration
- **Price Class**: PriceClass_200
- **Coverage**: Costs optimized for most regions except Australia, India, and South America

## Cost Analysis

### AWS Pricing (as of 2026):
- **PriceClass_100**: ~$0.085/GB (95 edge locations) — cheapest option
- **PriceClass_200**: ~$0.09/GB (130 edge locations)
- **PriceClass_All**: ~$0.10/GB (500+ edge locations) — most expensive

### Savings Calculation
For a typical static site with 10GB/month outbound traffic:
- PriceClass_200: 10GB × $0.09 = $0.90/month = $10.80/year
- PriceClass_100: 10GB × $0.085 = $0.85/month = $10.20/year
- **Annual savings: ~$0.60** (5.5% reduction)

For 50GB/month:
- PriceClass_200: $4.50/month = $54/year
- PriceClass_100: $4.25/month = $51/year
- **Annual savings: ~$3.00** (5.5% reduction)

## Recommendation Status
✅ **RECOMMENDED** — Change to PriceClass_100

## Rationale
- Portfolio site has global traffic (no geographic exclusions configured)
- Static HTML/CSS/images only — lightweight, low bandwidth typical
- PriceClass_100 covers 95 edge locations (comprehensive for global audience)
- Australia, India, South America coverage unlikely needed for a student portfolio
- Negligible latency impact for most users (PriceClass_100 still has excellent global coverage)

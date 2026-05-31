---
name: S3 Storage & Lifecycle Optimization
description: Analysis of S3 bucket storage options and lifecycle policies for cost reduction
type: reference
---

## Current Configuration
- **Storage Class**: Standard (default)
- **Lifecycle Rules**: None configured
- **Versioning**: Disabled
- **Size Estimate**: ~2-5MB (typical portfolio site)

## Cost Analysis

### Storage Costs (per GB/month)
- **Standard**: $0.023/GB (current)
- **Intelligent-Tiering**: $0.0125/GB (automatic optimization)
- **One Zone-IA**: $0.01/GB (1 AZ only, higher retrieval cost)
- **Glacier**: $0.004/GB (long-term archive, retrieval delays)

### Savings Calculation (5GB typical portfolio)
- **Standard**: 5GB × $0.023 = $0.115/month = $1.38/year
- **Intelligent-Tiering**: 5GB × $0.0125 = $0.0625/month = $0.75/year
- **Annual savings: $0.63** (45% reduction in storage costs)

Note: Intelligent-Tiering includes monitoring cost (~$0.0025/1000 objects/month) = negligible

## Additional Opportunities

### Lifecycle Rules (Not Currently Configured)
- **Old object cleanup**: Delete objects >1 year old if archiving (saves full storage cost)
- **Cloudfront logs archival**: If logging enabled, move logs to Glacier after 30 days
- **Incomplete multipart uploads**: Abort after 7 days (prevents orphaned uploads)

## Recommendation Status
⚠️ **LOW PRIORITY** — Not high-impact for small portfolio

## Rationale
- Portfolio is 2-5MB — annual storage cost is <$2 regardless
- Standard storage already optimal for frequently-accessed static content
- Intelligent-Tiering only beneficial for TB-scale variable-access patterns
- Recommendation: Keep Standard for now, review if traffic patterns change

## Note
No lifecycle rules needed unless archiving historical versions or logs in future.

---
name: Portfolio Site Cost Optimization Recommendations
description: Identified cost optimization opportunities for static portfolio site
type: project
---

## Cost Optimization Findings

Analysis Date: 2026-03-12

### HIGH IMPACT OPPORTUNITY
**CloudFront Price Class**
- Current: PriceClass_200 (includes ~99 edge locations)
- Issue: For a portfolio site with global but unpredictable traffic, this is over-provisioned
- Recommendation: PriceClass_100 (reduces to ~50 edge locations, ~30% cheaper)
- Estimated Savings: 30-40% reduction in CloudFront data transfer fees
- Justification: Portfolio site doesn't have global enterprise traffic patterns

### MEDIUM IMPACT OPPORTUNITIES

**1. S3 Storage Optimization**
- Current: No lifecycle policies, Standard storage class
- Issue: Static assets (HTML, CSS, images) rarely change, no need for version control
- Recommendations:
  - Enable Intelligent-Tiering (if storage exceeds 128KB per object)
  - Add lifecycle rule to delete old versions if versioning is enabled
  - Use S3 lifecycle to transition to Glacier for old versions/logs
- Estimated Savings: 10-20% on storage costs (small baseline)

**2. Cache TTL Configuration**
- Current: Using AWS managed "CachingOptimized" policy
- Issue: Policy applies default TTLs which may be overly aggressive for static content
- Recommendation: Increase TTL values further for HTML/CSS (currently likely 86400s)
- Impact: Fewer origin requests = lower data transfer and request costs
- Estimated Savings: 5-10% reduction in request and transfer costs

**3. S3 Bucket Configuration Review**
- Current: Single bucket in eu-north-1
- Issue: No versioning enabled (good for cost), but terraform state not using S3 backend yet
- Recommendation: When enabling state backend, use lifecycle rules on state bucket
- Impact: Low cost, but prevents accidental state file accumulation

### LOW IMPACT OPPORTUNITIES

**1. Logging**
- Current: No access logs configured
- Impact: Good for cost (disabled), minimal security concern for public CDN
- Keep as-is: Only enable if compliance/audit required

**2. Origin Access Control (OAC)**
- Current: Properly configured to restrict direct S3 access
- Assessment: No cost impact, correct security posture

**3. Error Handling**
- Current: 404 errors redirect to index.html with 10s TTL
- Assessment: This is correct for SPA-style routing, but cost is minimal
- Keep as-is

### Estimated Total Monthly Savings Potential
- CloudFront downgrade (PriceClass_200 → PriceClass_100): ~$15-25/month
- S3 optimization + lifecycle: ~$2-5/month
- Cache TTL optimization: ~$5-10/month
- **Total: ~$22-40/month reduction** (varies by traffic patterns)

### Not Cost Issues (Correctly Configured)
- OAC usage (proper security, minimal cost)
- HTTPS redirection (correct, no performance penalty)
- 404 SPA routing (intended design, minimal TTL cost)
- Regional selection eu-north-1 (appropriate for EU traffic)


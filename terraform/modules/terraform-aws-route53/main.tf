resource "aws_route53_record" "api" {
  zone_id = var.zone_id
  name    = var.record
  type    = "A"

  alias {
    # name       = aws_cloudfront_distribution.webapp.domain_name
    # zone_id    = aws_cloudfront_distribution.webapp.hosted_zone_id
    evaluate_target_health = true
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
  }
}
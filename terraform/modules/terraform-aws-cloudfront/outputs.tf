output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.dist.id
}

output "cloudfront_distribution_domain" {
  value = aws_cloudfront_distribution.dist.domain_name
}

output "cloudfront_distribution_hosted_zone_id" {
  value = aws_cloudfront_distribution.dist.hosted_zone_id
}


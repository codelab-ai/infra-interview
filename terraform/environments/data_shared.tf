data "aws_acm_certificate" "default" {
  domain   = "api.${local.domain}"
  statuses = ["ISSUED", "PENDING_VALIDATION"]
  # we're using us-west-1 as main region but ACM only available in us-east-1, so there is an alias in provider.tf
  provider = aws.us_east_1
}

data "aws_route53_zone" "main" {
  name = local.domain
}

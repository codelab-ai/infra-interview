module "dns_record" {
  source                    = "../../modules/terraform-aws-route53"
  zone_id                   = data.aws_route53_zone.main.zone_id
  record                    = "${local.prod_prefix}.api.${local.domain}"
  cloudfront_domain_name    = module.cloudfront.cloudfront_distribution_domain
  cloudfront_hosted_zone_id = module.cloudfront.cloudfront_distribution_hosted_zone_id

  depends_on = [
    module.cloudfront
  ]
}
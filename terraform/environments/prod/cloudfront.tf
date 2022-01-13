module "cloudfront" {
  source = "../../modules/terraform-aws-cloudfront"

  domain = module.alb.alb_dns_name
  aliases = [
    "${local.prod_prefix}.api.${local.domain}"
  ]
  origin_id           = local.prod_prefix
  acm_certificate_arn = data.aws_acm_certificate.default.arn

  depends_on = [
    module.alb
  ]
}
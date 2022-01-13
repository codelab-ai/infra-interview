module "ecs_app" {
  source               = "../../modules/terraform-aws-ecs"
  aws_region           = local.aws_region
  account_id           = local.account_id
  vpc_id               = module.vpc.vpc_id
  app_image            = "810113963961.dkr.ecr.us-west-1.amazonaws.com/clab-api"
  app_image_tag        = var.app_image_tag
  app_port             = 8080
  app_name             = local.staging_prefix
  cluster_name         = local.staging_prefix
  app_domain           = "${local.staging_prefix}.api.${local.domain}"
  public_origin        = "https://codelab.ai"
  api_endpoint         = "https://${local.staging_prefix}.api.${local.domain}" # domain will be aliased from cloudfront
  api_graphql_endpoint = "https://${local.staging_prefix}.api.${local.domain}/graphql"
  sg_allowed_ports     = ["8080"]
  subnets = [
    module.vpc.private_subnet_ids["private_main"],
    module.vpc.private_subnet_ids["private_standby"]
  ]
  lb_target_group_arn     = module.alb.target_group_arn
  sg_alb                  = [module.alb.alb_sg_id]
  dgraph_graphql_endpoint = "http://${module.alb.alb_dns_name}:8080/graphql" # we can't use the main domain for this because it goes through cloudfront, and cloudfront doesn't support custom port
  dgraph_endpoint         = "http://${module.alb.alb_dns_name}:8080"
  lb_dns                  = module.alb.alb_dns_name
  # secrets
  dgraph_apikey           = local.dgraph_apikey
  aws_access_key          = module.app_user.access_key_id
  aws_secret_key          = module.app_user.access_key_secret
  aws_bucket              = module.s3_app_bucket.bucket_id
  auth0_secret            = local.auth0_secret
  auth0_baseurl           = "https://${local.staging_prefix}.${local.domain}"
  auth0_issuer_baseurl    = "https://codelab-ai-staging.us.auth0.com/" # got from auth0 console
  auth0_client_id         = module.auth0_staging_web.client_id
  auth0_client_secret     = module.auth0_staging_web.client_secret
  auth0_audience          = "https://codelab-ai-staging.us.auth0.com/api/v2/" # got from auth0 console
  auth0_api_client_id     = module.auth0_staging_api.client_id
  auth0_api_client_secret = module.auth0_staging_api.client_secret
  nx_cloud_auth_token     = local.nx_cloud_auth_token

  wait_for_steady_state = true

  depends_on = [
    module.vpc,
    module.alb
  ]

}

module "app_user" {
  source     = "../../modules/terraform-aws-iam-user"
  user_name  = local.staging_prefix
  create_key = true
  iam_policy_arn_list = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
  ]

  tags = { "env" : "staging" }
}



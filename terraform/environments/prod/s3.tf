module "s3_app_bucket" {
  source      = "../../modules/terraform-aws-s3"
  enabled     = true
  bucket_name = "codelab-${local.prod_prefix}-app-bucket"
  acl         = "private"

  enable_bucket_versioning = true
  block_public_access      = true

  tags = { "env" : "prod" }
}
module "vpc" {
  source      = "../../modules/terraform-aws-vpc"
  vpc_name    = local.staging_vpc_name
  azs         = local.azs
  public_azs  = local.public_azs
  private_azs = local.private_azs
  vpc_cidr    = local.staging_vpc_cidr

  public_subnets  = local.staging_public_subnets
  private_subnets = local.staging_private_subnets
  igw_name        = "${local.staging_prefix}-gw"
  natgw_name      = "${local.staging_prefix}-nat"
  tags            = { "Env" : "Staging" }
}


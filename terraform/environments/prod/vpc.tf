module "vpc" {
  source      = "../../modules/terraform-aws-vpc"
  vpc_name    = local.prod_vpc_name
  azs         = local.azs
  public_azs  = local.public_azs
  private_azs = local.private_azs
  vpc_cidr    = local.prod_vpc_cidr

  public_subnets  = local.prod_public_subnets
  private_subnets = local.prod_private_subnets
  igw_name        = "${local.prod_prefix}-gw"
  natgw_name      = "${local.prod_prefix}-nat"
  tags            = { "Env" : "Prod" }
}


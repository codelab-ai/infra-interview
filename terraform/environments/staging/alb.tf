module "alb" {
  source   = "../../modules/terraform-aws-alb"
  alb_name = "${local.staging_prefix}-lb"
  vpc_id   = module.vpc.vpc_id
  subnet_ids = [
    module.vpc.public_subnet_ids["public_main"],
    module.vpc.public_subnet_ids["public_standby"]
  ]
  tg_name           = "${local.staging_prefix}-tg"
  tg_port           = "80"
  alb_allowed_ports = local.dgraph_ports

}

module "dgraph_service" {
  source         = "../../modules/dgraph"
  dgraph_name    = "${local.staging_prefix}-dgraph"
  app_domain     = local.domain
  vpc_id         = module.vpc.vpc_id
  ecs_cluster_id = module.ecs_app.ecs_cluster_id
  lb             = module.alb.alb_arn
  lb_sg          = module.alb.alb_sg_id
  subnets = [
    module.vpc.private_subnet_ids["private_main"],
    module.vpc.private_subnet_ids["private_standby"]
  ]
  dgraph_image            = "dgraph/dgraph:v21.03.1"
  dgraph_count            = 1
  dgraph_port             = 8080
  aws_region              = local.aws_region
  ecs_task_execution_role = module.ecs_app.ecs_task_execution_role_arn
}

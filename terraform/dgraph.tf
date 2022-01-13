locals {
  dgraph_suffixes = ["staging"]
}

module "dgraph_service" {
  source = "./modules/dgraph"
  count  = length(var.dgraph_ports)

  dgraph_name             = "${var.app_name}-dgraph-${local.dgraph_suffixes[count.index]}"
  app_domain              = var.app_domain
  vpc_id                  = aws_vpc.main.id
  ecs_cluster_id          = aws_ecs_cluster.main.id
  lb                      = aws_alb.main.arn
  lb_sg                   = aws_security_group.lb.id
  subnets                 = aws_subnet.private.*.id
  dgraph_image            = var.dgraph_image
  dgraph_count            = 1
  dgraph_port             = var.dgraph_ports[count.index]
  aws_region              = var.aws_region
  ecs_task_execution_role = aws_iam_role.ecs_task_execution_role.arn
}

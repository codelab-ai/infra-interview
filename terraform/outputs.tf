# outputs.tf

output "alb_hostname" {
  value = aws_alb.main.dns_name
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "ecs_app_service_name" {
  value = aws_ecs_service.main.name
}

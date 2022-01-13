output "target_group_arn" {
  value = aws_alb_target_group.main.arn
}

output "alb_arn" {
  value = aws_alb.alb.arn
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

output "alb_sg_id" {
  value = aws_security_group.lb.id
}

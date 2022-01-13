resource "aws_alb" "alb" {
  name            = var.alb_name
  subnets         = var.subnet_ids
  security_groups = [aws_security_group.lb.id]
}

resource "aws_alb_target_group" "main" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = var.healthy_threshold
    interval            = var.interval
    protocol            = var.protocol
    matcher             = var.matcher
    timeout             = var.timeout
    path                = var.health_check_path
    unhealthy_threshold = var.unhealthy_threshold
  }
}

resource "aws_alb_listener" "http_listener" {
  load_balancer_arn = aws_alb.alb.id
  port              = var.listener_port
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.main]

  default_action {
    target_group_arn = aws_alb_target_group.main.id
    type             = "forward"
  }
}

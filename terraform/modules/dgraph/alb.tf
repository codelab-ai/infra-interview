resource "aws_alb_target_group" "dgraph" {
  name        = "${var.dgraph_name}-tg"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }
}

resource "aws_alb_listener" "dgraph_listener" {
  load_balancer_arn = var.lb
  port              = var.dgraph_port
  protocol          = "HTTP"
  depends_on        = [aws_alb_target_group.dgraph]

  default_action {
    target_group_arn = aws_alb_target_group.dgraph.id
    type             = "forward"
  }

}
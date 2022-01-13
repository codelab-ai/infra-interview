resource "aws_cloudwatch_log_group" "dgraph_zero_log_group" {
  name              = "/ecs/${var.dgraph_name}-zero"
  retention_in_days = 30

  tags = {
    Name = "${var.dgraph_name}-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "dgraph_zero_log_stream" {
  name           = "${var.dgraph_name}-zero-log-stream"
  log_group_name = aws_cloudwatch_log_group.dgraph_zero_log_group.name
}


resource "aws_cloudwatch_log_group" "dgraph_alpha_log_group" {
  name              = "/ecs/${var.dgraph_name}-alpha"
  retention_in_days = 30

  tags = {
    Name = "${var.dgraph_name}-log-group"
  }
}

resource "aws_cloudwatch_log_stream" "dgraph_alpha_log_stream" {
  name           = "${var.dgraph_name}-alpha-log-stream"
  log_group_name = aws_cloudwatch_log_group.dgraph_alpha_log_group.name
}

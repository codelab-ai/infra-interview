# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }
}

## MAIN
data "template_file" "cb_app" {
  template = file("${path.module}/templates/cb_app.json")

  vars = {
    app_name                = var.app_name
    app_image               = var.app_image
    app_image_tag           = var.app_image_tag
    app_port                = var.app_port
    fargate_cpu             = var.fargate_cpu
    fargate_memory          = var.fargate_memory
    aws_region              = var.aws_region
    public_origin           = "https://${var.app_domain}"
    api_endpoint            = "https://${var.lb_dns}"
    api_graphql_endpoint    = "${var.api_graphql_endpoint}"
    dgraph_endpoint         = aws_ssm_parameter.dgraph_endpoint.arn,
    dgraph_apikey           = aws_ssm_parameter.dgraph_apikey.arn,
    aws_access_key          = aws_ssm_parameter.aws_access_key.arn,
    aws_secret_key          = aws_ssm_parameter.aws_secret_key.arn,
    aws_bucket              = aws_ssm_parameter.aws_bucket.arn,
    auth0_secret            = aws_ssm_parameter.auth0_secret.arn,
    auth0_baseurl           = aws_ssm_parameter.auth0_baseurl.arn,
    auth0_issuer_baseurl    = aws_ssm_parameter.auth0_issuer_baseurl.arn,
    auth0_client_id         = aws_ssm_parameter.auth0_client_id.arn,
    auth0_client_secret     = aws_ssm_parameter.auth0_client_secret.arn,
    auth0_audience          = aws_ssm_parameter.auth0_audience.arn,
    auth0_api_client_id     = aws_ssm_parameter.auth0_api_client_id.arn,
    auth0_api_client_secret = aws_ssm_parameter.auth0_api_client_secret.arn,
    nx_cloud_auth_token     = aws_ssm_parameter.nx_cloud_auth_token.arn,
    aws_logs_group          = aws_cloudwatch_log_group.cb_log_group.name
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.app_name}-app-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  container_definitions    = data.template_file.cb_app.rendered
}

resource "aws_ecs_service" "main" {
  name                  = "${var.app_name}-service"
  cluster               = aws_ecs_cluster.main.id
  task_definition       = aws_ecs_task_definition.app.arn
  desired_count         = var.app_count
  launch_type           = "FARGATE"
  wait_for_steady_state = var.wait_for_steady_state

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    security_groups  = [aws_security_group.sg.id]
    subnets          = var.subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.lb_target_group_arn
    container_name   = var.app_name
    container_port   = var.app_port
  }

}
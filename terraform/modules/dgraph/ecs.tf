resource "aws_efs_file_system" "efs" {
  creation_token = "${var.dgraph_name}-fs"
  encrypted      = true
}

resource "aws_efs_mount_target" "efs" {
  file_system_id  = aws_efs_file_system.efs.id
  count           = var.dgraph_count
  subnet_id       = element(var.subnets, count.index)
  security_groups = [aws_security_group.efs_sg.id]
}

data "template_file" "cb_dgraph" {
  template = file("${path.module}/templates/cb_dgraph.json")

  vars = {
    dgraph_name          = var.dgraph_name,
    app_image            = var.dgraph_image,
    app_port             = 8080
    fargate_cpu          = 256
    fargate_memory       = 512
    port_offset          = var.dgraph_port - 8080
    aws_region           = var.aws_region
    container_mount_path = "/dgraph"
    source_volume        = "efs-volume"
  }
}

resource "aws_ecs_task_definition" "dgraph" {
  family                   = "${var.dgraph_name}-task"
  execution_role_arn       = var.ecs_task_execution_role
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 1024
  container_definitions    = data.template_file.cb_dgraph.rendered
  task_role_arn            = var.ecs_task_execution_role

  volume {
    name = "efs-volume"

    efs_volume_configuration {
      file_system_id = aws_efs_file_system.efs.id
      root_directory = "/"
    }
  }
}

resource "aws_ecs_service" "dgraph" {
  name                   = "${var.dgraph_name}-service"
  cluster                = var.ecs_cluster_id
  task_definition        = aws_ecs_task_definition.dgraph.arn
  desired_count          = var.dgraph_count
  launch_type            = "FARGATE"
  enable_execute_command = true

  network_configuration {
    security_groups  = [aws_security_group.dgraph_tasks.id]
    subnets          = var.subnets
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.dgraph.id
    container_name   = "alpha"
    container_port   = 8080
  }

  depends_on = [aws_alb_listener.dgraph_listener]
}

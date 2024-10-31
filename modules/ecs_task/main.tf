resource "aws_ecs_task_definition" "ecs_task_definition" {
  family             = "${var.env}-flaskapp-task"
  network_mode       = "awsvpc"
  execution_role_arn = var.execution_role_arn
  cpu                = 256

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "flaskapp"
      image     = var.container_image
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

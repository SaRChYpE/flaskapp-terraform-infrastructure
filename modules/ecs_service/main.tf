resource "aws_ecs_service" "ecs_service" {
  name            = "${var.env}-ecs-service"
  cluster         = var.ecs_cluster_id
  task_definition = var.ecs_task_definition_arn
  desired_count   = 1

  network_configuration {
    subnets         = var.subnets
    security_groups = [var.sg_id]
  }

  force_new_deployment = true

  placement_constraints {
    type = "distinctInstance"
  }

  triggers = {
    redeployment = timestamp()
  }

  capacity_provider_strategy {
    capacity_provider = var.ecs_capacity_provider_name
    weight            = 100
  }

  load_balancer {
    target_group_arn = var.ecs_tg_arn
    container_name   = "flaskapp"
    container_port   = 5000
  }

  depends_on = [var.ecs_asg]
}

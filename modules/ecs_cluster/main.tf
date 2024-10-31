resource "aws_ecs_cluster" "ecs_cluster" {
 name = "${var.env}-ecs-cluster"
}

resource "aws_ecs_capacity_provider" "ecs_capacity_provider" {

 name = "${var.env}-ecs_provider"

 auto_scaling_group_provider {
   auto_scaling_group_arn = var.ecs_asg_arn
   managed_scaling {
     maximum_scaling_step_size = 2
     minimum_scaling_step_size = 1
     status                    = "ENABLED"
     target_capacity           = 3
   }
 }
}

resource "aws_ecs_cluster_capacity_providers" "ecs_cluster_capacity_providers" {

 cluster_name = aws_ecs_cluster.ecs_cluster.name
 capacity_providers = [aws_ecs_capacity_provider.ecs_capacity_provider.name]

 default_capacity_provider_strategy {
   base              = 1
   weight            = 100
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
 }
}
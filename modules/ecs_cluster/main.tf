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

resource "aws_ecs_cluster_capacity_providers" "example" {

 cluster_name = aws_ecs_cluster.ecs_cluster.name
 capacity_providers = [aws_ecs_capacity_provider.ecs_capacity_provider.name]

 default_capacity_provider_strategy {
   base              = 1
   weight            = 100
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
 }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {

 family             = "${var.env}-flaskapp-task"
 network_mode       = "awsvpc"
 execution_role_arn = "arn:aws:iam::376648005210:role/ecsTaskExecutionRole"
 cpu                = 256

 runtime_platform {
   operating_system_family = "LINUX"
   cpu_architecture        = "X86_64"
 }

 container_definitions = jsonencode([
   {
     name      = "flaskapp"
     image     = "376648005210.dkr.ecr.eu-central-1.amazonaws.com/flaskapp:1.0.0"
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

resource "aws_ecs_service" "ecs_service" {

 name            = "${var.env}-ecs-service"
 cluster         = aws_ecs_cluster.ecs_cluster.id
 task_definition = aws_ecs_task_definition.ecs_task_definition.arn
 desired_count   = 1



 network_configuration {
   subnets         = [var.subnet_id, var.subnet2_id]
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
   capacity_provider = aws_ecs_capacity_provider.ecs_capacity_provider.name
   weight            = 100
 }

 load_balancer {
   target_group_arn = var.ecs_tg_arn
   container_name   = "flaskapp"
   container_port   = 5000
 }
 depends_on = [var.ecs_asg]
}
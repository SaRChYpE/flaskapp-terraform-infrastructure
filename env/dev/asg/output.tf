output "ecs_asg_arn" {
    description = "ECS ASG ARN"
    value = module.asg.ecs_asg_arn
}

output "ecs_asg" {
    description = "ECS ASG"
    value = module.asg.ecs_asg
}
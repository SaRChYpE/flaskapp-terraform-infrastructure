output "ecs_asg_arn" {
    description = "ECS ASG ARN"
    value = aws_autoscaling_group.ecs_asg.arn
}
output "ecs_tg_arn" {
    description =  "target_group_arn"
    value = aws_lb_target_group.ecs_tg.arn
}
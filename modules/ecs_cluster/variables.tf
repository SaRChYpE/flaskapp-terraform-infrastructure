variable "env" {
  description = "Environment name"
  type        = string
}

variable "ecs_asg_arn" {
  description = "ARN of the ECS Auto Scaling Group"
  type        = string
}
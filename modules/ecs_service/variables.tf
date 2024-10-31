variable "env" {
  description = "Environment name"
  type        = string
}

variable "ecs_cluster_id" {
  description = "ID of the ECS Cluster"
  type        = string
}

variable "ecs_task_definition_arn" {
  description = "ARN of the ECS Task Definition"
  type        = string
}

variable "ecs_capacity_provider_name" {
  description = "Name of the ECS Capacity Provider"
  type        = string
}

variable "subnets" {
  description = "Subnets for the ECS service"
  type        = list(string)
}

variable "sg_id" {
  description = "Security group ID"
  type        = string
}

variable "ecs_tg_arn" {
  description = "ARN of the ECS Target Group"
  type        = string
}

variable "ecs_asg" {
  description = "Reference to ECS Auto Scaling Group"
  type        = any
}

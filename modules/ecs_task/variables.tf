variable "env" {
  description = "Environment name"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of the ECS execution role"
  type        = string
}

variable "container_image" {
  description = "Container image for the task"
  type        = string
}

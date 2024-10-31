provider "aws" {
  region = var.region
}

module "ecs_task" {
  source = "../../../modules/ecs_task"
  env = "dev"
  execution_role_arn = "???"
  container_image = "???"
}
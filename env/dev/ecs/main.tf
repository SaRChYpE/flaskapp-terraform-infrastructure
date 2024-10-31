provider "aws" {
  region = var.region
}

module "ecs" {
  source = "../../../modules/ecs_cluster"
  env = "dev"
  ecs_asg_arn = data.terraform_remote_state.asg.outputs.ecs_asg_arn
}
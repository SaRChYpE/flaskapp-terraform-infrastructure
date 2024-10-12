provider "aws" {
  region = var.region
}

module "ecs" {
  source = "../../../modules/ecs_cluster"
  env = "dev"
  sg_id = data.terraform_remote_state.sg.outputs.sg_id
  subnet_id = data.terraform_remote_state.subnet.outputs.subnet_id
  subnet2_id = data.terraform_remote_state.subnet.outputs.subnet2_id
  ecs_tg_arn = data.terraform_remote_state.alb.outputs.ecs_tg_arn
  ecs_asg = data.terraform_remote_state.asg.outputs.ecs_asg
  ecs_asg_arn = data.terraform_remote_state.asg.outputs.ecs_asg_arn
}
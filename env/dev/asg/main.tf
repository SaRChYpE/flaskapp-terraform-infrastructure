provider "aws" {
  region = var.region
}

module "asg" {
  source = "../../../modules/asg"
  subnet_id = data.terraform_remote_state.subnet.outputs.subnet_id
  subnet2_id = data.terraform_remote_state.subnet.outputs.subnet2_id
  ecs_lt_id = data.terraform_remote_state.lt.outputs.ecs_lt_id
}
provider "aws" {
  region = var.region
}

module "alb" {
  source = "../../../modules/alb"
  env = "dev"
  sg_id = data.terraform_remote_state.sg.outputs.sg_id
  subnet_id = data.terraform_remote_state.subnet.outputs.subnet_id
  subnet2_id = data.terraform_remote_state.subnet.outputs.subnet2_id
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}
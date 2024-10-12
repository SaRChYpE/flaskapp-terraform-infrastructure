provider "aws" {
  region = var.region
}

module "lt" {
  source = "../../../modules/ecs_lt"
  env = "dev"
  sg_id = data.terraform_remote_state.sg.outputs.sg_id
}
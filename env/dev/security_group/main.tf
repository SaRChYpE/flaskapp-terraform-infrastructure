provider "aws" {
  region = var.region
}

module "sg" {
  source = "../../../modules/security_group"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  env = "dev"
}
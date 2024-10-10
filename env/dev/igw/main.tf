provider "aws" {
  region = var.region
}

module "igw" {
  source = "../../../modules/igw"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  env = "dev"
}
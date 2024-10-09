provider "aws" {
  region = var.region
}

module "subnet" {
  source = "../../../modules/subnet"
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr = data.terraform_remote_state.vpc.outputs.vpc_cidr
}
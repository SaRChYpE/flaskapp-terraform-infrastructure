provider "aws" {
  region = var.region
}

module "route" {
  source = "../../../modules/route"
  
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  igw_id = data.terraform_remote_state.igw.outputs.igw_id

  subnet_id = data.terraform_remote_state.subnet.outputs.subnet_id
  subnet2_id = data.terraform_remote_state.subnet.outputs.subnet2_id

}
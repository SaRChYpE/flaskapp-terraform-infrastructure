provider "aws" {
  region = var.region
}

module "ecr" {
  source = "../../../modules/ecr"
  ecr_name = "flaskapp"
}
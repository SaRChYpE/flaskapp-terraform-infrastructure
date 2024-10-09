provider "aws" {
  region = var.region
}

module "bucket" {
  source = "../../../modules/ecr"
  ecr_name = "dev-ecr-repo"
}
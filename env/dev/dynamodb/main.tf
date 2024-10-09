provider "aws" {
  region = var.region
}

module "dynamodb" {
  source = "../../../modules/dynamodb"
  
  table_name = "tfstate-lock-dev"
}
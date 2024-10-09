provider "aws" {
  region = var.region
}

module "bucket" {
  source = "../../../modules/bucket"

  bucket_name = "dev-sarchype-bucket"
  acl_mode = "private"
}
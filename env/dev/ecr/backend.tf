terraform {
  backend "s3" {
    bucket         = "dev-sarchype-bucket"
    key            = "terraform/ecr/state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tfstate-lock-dev"
    encrypt        = true
  }
}

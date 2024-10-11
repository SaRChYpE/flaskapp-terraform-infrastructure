data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-sarchype-bucket"
    key    = "terraform/vpc/state/terraform.tfstate"
    region = "eu-central-1"
  }
}
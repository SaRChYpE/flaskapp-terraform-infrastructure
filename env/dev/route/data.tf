data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "dev-sarchype-bucket"
    key    = "terraform/vpc/state/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "igw" {
  backend = "s3"
  config = {
    bucket = "dev-sarchype-bucket"
    key    = "terraform/igw/state/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "subnet" {
  backend = "s3"
  config = {
    bucket = "dev-sarchype-bucket"
    key    = "terraform/subnet/state/terraform.tfstate"
    region = "eu-central-1"
  }
}
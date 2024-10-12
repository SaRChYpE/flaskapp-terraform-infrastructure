data "terraform_remote_state" "lt" {
  backend = "s3"
  config = {
    bucket = "dev-sarchype-bucket"
    key    = "terraform/lt/state/terraform.tfstate"
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
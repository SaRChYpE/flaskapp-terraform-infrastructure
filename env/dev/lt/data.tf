data "terraform_remote_state" "sg" {
  backend = "s3"
  config = {
    bucket = "dev-sarchype-bucket"
    key    = "terraform/sg/state/terraform.tfstate"
    region = "eu-central-1"
  }
}
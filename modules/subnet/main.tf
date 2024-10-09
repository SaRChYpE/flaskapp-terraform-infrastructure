resource "aws_subnet" "subnet" {
 vpc_id                  = var.vpc_id
 cidr_block              = cidrsubnet(var.vpc_cidr , 8, 1)
 map_public_ip_on_launch = true
 availability_zone       = "eu-central-1a"

}



resource "aws_subnet" "subnet2" {
 vpc_id                  = var.vpc_id
 cidr_block              = cidrsubnet(var.vpc_cidr, 8, 2)
 map_public_ip_on_launch = true
 availability_zone       = "eu-central-1b"

}
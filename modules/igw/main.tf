resource "aws_internet_gateway" "internet_gateway" {
 vpc_id = var.vpc_id
 tags = {
   Name = "${var.env}-ecs-flaskapp-internet_gateway"
 }
}
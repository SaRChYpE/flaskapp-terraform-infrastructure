resource "aws_route_table" "route_table" {
 vpc_id = var.vpc_id
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = var.igw_id
 }
}

resource "aws_route_table_association" "subnet_route" {
 subnet_id      = var.subnet_id
 route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet2_route" {
 subnet_id      = var.subnet2_id
 route_table_id = aws_route_table.route_table.id
}
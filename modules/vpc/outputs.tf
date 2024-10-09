output "vpc_cidr" {
    description = "VPC CIDR."
    value = aws_vpc.main.cidr_block
}

output "vpc_id" {
  description = "VPC id."
  value       = aws_vpc.main.id
}
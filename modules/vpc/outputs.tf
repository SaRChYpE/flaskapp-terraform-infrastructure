output "vpc_cidr" {
    description = "VPC CIDR."
    value = aws_vpc.main.vpc_cidr
}

output "vpc_id" {
  description = "VPC id."
  value       = aws_vpc.main.id
}
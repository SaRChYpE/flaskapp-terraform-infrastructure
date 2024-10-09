output "vpc_id" {
    description = "VPC id."
    value = module.vpc.vpc_id
}

output "vpc_cidr" {
    description = "VPC CIDR."
    value = module.vpc.vpc_cidr
}
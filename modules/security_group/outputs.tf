output "sg_id" {
    description = "security group id"
    default = aws_security_group.security_group.id
}
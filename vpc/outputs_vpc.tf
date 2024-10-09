output vpc_id {
  value       = aws_vpc.main.id
}

output vpc_default_security_group_id {
  value       = aws_vpc.main.default_security_group_id
}
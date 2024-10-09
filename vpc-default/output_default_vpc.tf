output vpc_default_id {
  value       = aws_default_vpc.default.id
}

output vpc_default_subnet_az1_id {
  value = aws_default_subnet.default_az1.id
}

output vpc_default_subnet_az2_id {
  value = aws_default_subnet.default_az2.id
}

output vpc_default_security_group_id {
  value = aws_default_security_group.default.id
}

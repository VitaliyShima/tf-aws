output ssm_value {
  value       = aws_ssm_parameter.name_rds.value
  sensitive   = true
  description = "description"
  depends_on  = []
}

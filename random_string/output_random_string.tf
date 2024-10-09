output random_string {
  value       = random_string.rds_password.result
  sensitive   = true
  description = "generate pass"
  depends_on  = []
}

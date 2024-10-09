output "rds_endpoint" {
  value = aws_db_instance.db_instance.endpoint
}


output "rds_id" {
  value = aws_db_instance.db_instance.id
}

output "rds_address" {
  value = aws_db_instance.db_instance.address
}

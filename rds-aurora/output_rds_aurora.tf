output "rds_endpoint" {
  value = aws_rds_cluster_instance.cluster_instances[0].endpoint
}


output "rds_id" {
  value = aws_rds_cluster_instance.cluster_instances[0].id
}

output "rds_database_name" {
  value = aws_rds_cluster.cluster1.database_name
}


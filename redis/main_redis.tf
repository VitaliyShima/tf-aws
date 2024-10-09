locals {
  name_redis_instance = lower("${var.project_name}-${var.name_redis_instance}")
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id      = local.name_redis_instance
  engine          = "redis"
  node_type       = var.node_type
  num_cache_nodes = 1
  engine_version  = var.redis_version
  security_group_ids   = var.security_groups_id
  subnet_group_name = var.subnet_group_name
  port            = 6379
  
  tags = {
    Name = var.name_redis_instance
  }
}

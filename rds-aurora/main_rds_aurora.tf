locals {
  rds_cluster_instance = lower("${var.project_name}-${var.env_project}-${var.name_rds_cluster_instance}")
}

#---------------------------------------------------
# Create aws_rds_instance aurora
#---------------------------------------------------
resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "${local.rds_cluster_instance}-cluster-${count.index}"
  cluster_identifier = aws_rds_cluster.cluster1.id
  instance_class     = var.class_db_instance #"db.t3.large"
  engine             = aws_rds_cluster.cluster1.engine
  engine_version     = aws_rds_cluster.cluster1.engine_version
  db_subnet_group_name = var.db_subnet_group_name
}

resource "aws_rds_cluster" "cluster1" {
  cluster_identifier = local.rds_cluster_instance
  # availability_zones = ["${var.region}a"]
  engine             = var.type_engine #"aurora-mysql"
  engine_version     = var.engine_version   #"5.7.mysql_aurora.2.11.1"
  database_name      = var.name_db_rds
  master_username    = var.db_username
  master_password    = var.db_userpass
  storage_encrypted  = true
  db_subnet_group_name = var.db_subnet_group_name
  skip_final_snapshot  = true
  vpc_security_group_ids = var.vpc_security_group_ids # add to request []
  tags = {
    Name = local.rds_cluster_instance
  }
}

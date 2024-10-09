locals {
  name_rds_instance = lower("${var.project_name}-${var.env_project}-${var.name_instans_rds}")
}

#---------------------------------------------------
# Create aws_rds_instance
#---------------------------------------------------
resource "aws_db_instance" "db_instance" {
  identifier             = local.name_rds_instance
  availability_zone      = "${var.region}a"
  snapshot_identifier    = var.snapshot_identifier
  allocated_storage      = var.allocated_storage
  storage_type           = var.storage_type
  engine                 = var.type_engine
  engine_version         = var.engine_version
  instance_class         = var.class_db_instance
  db_name                = var.name_db_rds
  username               = var.db_username
  password               = var.db_userpass
  # allow_major_version_upgrade = "true"
  # apply_immediately = "true"  
  skip_final_snapshot    = "true"
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [var.vpc_security_group_ids]
  tags = {
    Name = local.name_rds_instance
  }
}


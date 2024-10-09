resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = var.name_elasti_subnet
  subnet_ids = var.subnet_ids
}
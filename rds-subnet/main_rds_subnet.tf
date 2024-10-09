resource "aws_db_subnet_group" "subnet_for_db" {
  name       = lower(var.name_subnet)
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.name_subnet} My DB subnet group"
  }
}
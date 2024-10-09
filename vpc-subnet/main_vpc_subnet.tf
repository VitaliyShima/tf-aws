resource "aws_subnet" "subgroup" {
  vpc_id     = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "SubnGroup-${var.name_object}-${var.env_project}"
  }
}
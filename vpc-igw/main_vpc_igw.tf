resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "igw-${var.name_object}-${var.env_project}"
  }
}
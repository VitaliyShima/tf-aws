resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "VRT-${var.name_object}_${var.env_project}"
  }
}

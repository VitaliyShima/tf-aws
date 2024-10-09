resource "aws_nat_gateway" "ngw" {
  allocation_id = var.eip_id
  connectivity_type = var.status_connectivaty
  subnet_id     = var.subnet_id

  tags = {
    Name = "ngw-${var.name_object}_${var.env_project}"
  }
}
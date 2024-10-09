locals {
  name_sg = "SG_${var.project_name}-${var.env_project}-${var.name_sg}"
}
resource "aws_security_group" "sg_serv_aws" {
  name = local.name_sg
  vpc_id = var.custom_vpc_id
  tags = {
    Name = local.name_sg
  }
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks_ingress
      security_groups = var.security_groups
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


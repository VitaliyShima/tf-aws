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
    for_each = var.ingress_allow
    content {
      from_port = ingress.value.from_port
      to_port = ingress.value.to_port
      protocol = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

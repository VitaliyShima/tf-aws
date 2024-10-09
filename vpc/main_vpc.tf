resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}_${var.env_project}_vpc"
  }
}

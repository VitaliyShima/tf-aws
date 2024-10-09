resource "aws_eip" "eip_serv_aws" {
  instance = var.ec2_id
  domain = "vpc"
  tags = {
    "Name" = var.name_eip
  }
}

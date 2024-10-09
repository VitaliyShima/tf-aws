locals {
  name_ami = "${var.project_name}_ami_${var.env_project}"
}

resource "aws_ami_from_instance" "reference_ami" {
  name               = var.name_ami
  source_instance_id = var.source_instance_id
  tags = {
    Name = local.name_ami
  }
  # depends_on = [aws_instance.serv_aws]
}

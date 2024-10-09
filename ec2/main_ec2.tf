locals {
  key_name          = "${var.project_name}_${var.env_project}"
  local_name = "${var.project_name}-${var.env_project}-${var.name_ec2_instance}"
}

resource "aws_instance" "serv_aws" {
  ami                  = var.ami_id_ec2
  instance_type        = var.instance_type
  availability_zone    = "${var.region}a"
  iam_instance_profile = var.iam_instance_profile
  # security_groups = [ # for default vpc
  #   var.security_groups
  # ]
  associate_public_ip_address = true
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  key_name = local.key_name
  tags = {
    Name = "${local.local_name}"
  }
  user_data = var.user_data

  root_block_device {
    delete_on_termination = true
    volume_type           = "gp3"
    iops                  = 3000
    volume_size           = var.volume_size_ec2
  }
  volume_tags = {
    "Name" = "volume_${local.local_name}"
  }
}

locals {
  key_name          = "${var.project_name}_${var.env_project}"
}

module "key_pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  key_name   = local.key_name
  public_key = file("${var.path_local_ssh_key_public}/${local.key_name}.pub")
}

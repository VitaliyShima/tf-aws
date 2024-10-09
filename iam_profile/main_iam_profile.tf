resource "aws_iam_instance_profile" "profile_ec2" {
  name = "${var.name_profile}_${var.env_project}"
  role = var.role
}

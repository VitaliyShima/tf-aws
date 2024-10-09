locals {
  global_name = "${var.project_name}-${var.name_codecommit}"
}
resource "aws_codecommit_repository" "codecommit_repository" {
  repository_name = local.global_name
  description     = "This is the Sample App Repository"
}

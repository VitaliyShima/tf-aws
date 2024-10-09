variable "codebuild_name" {}
variable "service_role" {}
variable "env_project" {}
variable "project_name" {}
variable "s3_id" {}
variable "source_codecommit" {}
variable "environment_variable" {}
variable path_ssm {}
variable vpc_id {}
variable subnet {}
variable security_group_ids {}
variable version_image {}
variable source_type {
  type = string
  default = "GITLAB"
}
variable "compute_type" {
  type = string
  default = "BUILD_GENERAL1_SMALL"
}
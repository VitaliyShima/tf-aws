locals {
  branch                = var.env_project == "prod" ? "master" : var.env_project #onle for selecting branch
#  path_ssm              = "${local.branch}_API_CONFIG"
  global_codebuild_name = "${var.project_name}-${var.codebuild_name}-${var.env_project}-build"
}
resource "aws_codebuild_project" "codebuild-project" {
  name          = local.global_codebuild_name
  description   = "codebuild_codebuild_project"
  build_timeout = "40"
  badge_enabled = true
  # concurrent_build_limit = "1"
  service_role  = var.service_role
  source_version = "refs/heads/${local.branch}"
    artifacts {
      type = "S3"
      location = var.s3_id
      packaging = "NONE" #"ZIP"
      encryption_disabled = true
    }

    cache {
      type     = "S3"
      location = var.s3_id
    }

    environment {
      compute_type                = var.compute_type
      image                       = var.version_image #"aws/codebuild/amazonlinux2-x86_64-standard:3.0"
      type                        = "LINUX_CONTAINER"
      image_pull_credentials_type = "CODEBUILD"

      dynamic "environment_variable" {
          for_each = var.environment_variable
          content {
              name = environment_variable.value.name
              value = "/${var.path_ssm}/${var.env_project}/${environment_variable.value.name}"
              type = environment_variable.value.type
          }
      }

    }

    logs_config {
      cloudwatch_logs {
        group_name = "${var.project_name}-${var.codebuild_name}-${var.env_project}-buildlog"
      }
    }

    source {
      type            = var.source_type
      location        = var.source_codecommit
      git_clone_depth = 1

      git_submodules_config {
        fetch_submodules = true
      }
    }

    vpc_config {
      vpc_id = var.vpc_id

      subnets = var.subnet

      security_group_ids = var.security_group_ids
    }    

  tags = {
    Environment = var.env_project
  }
}

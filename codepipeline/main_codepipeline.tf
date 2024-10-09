locals {
  branch = var.env_project == "prod" ? "master" : var.env_project
  full_codepipeline_name = "${var.project_name}-${var.codepipeline_name}-${local.branch}-pipeline"
}

resource "aws_codepipeline" "codepipeline" {
  name = local.full_codepipeline_name
  role_arn = var.role_codepipeline_arn
  artifact_store {
    location = var.s3_codebuild_bucket
    type = "S3"
  }
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = var.source_action_provider
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.source_action_configuration_ConnectionArn
        FullRepositoryId = var.codecommit_id
        BranchName       = local.branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_name
      }
    }
  }

  # stage {
  #   name = "Deploy"

  #   action {
  #     name            = "Deploy"
  #     category        = "Deploy"
  #     owner           = "AWS"
  #     provider        = "CodeDeploy"
  #     input_artifacts = ["build_output"]
  #     version         = "1"

  #     configuration = {
  #       ApplicationName     = var.codedeploy_app_name
  #       DeploymentGroupName   = var.codedeploy_group_name
  #     }
  #   }
  # }
}

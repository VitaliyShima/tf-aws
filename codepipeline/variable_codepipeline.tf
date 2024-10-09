variable "codepipeline_name" {
  type = string
  default = ""
}
variable "project_name" {
  type    = string
  default = "" 
} 
variable "env_project" {
  type    = string
  default = ""
}
variable "s3_codebuild_bucket" {   # aws_s3_bucket.for_codebuild.bucket
  type = string
  default = ""
} 
variable "role_codepipeline_arn" {  # aws_iam_role.codepipeline_role.arn
  type = string
  default = ""
}
variable "codecommit_id" {  # aws_codecommit_repository.test.id
  type = string
  default = ""
} 
variable "codebuild_name" {  # aws_codebuild_project.codebuild-project.name
  type = string
  default = ""
} 
variable "codedeploy_app_name" {
  type = string
  default = ""
}
variable "codedeploy_group_name" {
  type = string
  default = ""
}
variable "OutputArtifactFormat" {
  type = string
  default = "CODE_ZIP"
}
variable "PollForSourceChanges" {
  type = string
  default = "false"
}
variable "source_action_provider" {
  type = string
  default = "CodeStarSourceConnection" #CodeCommit
}
variable "source_action_configuration_ConnectionArn" {
  type = string
}
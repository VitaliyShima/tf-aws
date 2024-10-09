output "codebuild_arn" {
    value = aws_codebuild_project.codebuild-project.arn
}

output "codebuild_name" {
    value = aws_codebuild_project.codebuild-project.name
}
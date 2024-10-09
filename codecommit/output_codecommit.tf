output "codecommit_url_http" {
  value = aws_codecommit_repository.codecommit_repository.clone_url_http
}

output "codecommit_arn" {
  value = aws_codecommit_repository.codecommit_repository.arn
}

output "codecommit_id" {
  value = aws_codecommit_repository.codecommit_repository.id
}
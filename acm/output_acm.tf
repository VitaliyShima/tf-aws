output "acm_certificate_validation_options" {                   # вывыдит данные необходимые для создания CNAME-записи, которая позволит валидировать DNS
  description = "arn of acm certificate"
  value       = aws_acm_certificate.cert.domain_validation_options
}

output "acm_certificate_arn" {                   # вывыдит данные необходимые для создания CNAME-записи, которая позволит валидировать DNS
  description = "arn of acm certificate"
  value       = aws_acm_certificate.cert.arn
}

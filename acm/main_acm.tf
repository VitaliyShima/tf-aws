resource "aws_acm_certificate" "cert" { # модуль создающий SSL сертификат для указаного нами домена.
  domain_name       = var.zone_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

}

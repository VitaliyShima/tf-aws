resource "aws_route53_zone" "main" {
  name = var.zone_name
}

resource "aws_route53_record" "main-ns" {
  for_each = {
    for dvo in var.acm_certificate_arn : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.main.zone_id
}

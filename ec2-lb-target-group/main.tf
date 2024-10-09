resource "aws_lb_target_group" "tg" {
  name     = var.name_lb_target_group
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id

  # health_check {
  #   protocol = "HTTPS"
  #   path = "/"
  # }
} 
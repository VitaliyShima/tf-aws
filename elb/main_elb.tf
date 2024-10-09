locals {
  global_name = lower("${var.project_name}-${var.env_project}-${var.name_elb}")
}

resource "aws_lb_target_group" "elb_app_tg" {
  name     = "elb-tg-${local.global_name}"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = aws_default_vpc.default.id

  health_check {
    protocol = "HTTPS"
    path = "/"
  }
} 

resource "aws_lb" "elb_app" {
  name               = "elb-${local.global_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  subnets            = [aws_default_subnet.default_azlb_a.id, aws_default_subnet.default_azlb_b.id]

}

resource "aws_lb_listener" "elb_app_listener" {
  load_balancer_arn = aws_lb.elb_app.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "elb_application_https" {
  load_balancer_arn = aws_lb.elb_app.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_ssl_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.elb_app_tg.arn
  }
}



resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC for ${local.global_name}"
  }
}


resource "aws_default_subnet" "default_azlb_a" {
  availability_zone = var.availability_zone_az1

  tags = {
    Name = "Default subnet for ${var.availability_zone_az1}"
  }
}
resource "aws_default_subnet" "default_azlb_b" {
  availability_zone = var.availability_zone_az2

  tags = {
    Name = "Default subnet for ${var.availability_zone_az2}"
  }
}

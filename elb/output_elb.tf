output elb_arn {
  value       = aws_lb_target_group.elb_app_tg.arn
}

output elb_name {
  value       = aws_lb_target_group.elb_app_tg.name
}

output elb_listener_arn {
  value       = aws_lb_listener.elb_app_listener.arn
}
resource "aws_lb_listener_rule" "static" {
  listener_arn = var.lb_listener_arn
  priority     = var.rule_priority

  action {
    type             = var.type_action
    target_group_arn = var.target_group_arn
  }

  condition {
    path_pattern {
      values = [var.path_pattern]
    }
  }

}
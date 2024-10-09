locals {
  global_name = "${var.project_name}_${var.env_project}_${var.name_asg}"
}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.id
  lb_target_group_arn = var.alb_target_group_arn
}

resource "aws_launch_configuration" "launch_configuration" {
  name   = "${local.global_name}_l-c"
  image_id      = var.image_id
  instance_type = var.instance_type
  security_groups = [var.security_groups]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name = "${local.global_name}_a-g"
  availability_zones = ["${var.region}a"]
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  health_check_grace_period = var.health_check_grace_period

  launch_configuration = aws_launch_configuration.launch_configuration.id

  tag {
    key = "Name"
    value = "${local.global_name}_asg"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "autoscaling_policy" {
  name                   = "Custom_autoscaling_policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_value
  }
  autoscaling_group_name = aws_autoscaling_group.autoscaling_group.name
}

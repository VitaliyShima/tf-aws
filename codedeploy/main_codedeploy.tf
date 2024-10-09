locals {
  name_codedeploy = "${var.codedeploy_name}_${var.env_project}"
}
resource "aws_codedeploy_app" "codedeploy_app" {
  name = local.name_codedeploy
  # depends_on = [aws_autoscaling_group.autoscaling_group]
}

resource "aws_codedeploy_deployment_group" "codedeploy_group" {
  app_name              = aws_codedeploy_app.codedeploy_app.name
  deployment_group_name = "codedeploy-group"
  service_role_arn      = var.instance_role_arn
  # autoscaling_groups = aws_autoscaling_group.bar.arn
  deployment_config_name = "CodeDeployDefault.OneAtATime"

  deployment_style {
    deployment_option = "WITH_TRAFFIC_CONTROL"
    deployment_type   = "BLUE_GREEN"
  }

  load_balancer_info {
    elb_info {
      name = var.elb_info_name
    }
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout    = "STOP_DEPLOYMENT"
      wait_time_in_minutes = 60
    }

    green_fleet_provisioning_option {
      action = "DISCOVER_EXISTING"
    }

    terminate_blue_instances_on_deployment_success {
      action = "TERMINATE"
    }
  }
  auto_rollback_configuration {
    enabled = true
    events = ["DEPLOYMENT_FAILURE"]
  }
}

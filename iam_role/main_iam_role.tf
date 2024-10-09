resource "aws_iam_role" "role" {
  name = "${var.role_name}_${var.env_project}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = var.action_role,
        Principal = {
          Service = var.service_role
        },
        Effect = var.effect_role,
        Sid = ""
      }
    ]
  })
}
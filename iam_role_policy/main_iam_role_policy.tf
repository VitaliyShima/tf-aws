resource "aws_iam_role_policy" "role_policy" {
  name = "${var.role_policy_name}_${var.env_project}"
  role = var.role_id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = var.action_policy,
        Effect = var.effect_policy,
        Resource = var.resource_policy
        Condition = var.condition_policy
      }
    ]
  })
}

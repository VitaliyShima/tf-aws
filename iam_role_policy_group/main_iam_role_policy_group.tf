resource "aws_iam_role_policy" "role_policy" {
  name = "${var.role_policy_name}_${var.env_project}"
  role = var.role_id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = var.statement
  })
}
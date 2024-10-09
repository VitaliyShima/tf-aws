resource "aws_iam_user_policy" "policy_codecommit" {
  name = var.iam_policy_name
  user = var.use_user # aws_iam_user.user_codecommit.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = var.statement
  })
}

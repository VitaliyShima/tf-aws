resource "aws_iam_user" "user_codecommit" {
  name = var.iam_name

  tags = {
    tag-key = "aws_iam_user.user_codecommit"
  }
}

resource "aws_iam_user" "user" {
  name = var.user_name
  path = "/"
  tags = var.tags
}

resource "aws_iam_user_policy_attachment" "attach" {
  for_each   = toset(var.iam_policy_arn_list)
  user       = aws_iam_user.user.name
  policy_arn = each.key

}

resource "aws_iam_access_key" "user" {
  count = var.create_key ? 1 : 0
  user  = aws_iam_user.user.name
}

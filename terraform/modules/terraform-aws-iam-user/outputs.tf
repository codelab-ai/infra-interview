output "access_key_id" {
  value = aws_iam_access_key.user[0].id
}

output "access_key_secret" {
  value = aws_iam_access_key.user[0].secret
}
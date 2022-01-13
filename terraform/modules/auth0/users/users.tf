resource "auth0_user" "user" {
  connection_name = var.user_connection_name
  email           = var.user_email
  roles           = var.roles
  password        = var.user_password
}

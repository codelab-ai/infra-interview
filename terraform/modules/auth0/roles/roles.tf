resource "auth0_role" "role" {
  name        = var.role_name
  description = var.role_description
}

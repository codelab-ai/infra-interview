resource "auth0_client" "app" {
  name                = var.app_name
  description         = var.app_description
  app_type            = var.app_type
  oidc_conformant     = var.oidc_conformant
  callbacks           = var.callbacks
  allowed_origins     = var.allowed_origins
  allowed_logout_urls = var.allowed_logout_urls
  grant_types         = ["authorization_code", "implicit", "password", "refresh_token", "client_credentials"]
  web_origins         = var.allowed_web_origins
  jwt_configuration {
    lifetime_in_seconds = var.jwt_lifetime_in_seconds
    secret_encoded      = var.jwt_secret_encoded
    alg                 = var.jwt_alg

  }

  refresh_token {
    rotation_type                = var.rotation_type
    expiration_type              = var.expiration_type
    token_lifetime               = var.token_lifetime
    infinite_idle_token_lifetime = var.infinite_idle_token_lifetime
    infinite_token_lifetime      = var.infinite_token_lifetime
    idle_token_lifetime          = var.idle_token_lifetime
  }
}

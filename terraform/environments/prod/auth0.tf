
terraform {
  required_version = "~> 1.0.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.35"
    }
    auth0 = {
      source  = "alexkappa/auth0"
      version = "~> 0.21"
    }
  }
}

provider "auth0" {
  domain        = local.auth0_domain
  client_id     = local.auth0_tf_client_id
  client_secret = local.auth0_tf_client_secret
}

module "auth0_prod_web" {
  source          = "../../modules/auth0/apps/"
  app_name        = "Prod web app - Terraform"
  app_description = "Web App for prod - Terraform"
  app_type        = "regular_web"

}

module "auth0_prod_api" {
  source          = "../../modules/auth0/apps/"
  app_name        = "Prod API app - Terraform"
  app_description = "API web app for prod - Terraform"
  app_type        = "non_interactive"

}

module "auth0_prod_role" {
  source           = "../../modules/auth0/roles/"
  role_name        = "Role for prod"
  role_description = "Prod role created by TF"
}

module "auth0_prod_user" {
  source               = "../../modules/auth0/users"
  user_connection_name = "Username-Password-Authentication"
  user_password        = "S0m3th1nGgGggg"
  user_email           = "auth0-prod-user@codelab.io"
  roles                = [module.auth0_prod_role.id]
}



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

module "auth0_staging_web" {
  source          = "../../modules/auth0/apps/"
  app_name        = "Staging web app"
  app_description = "Web App for staging"
  app_type        = "regular_web"

}

module "auth0_staging_api" {
  source          = "../../modules/auth0/apps/"
  app_name        = "Staging API app"
  app_description = "API web app"
  app_type        = "non_interactive"

}

module "auth0_staging_role" {
  source           = "../../modules/auth0/roles/"
  role_name        = "Role for staging"
  role_description = "Staging role created by TF"
}

module "auth0_staging_user" {
  source               = "../../modules/auth0/users"
  user_connection_name = "Username-Password-Authentication"
  user_password        = "S0m3th1nGgGggg"
  user_email           = "auth0-staging-user@codelab.io"
  roles                = [module.auth0_staging_role.id]
}


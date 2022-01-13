data "aws_caller_identity" "current" {}


resource "aws_ssm_parameter" "dgraph_endpoint" {
  name        = "/${var.app_name}/dgraph/endpoint"
  description = "CODELAB_DGRAPH_ENDPOINT"
  type        = "String"
  value       = var.dgraph_endpoint
}

resource "aws_ssm_parameter" "dgraph_apikey" {
  name        = "/${var.app_name}/dgraph/apikey"
  description = "CODELAB_DGRAPH_API_KEY"
  type        = "SecureString"
  value       = var.dgraph_apikey
}

resource "aws_ssm_parameter" "aws_access_key" {
  name        = "/${var.app_name}/aws/access_key"
  description = "AWS_ACCESS_KEY_ID"
  type        = "SecureString"
  value       = var.aws_access_key
}

resource "aws_ssm_parameter" "aws_secret_key" {
  name        = "/${var.app_name}/aws/secret_key"
  description = "AWS_SECRET_ACCESS_KEY"
  type        = "SecureString"
  value       = var.aws_secret_key
}

resource "aws_ssm_parameter" "aws_bucket" {
  name        = "/${var.app_name}/aws/bucket"
  description = "AWS_BUCKET_NAME"
  type        = "String"
  value       = var.aws_bucket
}

resource "aws_ssm_parameter" "auth0_secret" {
  name        = "/${var.app_name}/auth0/secret"
  description = "AUTH0_SECRET"
  type        = "SecureString"
  value       = var.auth0_secret
}

resource "aws_ssm_parameter" "auth0_baseurl" {
  name        = "/${var.app_name}/auth0/baseurl"
  description = "AUTH0_BASE_URL"
  type        = "String"
  value       = var.auth0_baseurl
}

resource "aws_ssm_parameter" "auth0_issuer_baseurl" {
  name        = "/${var.app_name}/auth0/issuer_baseurl"
  description = "AUTH0_ISSUER_BASE_URL"
  type        = "String"
  value       = var.auth0_issuer_baseurl
}

resource "aws_ssm_parameter" "auth0_client_id" {
  name        = "/${var.app_name}/auth0/client_id"
  description = "AUTH0_CLIENT_ID"
  type        = "SecureString"
  value       = var.auth0_client_id
}

resource "aws_ssm_parameter" "auth0_client_secret" {
  name        = "/${var.app_name}/auth0/client_secret"
  description = "AUTH0_CLIENT_SECRET"
  type        = "SecureString"
  value       = var.auth0_client_secret
}

resource "aws_ssm_parameter" "auth0_audience" {
  name        = "/${var.app_name}/auth0/audience"
  description = "AUTH0_AUDIENCE"
  type        = "SecureString"
  value       = var.auth0_audience
}

resource "aws_ssm_parameter" "auth0_api_client_id" {
  name        = "/${var.app_name}/auth0/api_client_id"
  description = "AUTH0_API_CLIENT_ID"
  type        = "SecureString"
  value       = var.auth0_api_client_id
}

resource "aws_ssm_parameter" "auth0_api_client_secret" {
  name        = "/${var.app_name}/auth0/api_client_secret"
  description = "AUTH0_API_CLIENT_SECRET"
  type        = "SecureString"
  value       = var.auth0_api_client_secret
}

resource "aws_ssm_parameter" "nx_cloud_auth_token" {
  name        = "/${var.app_name}/nxcloud/auth_token"
  description = "NX_CLOUD_AUTH_TOKEN"
  type        = "SecureString"
  value       = var.nx_cloud_auth_token
}

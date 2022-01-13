variable "account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "cluster_name" {
  type        = string
  description = "ECS Cluster name"
}

variable "app_name" {
  type        = string
  description = "App name to be deployed in ECS"
}

variable "app_image" {
  type        = string
  description = "Docker image URI path without tag"
}

variable "app_image_tag" {
  type        = string
  description = "Docker image tag"
}

variable "app_port" {
  type        = string
  description = "App port"
  default     = 8080
}

variable "fargate_cpu" {
  type        = string
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  type        = string
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

variable "public_origin" {
  type        = string
  description = "Public Origin"

}

variable "api_endpoint" {
  type        = string
  description = "Backend API endpoint"
}

variable "api_graphql_endpoint" {
  type        = string
  description = "GraphQL API endpoint"
}

variable "aws_region" {
  type        = string
  description = "Main Region"
}
variable "app_domain" {
  type        = string
  description = "App domain"
}

variable "app_count" {
  type        = string
  description = "Number of app to be deployed"
  default     = "1"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnet ID"
}

variable "lb_dns" {
  type        = string
  description = "Load Balancer DNS name"
}

variable "lb_target_group_arn" {
  type        = string
  description = "Load Balancer target group ARN to attach service"
}

variable "sg_allowed_ports" {
  type        = list(string)
  description = "List of ports allowed to access ecs cluster"
}

variable "sg_alb" {
  type        = list(string)
  description = "List of ALB SG ID allowed to access ecs"
}

variable "wait_for_steady_state" {
  type        = bool
  description = "Wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing"
  default     = false
}

## Parameters

variable "dgraph_graphql_endpoint" {
  type        = string
  description = "GraphQL endpoint for dgraph"
}

variable "dgraph_endpoint" {
  type        = string
  description = "Dgraph endpoint"
}

variable "dgraph_apikey" {
  type        = string
  description = "Dgraph API key"
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
}

variable "aws_bucket" {
  type        = string
  description = "AWS S3 bucket for app"
}

variable "auth0_secret" {
  type        = string
  description = "Auth0 secret"
}

variable "auth0_baseurl" {
  type        = string
  description = "Auth0 base URL"
}

variable "auth0_issuer_baseurl" {
  type        = string
  description = "Auth0 Issuer base URL"
}

variable "auth0_client_id" {
  type        = string
  description = "Auth0 client ID"
}

variable "auth0_client_secret" {
  type        = string
  description = "Auth0 client secret"
}

variable "auth0_audience" {
  type        = string
  description = "Auth0 Audience"
}

variable "auth0_api_client_id" {
  type        = string
  description = "Auth0 API Client ID"
}

variable "auth0_api_client_secret" {
  type        = string
  description = "Auth0 API Client Secret"
}

variable "nx_cloud_auth_token" {
  type        = string
  description = "NX Cloud auth token"
}

variable "iam_policy_name" {
  type        = string
  description = "IAM policy name for parameter"
  default     = "test-secret-policy-parameters"
}
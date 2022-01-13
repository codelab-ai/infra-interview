provider "aws" {
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
  region                  = var.aws_region
}

# AWS Certificate Manager (ACM) must use US East
provider "aws" {
  alias                   = "us_east_1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "default"
  region                  = "us-east-1"
}

terraform {
  required_version = "~> 1.1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.35"
    }
  }
}

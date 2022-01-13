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

provider "aws" {
  region = "us-west-1"
}


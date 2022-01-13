locals {
  aws_region  = "us-west-1"
  account_id  = "810113963961"
  domain      = "codelab.ai"
  azs         = ["us-west-1a", "us-west-1c"]
  public_azs  = ["us-west-1a", "us-west-1c"]
  private_azs = ["us-west-1a", "us-west-1c"]
  #
  # Staging
  #
  # change when move to real staging
  staging_prefix   = "codelab-staging"
  staging_vpc_name = "Codelab-Staging-VPC"
  staging_vpc_cidr = "10.10.0.0/16"
  staging_public_subnets = [
    {
      name : "public_main",
      cidr : "10.10.10.0/24",
      az : "us-west-1a"
    },
    {
      name : "public_standby",
      cidr : "10.10.30.0/24",
      az : "us-west-1c"
    }
  ]
  staging_private_subnets = [
    {
      name : "private_main",
      cidr : "10.10.20.0/24",
      az : "us-west-1a"
    },
    {
      name : "private_standby",
      cidr : "10.10.40.0/24",
      az : "us-west-1c"
    }
  ]
  dgraph_ports = ["8080"]

  #
  # Production
  #
  prod_prefix   = "codelab-prod"
  prod_vpc_name = "Codelab-Prod-VPC"
  prod_vpc_cidr = "11.11.0.0/16"
  prod_public_subnets = [
    {
      name : "public_main",
      cidr : "11.11.10.0/24",
      az : "us-west-1a"
    },
    {
      name : "public_standby",
      cidr : "11.11.30.0/24",
      az : "us-west-1c"
    }
  ]
  prod_private_subnets = [
    {
      name : "private_main",
      cidr : "11.11.20.0/24",
      az : "us-west-1a"
    },
    {
      name : "private_standby",
      cidr : "11.11.40.0/24",
      az : "us-west-1c"
    }
  ]
}

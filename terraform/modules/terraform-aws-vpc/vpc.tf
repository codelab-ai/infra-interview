resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags                 = merge(var.tags, var.vpc_tags, { Name = var.vpc_name })
}

resource "aws_vpc_dhcp_options" "dns_resolver" {
  domain_name         = var.domain_name
  domain_name_servers = var.dns_servers
  ntp_servers         = var.ntp_servers
}

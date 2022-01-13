locals {
  main_public_subnet = var.public_subnets[0].name
}

resource "aws_subnet" "public" {
  for_each = {
    for subnet in var.public_subnets : subnet.name => subnet
  }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags                    = merge(var.tags, { "Name" : each.value.name, "Type" : "Private" })

}

resource "aws_internet_gateway" "igw" {
  count = length(var.public_subnets) > 0 ? 1 : 0

  vpc_id = aws_vpc.vpc.id
  tags   = merge(var.tags, { "Name" : var.igw_name })
}

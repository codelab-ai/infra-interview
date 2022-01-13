resource "aws_subnet" "private" {
  for_each = {
    for subnet in var.private_subnets : subnet.name => subnet
  }
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  map_public_ip_on_launch = false
  availability_zone       = each.value.az
  tags                    = merge(var.tags, { "Name" : each.value.name, "Type" : "Private" })
}
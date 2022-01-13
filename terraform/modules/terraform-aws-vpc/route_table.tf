resource "aws_route_table" "public" {
  for_each = {
    for subnet in var.public_subnets : subnet.name => subnet
  }

  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw[0].id
  }
  tags = merge(var.tags, { "Name" : "rtb-${each.value.name}-public-subnet" })
}

resource "aws_route_table_association" "public" {
  for_each = {
    for subnet in var.public_subnets : subnet.name => subnet
  }
  subnet_id      = aws_subnet.public[each.value.name].id
  route_table_id = aws_route_table.public[each.value.name].id
}

resource "aws_route_table" "private" {
  for_each = {
    for subnet in var.private_subnets : subnet.name => subnet
  }
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }

  tags = merge(var.tags, { "Name" : "rtb-${each.value.name}-private-subnet" })
}

resource "aws_route_table_association" "private" {
  for_each = {
    for subnet in var.private_subnets : subnet.name => subnet
  }
  subnet_id      = aws_subnet.private[each.value.name].id
  route_table_id = aws_route_table.private[each.value.name].id
}

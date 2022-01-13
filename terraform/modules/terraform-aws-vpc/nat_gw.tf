
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw.id
  subnet_id     = aws_subnet.public[local.main_public_subnet].id // put NATGW into first public subnet
  tags          = merge(var.natgw_tags, { Name = var.natgw_name })

  depends_on = [aws_internet_gateway.igw, aws_eip.natgw]
}

resource "aws_eip" "natgw" {
  vpc  = true
  tags = merge({ "Name" : "NATGW-EIP" }, var.tags, var.natgw_tags)
}

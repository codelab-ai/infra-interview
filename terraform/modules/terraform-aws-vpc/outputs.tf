output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "ID of private subnets"
}

output "public_subnet_ids" {
  description = "ID of public subnets"
  value = {
    for subnet in aws_subnet.public :
    subnet.tags.Name => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for subnet in aws_subnet.private :
    subnet.tags.Name => subnet.id
  }
  description = "ID of private subnets"
}

output "nat_gw_id" {
  value       = aws_nat_gateway.natgw.id
  description = "ID of NAT gateways"
}

output "internet_gw_id" {
  value       = aws_internet_gateway.igw.*.id
  description = "ID of internet gateways"
}

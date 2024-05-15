resource "aws_route_table" "private_RT" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = var.cidr_block_private_RT
    nat_gateway_id = var.nat_id
  }

  tags = {
    Name = var.private_route_table_name
  }
}

# Associate the private route table with private subnets
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_id)
  subnet_id      = var.private_subnet_id[count.index]
  route_table_id = var.private_RT_id
}
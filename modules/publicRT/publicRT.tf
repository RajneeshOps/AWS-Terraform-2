resource "aws_route_table" "public_RT" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr_block_public_RT
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# Associate the public route table with public subnets
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_id)
  subnet_id      = var.public_subnet_id[count.index]
  route_table_id = var.public_RT_id
}
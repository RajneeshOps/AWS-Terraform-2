
resource "aws_eip" "elastic_ip" {
  domain = "vpc"
}


resource "aws_nat_gateway" "nat" {
  allocation_id = var.elastic_ip
  subnet_id     = var.public_subnet_id

  tags = {
    Name = var.nat_name
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id                  = var.vpc_id
  count                   = length(var.private_subnet_cidr)
  cidr_block              = var.private_subnet_cidr[count.index]
  availability_zone       = var.private_az[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = var.private_subnet_name[count.index]
  }
}
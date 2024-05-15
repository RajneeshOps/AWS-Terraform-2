resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  count                   = length(var.public_subnet_cidr)
  cidr_block              = var.public_subnet_cidr[count.index]
  availability_zone       = var.public_az[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch


  tags = {
    Name = var.public_subnet_name[count.index]
  }
}
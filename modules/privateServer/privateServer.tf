resource "aws_instance" "private_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  count           = length(var.private_subnet_id)
  subnet_id       = var.private_subnet_id[count.index]
  key_name        = var.key_name
  security_groups = var.security_group
  tags = {
    Name = var.private_server_name[count.index]
    Type = "nginx"
  }
}
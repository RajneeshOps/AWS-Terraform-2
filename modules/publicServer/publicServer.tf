data "aws_ami" "latest_ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "public_instance" {
  ami             = data.aws_ami.latest_ubuntu.id
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  security_groups = var.security_group
  key_name        = var.key_name
  tags = {
    Name = var.public_server_name
  }
}
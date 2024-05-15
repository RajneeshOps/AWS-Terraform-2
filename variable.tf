# =========VPC=============

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

# ========Public-Subnet==========

variable "public_subnet_cidr" {
  type = list(string)

}

variable "public_az" {
  type = list(string)
}

variable "public_subnet_name" {
  type = list(string)
}

# -----------------------------------------
variable "map_public_ip_on_launch" {
  type = bool
}

# =================Private-Subnet==============

variable "private_subnet_cidr" {
  type = list(string)
}

variable "private_az" {
  type = list(string)
}

variable "private_subnet_name" {
  type = list(string)
}

# =================Internet Gateway==============

variable "gateway_name" {
  type = string
}

# ====================NAT====================

variable "nat_name" {
  type = string
}

variable "cidr_block_public_RT" {
  type = string
}

variable "public_route_table_name" {
  type = string
}

variable "cidr_block_private_RT" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

# =================Bastion & private servers===============
variable "instance_type" {
  type = string
}

variable "public_server_name" {
  type = list(string)
}

variable "private_server_name" {
  type = list(string)
}

variable "ec2_key_pair" {
  description = "Default key pair for the EC2 instance"
  default     = "awskey"
}


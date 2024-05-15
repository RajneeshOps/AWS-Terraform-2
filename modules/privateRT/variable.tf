variable "vpc_id" {
  type = string
}

variable "cidr_block_private_RT" {
  type = string
}

variable "nat_id" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

variable "private_subnet_id" {
  type = list(string)
}

variable "private_RT_id" {
  type = string
}
variable "vpc_id" {
  type = string
}

variable "cidr_block_public_RT" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "public_route_table_name" {
  type = string
}

variable "public_subnet_id" {
  type = list(string)
}

variable "public_RT_id" {
  type = string
}
variable "vpc_id" {
  type = string
}

variable "private_subnet_cidr" {
  type = list(string)
}

variable "private_az" {
  type = list(string)
}

variable "private_subnet_name" {
  type = list(string)
}
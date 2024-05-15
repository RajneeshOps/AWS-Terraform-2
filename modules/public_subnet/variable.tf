variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "public_az" {
  type = list(string)
}

variable "public_subnet_name" {
  type = list(string)
}

variable "map_public_ip_on_launch" {
  type = bool
}
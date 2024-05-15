variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "private_subnet_id" {
  type = list(string)
}

variable "private_server_name" {
  type = list(string)
}

variable "security_group" {
  type = list(string)
}

variable "key_name" {
  type = string
}
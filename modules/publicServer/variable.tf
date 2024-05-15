variable "instance_type" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "public_server_name" {
  type = string
}

variable "security_group" {
  type = list(string)
}

variable "key_name" {
  type = string
}
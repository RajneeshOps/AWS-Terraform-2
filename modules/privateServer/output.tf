output "private_server_ip" {
  value = aws_instance.private_server.*.private_ip
}
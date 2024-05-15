output "elastic_ip" {
  value = aws_eip.elastic_ip.id
}

output "nat_id" {
  value = aws_nat_gateway.nat.id
}
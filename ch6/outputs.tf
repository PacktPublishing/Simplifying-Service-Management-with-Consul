output "Consul_Server_IPs" {
  value = aws_instance.consul-server[*].public_ip
}
output "Consul_Client_IPs" {
  value = aws_instance.consul-client[*].public_ip
}
output "CONSUL_HTTP_ADDR" {
  value ="http://${aws_instance.consul-server[1].public_ip}:8500"
}
output "CONSUL_HTTPS_ADDR" {
  value ="https://${aws_instance.consul-server[1].public_ip}:8501"
}
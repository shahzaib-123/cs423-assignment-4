output "ec2_instance_ips" {
  value = {
    web_server        = aws_instance.web_server.public_ip
    database_instance = aws_instance.database_instance.private_ip
  }
}
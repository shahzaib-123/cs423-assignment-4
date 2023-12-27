provider "aws" {
  region = var.region
}

resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Security group for web server"
  vpc_id      = module.networking.vpc_id
}

output "security_group_id" {
  value = aws_security_group.web_server_sg.id
}

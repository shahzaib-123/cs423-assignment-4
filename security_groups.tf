resource "aws_security_group" "web_server_sg" {
  name        = "web-server-sg"
  description = "Security group for web server"
  vpc_id      = aws_vpc.devops_assignment.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "database_sg" {
  name        = "database-sg"
  description = "Security group for database"
  vpc_id      = aws_vpc.devops_assignment.id
}

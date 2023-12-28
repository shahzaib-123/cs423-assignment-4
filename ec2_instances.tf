resource "aws_instance" "web_server_instance" {
  ami                    = "ami-07c589821f2b353aa"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = aws_key_pair.cs423_key_pair.key_name
  vpc_security_group_ids        = [aws_security_group.web_server_sg.vpc_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2   
              EOF

  tags = {
    Name = "Assignment4-EC2-1"
  }
}

resource "aws_instance" "database_instance" {
  ami                    = "your_ubuntu_ami_id"  # Use the appropriate AMI ID for your database instance
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_1.id
  key_name               = aws_key_pair.cs423_key_pair.key_name
  vpc_security_group_ids         = [aws_security_group.database_sg.vpc_id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install mariadb-server
              sudo mysql_secure_installation
              EOF

  tags = {
    Name = "Assignment4-Database-EC2"
  }
}


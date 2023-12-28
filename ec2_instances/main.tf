provider "aws" {
  region = var.region
}

resource "aws_instance" "assignment4-EC2-1" {
  ami                    = "ami-07c589821f2b353aa"  # Replace with the latest Ubuntu AMI
  instance_type          = "t2.micro"
  key_name               = module.key_pair.key_pair_name
  subnet_id              = module.networking.public_subnet_1_id
  security_group_ids     = [module.security_groups.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2
              EOF
}

resource "aws_instance" "assignment4-EC2-2" {
  ami                    = "ami-07c589821f2b353aa"
  instance_type          = "t2.micro"
  key_name               = module.key_pair.key_pair_name
  subnet_id              = module.networking.private_subnet_1_id
  security_group_ids     = [module.security_groups.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install mariadb-server
              sudo mysql_secure_installation
              EOF
}
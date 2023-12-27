provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# ... (Previous Terraform code for VPC, subnets, etc.)

# Creating a security group
resource "aws_security_group" "ec2_security_group" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instances"
  vpc_id      = aws_vpc.devops_assignment_vpc.id

  # Inbound rules - Adjust as per your requirements
  ingress {
    from_port   = 80  # HTTP port for web server
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow inbound traffic from anywhere for demo purposes; restrict as needed
  }

  # Add more ingress rules for other necessary ports and sources

  # Outbound rules - Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

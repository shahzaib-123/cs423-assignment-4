provider "aws" {
  region = var.region
}

resource "aws_vpc" "devops_assignment" {
  cidr_block = "your_cidr_block"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "devops-assignment-4"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.devops_assignment.id
  cidr_block = "your_public_subnet_cidr_block_1"
  availability_zone = "use1-az1"
  map_public_ip_on_launch = true
  tags = {
    Name = "cs423-devops-public-1"
  }
}

output "vpc_id" {
  value = aws_vpc.devops_assignment.id
}

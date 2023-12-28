provider "aws" {
  region = var.region
}

resource "aws_vpc" "devops_assignment" {
  cidr_block = "10.0.0.0/16" 
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "devops-assignment-4"
  }
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.devops_assignment.id
  cidr_block = "10.0.1.0/16" 
  availability_zone = "us-east-1a" 
  map_public_ip_on_launch = true
  tags = {
    Name = "cs423-devops-public-1"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.devops_assignment.id
  cidr_block = "10.0.2.0/16"  
  availability_zone = "us-east-1b" 
  tags = {
    Name = "cs423-devops-private-1"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.devops_assignment.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_assignment.id
  }
  tags = {
    Name = "devops_assignment-4-private-route-table"
  }
}

resource "aws_internet_gateway" "devops_assignment" {
  vpc_id = aws_vpc.devops_assignment.id
}
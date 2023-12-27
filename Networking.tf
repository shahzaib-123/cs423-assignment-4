provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# Creating VPC
resource "aws_vpc" "devops_assignment_vpc" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block
  tags = {
    Name = "devops-assignment-4"
  }
}

# Creating public subnets
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.devops_assignment_vpc.id
  cidr_block = "10.0.1.0/24"  # Replace with your desired CIDR block
  availability_zone = "us-west-2a"  # Change availability zone as needed
  tags = {
    Name = "cs423-devops-public-1"
  }
}

# Creating private subnets
resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.devops_assignment_vpc.id
  cidr_block = "10.0.2.0/24"  # Replace with your desired CIDR block
  availability_zone = "us-west-2a"  # Change availability zone as needed
  tags = {
    Name = "cs423-devops-private-1"
  }
}

# Creating route table for private subnets
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.devops_assignment_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_assignment_igw.id
  }
  tags = {
    Name = "devops-assignment-4-private-route-table"
  }
}

# Associating private subnets with the private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

# Creating internet gateway
resource "aws_internet_gateway" "devops_assignment_igw" {
  vpc_id = aws_vpc.devops_assignment_vpc.id
}

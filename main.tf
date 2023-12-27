provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "./networking"
}

module "security_groups" {
  source = "./security_groups"
}

module "key_pair" {
  source = "./key_pair"
}

module "ec2_instances" {
  source = "./ec2_instances"
}

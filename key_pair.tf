provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# ... (Previous Terraform code)

# Creating a key pair
resource "aws_key_pair" "cs423_assignment4_key" {
  key_name   = "cs423-assignment4-key"
  public_key = file("~/.ssh/cs423-assignment4-key.pub")  # Replace with the path to your public key file
}

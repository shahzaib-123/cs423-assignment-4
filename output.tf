provider "aws" {
  region = "us-west-2"  # Change to your desired region
}

# ... (Previous Terraform code)

# EC2 instance for web server
resource "aws_instance" "web_server" {
  # ... (Previous configuration for the web server instance)
}

# EC2 instance for database or ML model
resource "aws_instance" "database_ml_instance" {
  # ... (Previous configuration for the database or ML instance)
}

# Output the public and private IP addresses of EC2 instances
output "ec2_instance_ips" {
  description = "Public and private IP addresses of EC2 instances"

  value = {
    web_server_public_ip       = aws_instance.web_server.public_ip
    web_server_private_ip      = aws_instance.web_server.private_ip
    database_ml_public_ip      = aws_instance.database_ml_instance.public_ip
    database_ml_private_ip     = aws_instance.database_ml_instance.private_ip
  }
}

# Output IAM user details
output "iam_user_details" {
  description = "Details of IAM user"

  value = {
    iam_user_name = aws_iam_user.terraform_user.name
    # Add more IAM user details if needed
  }
}

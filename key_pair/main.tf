provider "aws" {
  region = var.region
}

resource "aws_key_pair" "cs423_assignment4_key" {
  key_name   = "cs423-assignment4-key"
  public_key = file("path/to/your/public-key-file.pub")
}

output "key_pair_name" {
  value = aws_key_pair.cs423_assignment4_key.key_name
}

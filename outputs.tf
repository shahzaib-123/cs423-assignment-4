output "ec2_instance_ips" {
  value = aws_instance.web_server_instance.*.public_ip
}

output "iam_user_details" {
  value = aws_iam_user.terraform_user
}

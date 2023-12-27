output "ec2_instance_ips" {
  value = module.ec2_instances.ec2_instance_ips
}

output "iam_user_details" {
  value = module.iam_user.iam_user_details
}
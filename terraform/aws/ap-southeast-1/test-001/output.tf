output "name" {
  value       = local.tag_name
  description = "Instance Host Name"
}

output "private_ip" {
  value       = module.ec2.private_ip
  description = "The private IP address of the main server instance."
}

output "public_ip" {
  value       = aws_eip.this_eip
  description = "The public IP address of the main server instance."

}

output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.this.id
}

output "arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.this.arn
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.this.availability_zone
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.this.public_ip
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.this.private_ip
}


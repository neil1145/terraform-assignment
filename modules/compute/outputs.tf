output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.ubuntu.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ubuntu.public_ip
}

output "instance_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.ubuntu.public_dns
}
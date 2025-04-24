output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.networking.private_subnet_id
}

output "ubuntu_instance_id" {
  description = "ID of the Ubuntu EC2 instance"
  value       = module.compute.instance_id
}

output "ubuntu_instance_public_ip" {
  description = "Public IP of the Ubuntu EC2 instance"
  value       = module.compute.instance_public_ip
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.kubernetes.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = module.kubernetes.cluster_endpoint
}

output "s3_bucket_name" {
  description = "Name of the created S3 bucket"
  value       = module.storage.bucket_name
}

output "s3_bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = module.storage.bucket_arn
}

output "mysql_endpoint" {
  description = "Endpoint of the MySQL RDS instance"
  value       = module.database.db_endpoint
}

output "mysql_connection_string" {
  description = "MySQL connection string"
  value       = "mysql://${var.db_username}:${var.db_password}@${module.database.db_endpoint}/${var.db_name}"
  sensitive   = true
}
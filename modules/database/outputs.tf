output "db_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.mysql.id
}

output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.mysql.endpoint
}

output "db_name" {
  description = "Name of the database"
  value       = aws_db_instance.mysql.db_name
}

output "db_username" {
  description = "Username for the database"
  value       = aws_db_instance.mysql.username
  sensitive   = true
}

output "db_password" {
  description = "Password for the database (if generated)"
  value       = var.db_password == "" ? random_password.db_password.result : var.db_password
  sensitive   = true
}

output "db_port" {
  description = "Port for the database"
  value       = aws_db_instance.mysql.port
}
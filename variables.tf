variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "project" {
  description = "Project name for resource tagging"
  type        = string
  default     = "terraform-demo"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "ubuntu_instance_type" {
  description = "EC2 instance type for Ubuntu server"
  type        = string
  default     = "t3.micro"
}

variable "ubuntu_ami" {
  description = "AMI ID for Ubuntu server"
  type        = string
  default     = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS in us-east-1
}

variable "db_instance_class" {
  description = "Instance class for MySQL RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Name of the MySQL database"
  type        = string
  default     = "mydb"
}

variable "db_username" {
  description = "Username for the MySQL database"
  type        = string
  default     = "admin"
  sensitive   = true
}

variable "db_password" {
  description = "Password for the MySQL database"
  type        = string
  sensitive   = true
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "demo-cluster"
}

variable "eks_node_group_instance_type" {
  description = "Instance type for EKS node group"
  type        = string
  default     = "t3.medium"
}

variable "eks_node_group_desired_size" {
  description = "Desired size of EKS node group"
  type        = number
  default     = 2
}

variable "eks_node_group_min_size" {
  description = "Minimum size of EKS node group"
  type        = number
  default     = 1
}

variable "eks_node_group_max_size" {
  description = "Maximum size of EKS node group"
  type        = number
  default     = 3
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-terraform-demo-bucket"
}
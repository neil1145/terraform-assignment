provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project
      ManagedBy   = "Terraform"
    }
  }
}

# Networking module - VPC and Subnets
module "networking" {
  source              = "./modules/networking"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  environment         = var.environment
  project             = var.project
}

# Compute module - EC2 Ubuntu Instance
module "compute" {
  source            = "./modules/compute"
  instance_type     = var.ubuntu_instance_type
  ami_id            = var.ubuntu_ami
  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.networking.public_sg_id
  environment       = var.environment
  project           = var.project
  
  depends_on = [module.networking]
}

# Kubernetes module - EKS Cluster
module "kubernetes" {
  source                      = "./modules/kubernetes"
  cluster_name                = var.eks_cluster_name
  vpc_id                      = module.networking.vpc_id
  subnet_ids                  = [module.networking.public_subnet_id, module.networking.private_subnet_id]
  node_group_instance_type    = var.eks_node_group_instance_type
  node_group_desired_size     = var.eks_node_group_desired_size
  node_group_min_size         = var.eks_node_group_min_size
  node_group_max_size         = var.eks_node_group_max_size
  environment                 = var.environment
  project                     = var.project
  
  depends_on = [module.networking]
}

# Storage module - S3 Bucket
module "storage" {
  source        = "./modules/storage"
  bucket_name   = var.s3_bucket_name
  environment   = var.environment
  project       = var.project
}

# Database module - RDS MySQL (Optional)
module "database" {
  source          = "./modules/database"
  db_name         = var.db_name
  db_username     = var.db_username
  db_password     = var.db_password
  instance_class  = var.db_instance_class
  subnet_ids      = [module.networking.private_subnet_id]
  vpc_id          = module.networking.vpc_id
  environment     = var.environment
  project         = var.project
  
  depends_on = [module.networking]
}
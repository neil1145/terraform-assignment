# Terraform AWS Infrastructure as Code (IaC)

This project contains Terraform configurations for provisioning a complete AWS infrastructure environment with VPC, subnets, compute instances, Kubernetes cluster, storage, and database.

## Infrastructure Components

- **VPC:** A Virtual Private Cloud with public and private subnets
- **Subnets:**
  - Public Subnet: Accessible from the internet
  - Private Subnet: Not directly accessible from the internet
- **Compute:** Ubuntu EC2 instance in the public subnet
- **Kubernetes:** Amazon EKS cluster
- **Storage:** S3 bucket with encryption and lifecycle policies
- **Database:** MySQL RDS instance (optional)

## Project Structure

```
terraform-aws-infrastructure/
├── main.tf                # Main configuration file
├── variables.tf           # Input variables definition
├── outputs.tf             # Output values definition
├── terraform.tfvars       # Variable values (gitignored)
├── versions.tf            # Terraform and provider version constraints
├── backend.tf             # Remote state configuration
├── modules/
│   ├── networking/        # VPC, subnets, security groups, etc.
│   ├── compute/           # EC2 instances
│   ├── kubernetes/        # EKS cluster
│   ├── storage/           # S3 bucket
│   └── database/          # RDS MySQL instance
└── .gitignore             # Git ignore file
```

## Prerequisites

- AWS Account
- AWS CLI configured with appropriate credentials
- Terraform 1.5.0 or newer

## Setup Remote State Backend

Before initializing the Terraform project, you need to set up the remote state backend in AWS:

1. Edit the `setup-remote-state.sh` script to adjust parameters if needed
2. Make the script executable: `chmod +x setup-remote-state.sh`
3. Run the script: `./setup-remote-state.sh`

## Configuration

1. Create a `terraform.tfvars` file from the example:

```bash
cp terraform.tfvars.example terraform.tfvars
```

2. Edit the `terraform.tfvars` file to set your desired configuration values

## Usage

Initialize the Terraform project:

```bash
terraform init
```

Plan the infrastructure deployment:

```bash
terraform plan
```

Apply the infrastructure changes:

```bash
terraform apply
```

Clean up resources when no longer needed:

```bash
terraform destroy
```

## Environment Variables for Secrets Management

To avoid storing sensitive information in files, you can use environment variables:

```bash
export TF_VAR_db_username="admin"
export TF_VAR_db_password="YourSecurePassword123!"
```

## Accessing Kubernetes Cluster

After applying the Terraform configuration, you can configure kubectl to use your new EKS cluster:

```bash
aws eks update-kubeconfig --name <cluster-name> --region <region>
kubectl get nodes
```

## Security Considerations

- All sensitive values are marked as `sensitive = true` in variables
- S3 bucket has server-side encryption enabled
- Database storage is encrypted
- Public access is blocked for S3 buckets
- Security groups restrict access to necessary ports only
- Remote state is stored in an encrypted S3 bucket with state locking via DynamoDB

## Best Practices Implemented

- Modular design for reusability
- Remote state management for team collaboration
- Version pinning for provider stability
- Resource dependency management
- Tagging strategy for resource organization
- Security by default for all components
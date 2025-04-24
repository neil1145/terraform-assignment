terraform-aws-infrastructure/
├── main.tf                # Main configuration file
├── variables.tf           # Input variables definition
├── outputs.tf             # Output values definition
├── terraform.tfvars       # Variable values (gitignored)
├── versions.tf            # Terraform and provider version constraints
├── backend.tf             # Remote state configuration
├── modules/
│   ├── networking/        # VPC, subnets, security groups, etc.
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── compute/           # EC2 instances
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── kubernetes/        # EKS cluster
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── storage/           # S3 bucket
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── database/          # RDS MySQL instance
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── .gitignore            # Git ignore file
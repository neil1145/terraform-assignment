terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-unique-name"
    key            = "terraform/state/aws-infrastructure.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
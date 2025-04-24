#!/bin/bash

# This script sets up the remote state backend in AWS
# It creates an S3 bucket and DynamoDB table for state locking

# Set variables
AWS_REGION="us-east-1"
STATE_BUCKET="terraform-state-bucket-unique-name"
LOCK_TABLE="terraform-state-lock"

# Create S3 bucket with versioning and encryption
echo "Creating S3 bucket for remote state..."
aws s3api create-bucket \
    --bucket $STATE_BUCKET \
    --region $AWS_REGION

# Enable versioning
aws s3api put-bucket-versioning \
    --bucket $STATE_BUCKET \
    --versioning-configuration Status=Enabled

# Enable server-side encryption
aws s3api put-bucket-encryption \
    --bucket $STATE_BUCKET \
    --server-side-encryption-configuration '{
        "Rules": [
            {
                "ApplyServerSideEncryptionByDefault": {
                    "SSEAlgorithm": "AES256"
                },
                "BucketKeyEnabled": true
            }
        ]
    }'

# Block public access
aws s3api put-public-access-block \
    --bucket $STATE_BUCKET \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true"

# Create DynamoDB table for state locking
echo "Creating DynamoDB table for state locking..."
aws dynamodb create-table \
    --table-name $LOCK_TABLE \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region $AWS_REGION

echo "Remote state backend setup complete!"
echo "S3 bucket: $STATE_BUCKET"
echo "DynamoDB table: $LOCK_TABLE"
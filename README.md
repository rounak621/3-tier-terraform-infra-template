# Terraform 3-Tier AWS Infrastructure Template

Reusable Terraform template to deploy a 3-tier app infrastructure on AWS.

## 🔹 Features
- Multi-tier EC2 instances with Nginx
- S3 buckets for storage
- Optional DynamoDB for state locking
- Modular design for reusability
- Single SSH key pair for all environments

## 🔹 Project Structure
infra-app/
├── modules/
│ ├── ec2/
│ ├── s3/
│ └── dynamodb/
├── main.tf
├── variables.tf


## 🔹 SSH Key Pair
Generate a key pair to use for all environments:


ssh-keygen -t rsa -b 2048 -f infra-app-key

#Add the public key to AWS Key Pair.

Keep the private key safe; 

⚡ Usage

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# See planned changes
terraform plan

# Apply configuration (with optional variable overrides)
terraform apply 

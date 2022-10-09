# Terraform Basic Commands

## Step-01: Introduction
- Understand basic Commands
  - **terraform init** command initializes a working directory containing configuration files and installs plugins for required providers.
  - **terraform fmt** command rewrites configuration files to a canonical format and style.
  - **terraform validate** The terraform validate command validates the configuration files in a directory, referring only to the configuration and not accessing any remote services such as remote state, provider APIs, etc.
  - **terraform plan** command creates an execution plan with a preview of the changes that Terraform will make to your infrastructure.
  - **terraform apply** command executes the actions proposed in a Terraform plan to create, update, or destroy infrastructure.
  - **terraform destroy** command destroys all objects managed by a Terraform configuration.

  for more details, see the documentation https://www.terraform.io/cli/commands

## Step-02: check these few things before using this commands
- 1st check default vpc in your respective region
- 2nd check your amiid from that respective region
- 3rd check your aws credentials

## Step-03: Create ec2demo.tf for using Step-01 commands
```
# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"                           # This line is not mandatory.
  region  = "us-east-2"                         # change the region
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-07efac79022b86107"       # change the with your ami id
  instance_type = "t2.micro"                    # change the instance type
  tags = {
    Name = "ec2demo-TF-1"                       # for identification purposes
  }
}
```

## Step-04: Use terraform Command deploy Step-03 Instance
```
# Initialize Terraform
terraform init

# Terraform formatting
terraform fmt

# Terraform Validate check for syntax errors
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create EC2 Instance ec2demo.tf
terraform apply 
```

## Step-05: Verify the EC2 Instance same region in AWS Console
- Go to AWS Console -> Services -> EC2
- Verify newly created EC2 instance

## Step-06: Destroy Infrastructure
```
# Terraform Destroy to delete EC2 Instance ec2demo.tf
terraform destroy

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Step-07: Conclusion
- Summmay what we have learned in this section
- Learned about Important Terraform Commands
  - terraform init
  - terraform fmt
  - terraform validate
  - terraform plan
  - terraform apply
  - terraform destroy 
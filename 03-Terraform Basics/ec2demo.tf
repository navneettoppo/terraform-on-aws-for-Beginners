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
terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {                                     # S3 bucket & dynamoDB have been created manually
    bucket         = "s3-for-mern-01"
    region         = "ap-south-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-tf-files"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}

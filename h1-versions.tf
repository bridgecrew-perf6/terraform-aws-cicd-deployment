# Terroform Block
terraform {
    required_version = "~> v1.1.8"   
    required_providers {
        aws = {  
            source = "hashicorp/aws"
            version = "~> 4.9.0"
        }
    }
    # backend "s3" {}   # fill the value via terraform init
}

# Provider Block
provider "aws" {
    profile = var.aws_credential_profile      # configured in ~/.aws/credentials
    region = var.aws_region
}






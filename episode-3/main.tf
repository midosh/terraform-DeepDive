# Terraform configuration
terraform {
  backend "remote" {
    organization = "mido"

    workspaces {
      name = "terraform-demo"
    }
  }
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "mido-devops.local"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

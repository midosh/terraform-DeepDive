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
  region  = var.aws_region
}

module "website" {
  source = "<PATH>"
  domain_name = var.domain_name
}

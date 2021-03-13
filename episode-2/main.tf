terraform {

  backend "remote" {
    organization = "mido"
    workspaces {
      name = "terraform-DeepDive"
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

resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

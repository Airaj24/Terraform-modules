terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


# Create EC2 Instance
resource "aws_instance" "web1" {
  ami               = "ami-068c0051b15cdb816" # Amazon Linux
  instance_type     = "t2.micro"
  # availability_zone = "ap-south-1a"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "bala"
  }
  lifecycle {
   #ignore_changes = [ami, availability_zone]
    ignore_changes = [tags]
  }
}

# Create EC2 Instance
resource "aws_instance" "web2" {
  ami               = "ami-068c0051b15cdb816" # Amazon Linux
  instance_type     = "t2.micro"
  # availability_zone = "ap-south-1a"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "raja"
  }
  lifecycle {
   #ignore_changes = [ami, availability_zone]
    ignore_changes = [tags]
  }
}
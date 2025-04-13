terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "remote" {
    hostname = "cbts.scalr.io"
    organization = "cbts"

    workspaces {
      name = "rajmodules"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = "default"
}

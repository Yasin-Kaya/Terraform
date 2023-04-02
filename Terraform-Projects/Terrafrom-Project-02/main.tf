# main.tf

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      
    }
  }
}

provider "aws" {
  region = var.region
  version = "~> 4.0"
}

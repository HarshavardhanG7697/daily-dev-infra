terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  default_tags {
    tags = {
      project     = local.project
      auto-delete = "never"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = {
      project     = local.project
      auto-delete = "never"
    }
  }
}

terraform {
  backend "s3" {
    bucket       = "hagowda-terraform-statefiles-07061997"
    key          = "daily-dev-infra/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

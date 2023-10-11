terraform {
  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "mariachiinajar"
  # }

  # cloud {
  #   organization = "mariachiinajar"
  #   workspaces {
  #     name = "terra-house"
  #   }
  # }

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "random" {
}

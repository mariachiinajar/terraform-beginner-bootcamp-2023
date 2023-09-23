terraform {
  # backend "remote" {
  #   hostname     = "app.terraform.io"
  #   organization = "mariachiinajar"
  # }

  # workspaces {
  #   name = "terra-house"
  # }

  cloud {
    organization = "mariachiinajar"
    workspaces {
      name = "terra-house"
    }
  }
}


provider "aws" {

}

provider "random" {
  #   keepers = {
  #     # Generate a new ID each time we switch to a new AMI ID.
  #     ami_id = var.ami_id
  #   }

  #   byte_length = 8
}

resource "random_string" "bucket_name" {
  length  = 16
  special = false
  lower   = true
  upper   = false
  #   override_special = "!@#$%&*()-_=+[]{}<>:?"
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "random_bucket_name_id" {
  value = random_string.bucket_name.id
}

output "random_bucket_name_result" {
  value = random_string.bucket_name.result
}
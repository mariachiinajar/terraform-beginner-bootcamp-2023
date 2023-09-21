terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "random" {
#   keepers = {
#     # Generate a new ID each time we switch to a new AMI ID.
#     ami_id = var.ami_id
#   }

#   byte_length = 8
}

resource "random_string" "bucket_name" {
  length           = 16
  special          = false
#   override_special = "!@#$%&*()-_=+[]{}<>:?"
}

output "random_bucket_name_id" {
    value = random_string.bucket_name.id
}

output "random_bucket_name_result" {
    value = random_string.bucket_name.result
}
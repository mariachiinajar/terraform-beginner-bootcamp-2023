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
   UserUuid = var.user_uuid
  }
}

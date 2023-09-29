terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name

  tags = {
    UserUuid = var.user_uuid
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  # routing_rule {
  #   condition {
  #     key_prefix_equals = "docs/"
  #   }
  #   redirect {
  #     replace_key_prefix_with = "documents/"
  #   }
  # }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key = "index.html"
  source = var.index_html_filepath
  etag = filemd5("${path.root}/public/index.html")
}


resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key = "error.html"
  source = "${path.root}/public/error.html"
  etag = filemd5("${path.root}/public/error.html")
}

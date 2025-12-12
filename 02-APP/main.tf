provider "aws" {
  region = "ap-south-1"
}


resource "aws_s3_bucket" "my_bucket_demo" {
  bucket = "satyadev-testing-bucket"

  versioning {
    enabled = true
  }

  tags = {
    Name = "Test-Bucket"
  }
}
resource "random_id" "rand" {
  byte_length = 4
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "terraform-test-bucket-${random_id.rand.hex}"

  tags = {
    Name = "Test-s3"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.test_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "logging" {
  bucket = aws_s3_bucket.test_bucket.id

  target_bucket = aws_s3_bucket.test_bucket.id
  target_prefix = "logs/"
}

resource "aws_s3_bucket_cors_configuration" "cors" {
  bucket = aws_s3_bucket.test_bucket.id

  cors_rule {
    allowed_methods = ["GET", "PUT"]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.test_bucket.id

  rule {
    id     = "cleanup-old-files"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}

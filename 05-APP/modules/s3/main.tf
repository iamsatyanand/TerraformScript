resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

# Bucket Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Logging
resource "aws_s3_bucket_logging" "logging" {
  bucket = aws_s3_bucket.this.id

  target_bucket = var.bucket_name
  target_prefix = "logs/"
}

# CORS
resource "aws_s3_bucket_cors_configuration" "cors" {
  bucket = aws_s3_bucket.this.id

  cors_rule {
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["*"]
    allowed_headers = ["*"]
  }
}

# Lifecycle Rules
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.this.id

  rule {
    id = "expire-logs"
    status = "Enabled"

    expiration {
      days = 30
    }
  }
}

# Bucket Policy (public read for static hosting OR object URLs)
resource "aws_s3_bucket_policy" "public_policy" {
  count = var.allow_public_read ? 1 : 0

  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.this.arn}/*"
      }
    ]
  })
}


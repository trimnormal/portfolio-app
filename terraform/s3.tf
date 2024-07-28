resource "aws_s3_bucket" "LogBucket" {
  bucket = "zc-portfolio-app-logs"
}

resource "aws_s3_bucket_public_access_block" "LogBucket" {
  bucket                  = aws_s3_bucket.LogBucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "LogBucket" {
  bucket = aws_s3_bucket.LogBucket.id
  rule {
    bucket_key_enabled = false
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_s3_bucket_ownership_controls" "LogBucket" {
  bucket = aws_s3_bucket.LogBucket.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
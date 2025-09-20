resource "aws_s3_bucket" "this" {
  bucket        = "${lower(var.bucket_name)}-${random_id.suffix.hex}"
  tags          = merge(var.default_tags, var.tags)
  force_destroy = var.force_destroy
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket_versioning" "this" {
  count  = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_logging" "this" {
  count         = var.enable_logging && var.logging_target_bucket != "" ? 1 : 0
  bucket        = aws_s3_bucket.this.id
  target_bucket = var.logging_target_bucket
  target_prefix = "${aws_s3_bucket.this.bucket}/logs/"
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
  depends_on = [aws_s3_bucket.this]
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count  = var.enable_encryption ? 1 : 0
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.sse_algorithm == "aws:kms" ? var.kms_key_id : null # Only set if encryption is enabled with KMS
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.enable_bucket_policy && var.policy_document != null ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = var.policy_document
}

resource "aws_s3_bucket_public_access_block" "this" {
  count  = var.enable_public_access_block ? 1 : 0
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

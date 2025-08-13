resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags   = var.default_tags

  # tfsec:ignore:aws-s3-enable-bucket-encryption
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = var.bucket_name # ✅ Uses variable directly for modularity
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended" # ✅ Dynamic toggle
  }
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = var.bucket_name # ✅ Uses variable directly
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = var.bucket_name
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = var.kms_key_id
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count  = var.enable_bucket_policy ? 1 : 0
  bucket = aws_s3_bucket.this.id
  policy = module.iam_policies.policy_actions
}

resource "aws_s3_bucket_public_access_block" "this" {
  count  = var.enable_public_access_block ? 1 : 0
  bucket = var.bucket_name

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "this" {
  bucket = var.bucket_name

  target_bucket = var.logging_target_bucket
  target_prefix = "${var.bucket_name}/logs/"
}

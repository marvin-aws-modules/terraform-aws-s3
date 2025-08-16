

module "basic-s3" {
  source = "../../.."
  sse_algorithm = var.sse_algorithm
  kms_key_id = var.kms_key_id
  bucket_name = var.bucket_name
  default_tags = var.default_tags
  enable_versioning = var.enable_versioning
  enable_public_access_block = var.enable_public_access_block
  logging_target_bucket = var.logging_target_bucket
  enable_bucket_policy = var.enable_bucket_policy
}

bucket_name = "marvin-app-storage"

enable_versioning = true

default_tags = {
  Environment = "dev"
  Project     = "s3-storage"
  Owner       = "marvin"
}

sse_algorithm = "aws:kms" # Use "AES256" for basic encryption, "aws:kms" for KMS-backed encryption

enable_bucket_policy = true

kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-5678-90ef-ghij-klmnopqrstuv"

provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for S3 bucket"
  type        = bool
  default     = false
}

variable "default_tags" {
  description = "Tags for tracking the bucket"
  type        = map(string)
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm for S3 bucket"
  type        = string
  default     = "AES256"
}

variable "enable_bucket_policy" {
  description = "Enable the bucket policy (true/false)"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "ARN of the KMS key used to encrypt the CloudWatch Log Group"
  type        = string
}

variable "logging_target_bucket" {
  description = "Name of the S3 bucket for logging"
  type        = string
  default     = "null"
}

module "basic-s3" {
  source                = "../.."
  bucket_name           = var.bucket_name
  enable_versioning     = var.enable_versioning
  default_tags          = var.default_tags
  sse_algorithm         = var.sse_algorithm
  enable_bucket_policy  = var.enable_bucket_policy
  kms_key_id            = var.kms_key_id
  logging_target_bucket = var.logging_target_bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = module.basic-s3.s3_bucket_arn
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.basic-s3.s3_bucket_name
}

output "s3_bucket_domain" {
  description = "Domain name of the bucket"
  value       = module.basic-s3.s3_bucket_domain
}

variable "bucket_name" {
  description = "Unique name for the S3 bucket. Must be globally unique across AWS."
  type        = string
}

variable "enable_versioning" {
  description = "Toggle to enable versioning for the S3 bucket. Helps preserve, retrieve, and restore every version of every object stored."
  type        = bool
  default     = false
}

variable "default_tags" {
  type        = map(string)
  default     = {}
  description = "Baseline tags applied across all modules"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to override or extend default_tags"
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm used to encrypt objects at rest in the S3 bucket. Defaults to AES256 for basic encryption."
  type        = string
  default     = "aws:kms"
}

variable "enable_bucket_policy" {
  description = "Flag to enable or disable the attachment of a bucket policy. Useful for controlling access permissions at the bucket level."
  type        = bool
  default     = false
}

variable "enable_public_access_block" {
  description = "Enables blocking of public access to the S3 bucket. Strongly recommended to prevent accidental exposure of sensitive data."
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "ARN of the customer-managed KMS key for S3 encryption"
  type        = string
  default     = null
}

variable "logging_target_bucket" {
  description = "S3 bucket where access logs will be delivered"
  type        = string
  default     = ""
}

variable "enable_encryption" {
  description = "Toggle to enable encryption for the S3 bucket. Strongly recommended for sensitive data."
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "Toggle to enable logging for the S3 bucket. Strongly recommended for audit and compliance purposes."
  type        = bool
  default     = false
}

variable "policy_document" {
  type        = string
  description = "Optional IAM policy JSON to attach to the bucket"
  default     = null
}

variable "force_destroy" {
  type        = bool
  default     = false
  description = "Delete all objects (and versions) when destroying the bucket"
}

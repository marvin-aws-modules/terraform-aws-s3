variable "sse_algorithm" {
  type        = string
  description = "Sse algorithm for testing"
}
variable "kms_key_id" {
  type        = string
  description = "Kms key id for testing"
}
variable "bucket_name" {
  type        = string
  description = "Bucket name for testing"
}
variable "default_tags" {
  type        = map(string)
  description = "Default tags for testing"
}
variable "enable_versioning" {
  type        = bool
  description = "Enable versioning for testing"
}
variable "enable_public_access_block" {
  type        = bool
  description = "Enable public access block for testing"
}
variable "logging_target_bucket" {
  type        = string
  description = "Logging target bucket for testing"
}
variable "enable_bucket_policy" {
  type        = bool
  description = "Enable bucket policy for testing"
}


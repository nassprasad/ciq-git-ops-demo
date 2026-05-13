variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable S3 versioning"
  type        = bool
  default     = false
}

variable "enable_encryption" {
  description = "Enable SSE encryption"
  type        = bool
  default     = true
}

variable "bucket_policy" {
  description = "Optional bucket policy JSON"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags for bucket"
  type        = map(string)
  default     = {}
}

variable "enable_public_access_block" {
  description = "Enable S3 public access block"
  type        = bool
  default     = true
}
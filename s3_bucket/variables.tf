variable "env" {
  description = "Name of the environment. Example: prod"
  type        = "string"
}

variable "s3_bucket_name" {
  description = "Name tag for S3 bucket with terraform state."
  type        = "string"
  default     = "this"
}

variable "s3_bucket" {
  description = "S3 bucket name"
  type        = "string"
}

variable "s3_versioning" {
  description = "Enable S3 versioning"
  type        = "string"
  default     = false
}

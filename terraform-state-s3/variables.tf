variable "env" {
  description = "Name of the environment. Example: prod"
  type        = "string"
}

variable "s3Bucket" {
  description = "S3 bucket for terraform state."
  type        = "string"
}

variable "s3BucketName" {
  description = "'Name' tag for S3 bucket with terraform state."
  type        = "string"
}

variable "dynamodbTable" {
  description = "DynamoDB table name for terraform lock."
  type        = "string"
}

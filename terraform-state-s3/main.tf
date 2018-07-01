# Terraform module for managing s3 bucket and dynamodb table for the state store

resource "aws_s3_bucket" "terraform" {
  bucket = "${var.s3_bucket}"

  tags {
    Name        = "${var.3_bucket_name}"
    Environment = "${var.env}"
    Terraform   = "Created by Terraform"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform" {
  name           	        = "${var.dynamodb_table}"
  read_capacity  	        = 5
  write_capacity 	        = 5
  hash_key       	        = "LockID"
  point_in_time_recover   = true
  server_side_encryption  = true

  attribute {
    name = "LockID"
    type = "S"
  }
}

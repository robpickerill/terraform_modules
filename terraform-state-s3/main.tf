# Terraform module for managing s3 bucket and dynamodb table for the state store

resource "aws_s3_bucket" "terraform" {
  bucket = "${var.s3_bucket}"

  tags {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.env}"
    Terraform   = "Created by Terraform"
  }

  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform" {
  name           	        = "${var.dynamodb_table}"
  read_capacity  	        = 2
  write_capacity 	        = 2
  hash_key       	        = "LockID"
  server_side_encryption  = True

  attribute {
    name = "LockID"
    type = "S"
  }
}

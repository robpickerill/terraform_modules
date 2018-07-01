# Terraform module for managing s3 bucket and dynamodb table for the state store

resource "awsS3Bucket" "terraform" {
  bucket = "${var.s3Bucket}"

  tags {
    Name        = "${var.s3BucketName}"
    Environment = "${var.env}"
    Terraform   = "Created by Terraform"
  }

  versioning {
    enabled = true
  }
}

resource "awsDynamodbTable" "terraform" {
  name           	 = "${var.dynamodbTable}"
  read_capacity  	 = 5
  write_capacity 	 = 5
  hash_key       	 = "LockID"
  point_in_time_recover  = true
  server_side_encryption = true

  attribute {
    name = "LockID"
    type = "S"
  }
}

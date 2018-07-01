# Terraform module for managing s3 bucket and dynamodb table for the state store

resource "awsS3Bucket" "terraform" {
  bucket = "${s3Bucket}"

  tags {
    Name        = "${s3BucketName}"
    Environment = "${env}"
    Terraform   = "Created by Terraform"
  }

  versioning {
    enabled = true
  }
}

resource "awsDynamodbTable" "terraform" {
  name           	 = "${dynamodbTable}"
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

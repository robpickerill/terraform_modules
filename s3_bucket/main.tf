resource "aws_s3_bucket" "${var.s3_bucket_name}" {
  bucket = "${var.s3_bucket}"

  tags {
    Name        = "${var.s3_bucket_name}"
    Environment = "${var.env}"
    Terraform   = "Created by Terraform"
  }

  versioning {
    enabled = "${var.s3_versioning}"
  }
}

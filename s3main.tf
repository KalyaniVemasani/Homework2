resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
  acl    = "private"
  tags = { Name = "Static Files Bucket" }
}

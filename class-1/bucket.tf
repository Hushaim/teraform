resource "aws_s3_bucket" "example" {
  bucket_prefix = "kaizen-"
}

#terraform import aws_s3_bucket.bucket bucket-name
resource "aws_s3_bucket" "test" {
  bucket = "kaizen-76g-o-o-o-o-f"
}
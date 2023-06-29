resource "aws_s3_bucket" "example" {
  bucket_prefix = "kaizen-"   #bucket_prefix will make unique name for bucket
}

#terraform import aws_s3_bucket.bucket bucket-name
resource "aws_s3_bucket" "test" {
  bucket = "kaizen-76g-o-o-o-o-f"
}

#output:
#terraform import aws_s3_bucket.test kaizen-76g-o-o-o-o-f 
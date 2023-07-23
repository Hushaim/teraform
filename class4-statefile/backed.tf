terraform {
  backend "s3" {
    bucket = "fari-kaix"
    key    = "kaizen/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}
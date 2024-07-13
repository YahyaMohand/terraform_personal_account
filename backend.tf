terraform {
  backend "s3" {
    bucket         = "test-terraform-state-bucket-123123"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "test-terraform-lock-table"
  }
}
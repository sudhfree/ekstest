terraform {
  backend "s3" {
    bucket = "tfm-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tfm-state-lock-table"
  }
}

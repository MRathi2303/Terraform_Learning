terraform {
  backend "s3" {
    bucket = "terraform-statefiles-mr"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform_lock"
  }
}
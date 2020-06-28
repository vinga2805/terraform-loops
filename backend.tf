terraform {
  backend "s3" {
    bucket = "vinga-binga-dinga-state"
    key    = "mydemo/terraform.state"
    region = "ap-south-1"
    dynamodb_table = "state-table"
  }
}

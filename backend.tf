terraform {
  backend "s3" {
    bucket = "terra-jenkns-trigger"
    key = "main"
    region = "us-east-1"
    //dynamodb_table = "my-dynamo-db-table"
  }
}

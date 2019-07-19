provider "aws" {
  region = var.region
  shared_credentials_file = "/Users/tf_user/.aws/credentials"
  profile                 = "aws-prod"
}
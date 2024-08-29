terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.63.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "myroboshop-remote-state"
    key    = "workspace"
    region = "us-east-1"
    dynamodb_table = "myroboshop-remote-state-locking"
  }
}
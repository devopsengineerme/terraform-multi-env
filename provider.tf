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
    # bucket = "mybucket"
    # key    = "path/to/my/key"
    # region = "us-east-1"
  }
}
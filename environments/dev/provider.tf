provider "aws" {
  region = var.aws_region
  # region  = "ap-south-1"
  profile = "aws-infra-role"
}


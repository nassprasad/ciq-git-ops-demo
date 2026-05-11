provider "aws" {
  region = var.aws_region
  # region  = "ap-south-1"
  profile = "aws-infra-role"
  # $env:AWS_PROFILE="terraform-role"  --> must run from CLI
}
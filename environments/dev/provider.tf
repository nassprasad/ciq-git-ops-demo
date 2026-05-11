provider "aws" {
  region = "ap-south-1"
  # $env:AWS_PROFILE="terraform-role"  --> must run from CLI
  profile = "terraform-role"
   
}
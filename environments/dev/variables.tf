variable "aws_region" {
  type = string
}

variable "vpc_cidr" { type = string }
variable "vpc_name" { type = string }

variable "azs" {
  type = list(string)
}


variable "tags" {
  type = map(string)

  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Project     = "git-ops-demo"
  }
}


/*
variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "instance_name" { type = string }
*/

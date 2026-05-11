variable "vpc_cidr" { type = string }
variable "vpc_name" { type = string }

variable "azs" {
  type = list(string)
}

variable "ami_id" { type = string }
variable "instance_type" { type = string }
variable "instance_name" { type = string }
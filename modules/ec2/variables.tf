/*
# Input variables for the EC2 module

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


variable "subnet_id" {
  description = "Subnet ID from VPC module"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}


variable "key_name" {
  description = "Key pair name from root"
  type        = string
}

variable "vpc_id" {
  description = "Value of the VPC ID"
  type        = string
}

variable "my_ip" {
  description = "#Dynamic IP"
  type        = string
}
*/
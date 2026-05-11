variable "vpc_cidr" {
  type = string  
}

variable "vpc_name" {
  type = string
}

variable "azs" {
  type = list(string)
}
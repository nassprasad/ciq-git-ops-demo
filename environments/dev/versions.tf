terraform {
  required_version = ">= 1.14.0"   # Matches your CLI (safe minimum)

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"           # Stable & production-ready
    }
  }
}

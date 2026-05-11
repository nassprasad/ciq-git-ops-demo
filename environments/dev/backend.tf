terraform {

  backend "s3" {

    bucket = "demo-infra-backend-mumbai"

    key    = "dev/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    use_lockfile = true

  }

}

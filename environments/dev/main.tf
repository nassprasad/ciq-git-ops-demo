# Get my public IP dynamically
data "http" "my_ip" {
  url = "https://api.ipify.org"
}

locals {
  my_ip = chomp(data.http.my_ip.response_body) # # Remove newline
}

# 🔐 Create Key Pair (ROOT responsibility)
resource "aws_key_pair" "main" {
  key_name   = "dev-key"
  public_key = file("~/.ssh/id_rsa.pub") # # Your local public key
}

# 🌐 VPC Module
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  azs      = var.azs
}

# test trigger

/*
# 🖥️ EC2 Module
module "ec2" {
  source = "../../modules/ec2"
  
  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  subnet_id = module.vpc.public_subnets[0]  # # Use first public subnet
  vpc_id    = module.vpc.vpc_id

  key_name = aws_key_pair.main.key_name     # # Pass key to EC2

  my_ip = local.my_ip                      # # Dynamic IP
}



# 🆕 NEW EC2 → Web Server
module "ec2_web" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = "t3.small"     # # Different instance type
  instance_name = "web-vm"        # # New name

  subnet_id = module.vpc.app_subnets[0]   # # App subnet
  vpc_id    = module.vpc.vpc_id

  key_name = aws_key_pair.main.key_name
  my_ip    = local.my_ip
}
*/
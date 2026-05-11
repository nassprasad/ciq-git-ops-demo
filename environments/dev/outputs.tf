# Output EC2 Public IP
output "public_ip" {
  value = module.ec2.public_ip   # # Get from EC2 module
}

/*
# Output Instance ID
output "instance_id" {
  value = module.ec2.instance_id
}

# New web instance
output "web_public_ip" {
  value = module.ec2_web.public_ip
}
*/
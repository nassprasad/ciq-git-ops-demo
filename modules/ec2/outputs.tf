# Output values from the module

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = "aws_instance.this.id"
}


# Define an output variable to expose the public IP address of the EC2 instance
output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = "aws_instance.this.public_ip"
}
# Security Group
resource "aws_security_group" "this" {
  name   = "${var.instance_name}-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["${var.my_ip}/32"]   # # Dynamic IP restriction
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]         # # Allow all outbound
  }
}

# EC2 Instance
resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [aws_security_group.this.id]  # # Attach SG

  key_name = var.key_name   # # Attach key here

  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}
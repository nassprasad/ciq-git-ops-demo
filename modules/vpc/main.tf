# Create VPC + DNS
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# PUBLIC SUBNETS
resource "aws_subnet" "public" {
  count = 3

  vpc_id = aws_vpc.main.id
  cidr_block = element([
    "10.0.0.0/22",
    "10.0.4.0/22",
    "10.0.8.0/22"
  ], count.index)

  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "Dev-Public-Subnet${count.index + 1}"
  }
}

# APP SUBNETS
resource "aws_subnet" "app" {
  count = 3

  vpc_id = aws_vpc.main.id
  cidr_block = element([
    "10.0.16.0/21",
    "10.0.24.0/21",
    "10.0.32.0/21"
  ], count.index)

  availability_zone = var.azs[count.index]

  tags = {
    Name = "Dev-App-Subnet${count.index + 1}"
  }
}

# DB SUBNETS
resource "aws_subnet" "db" {
  count = 3

  vpc_id = aws_vpc.main.id
  cidr_block = element([
    "10.0.40.0/21",
    "10.0.48.0/21",
    "10.0.56.0/21"
  ], count.index)

  availability_zone = var.azs[count.index]

  tags = {
    Name = "Dev-DB-Subnet${count.index + 1}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Dev-Internet-Gateway"
  }
}


# Route Tables

# PUBLIC RT
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Dev-Public-RouteTable"
  }
}

# PRIVATE RT
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Dev-Private-RouteTable"
  }
}

# Route Table Associations

# Public subnets
resource "aws_route_table_association" "public_assoc" {
  count = 3

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

# App subnets
resource "aws_route_table_association" "app_assoc" {
  count = 3

  subnet_id      = aws_subnet.app[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

# DB subnets
resource "aws_route_table_association" "db_assoc" {
  count = 3

  subnet_id      = aws_subnet.db[count.index].id
  route_table_id = aws_route_table.private_rt.id
}

# Public Route (Internet Access)
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}


/* # Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.vpc_name}-nat-eip"
  }
}


# Attach NAT to first public subnet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id   # First public subnet

  tags = {
    Name = "${var.vpc_name}-nat-gateway"
  }

  depends_on = [aws_internet_gateway.igw]
}


# Add route for internet via NAT
resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}
*/
# VPC creation
resource "aws_vpc" "loadbalance" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc for load balancer"
  }
}

#public subnet 1a
resource "aws_subnet" "pub" {
  vpc_id                  = aws_vpc.loadbalance.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "mayank-public-sub-a"
  }
}

#public subnet 1b
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.loadbalance.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "mayank-public-sub-b"
  }
}

# internet_gateway

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.loadbalance.id

  tags = {
    Name = "internet gateway"
  }
}


## route table for public subnet

resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.loadbalance.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }


  tags = {
    Name = "route for public"
  }
}


resource "aws_route_table_association" "a" {

  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.pub.id
}

resource "aws_route_table_association" "b" {

  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.pub.id
}
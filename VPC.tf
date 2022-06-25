resource "aws_vpc" "vpc" {
    cidr_block = "192.168.0.0/16"
    
    tags = {
      "Name" = "First-VPC"
    }
}

resource "aws_subnet" "first_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.0.0/24"
  
  tags = {
    Name = "first_subnet"
  }
}

resource "aws_subnet" "second_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  
  tags = {
    Name = "second_subnet"
  }
}

resource "aws_subnet" "third_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.2.0/24"
  
  tags = {
    Name = "third_subnet"
  }
}

resource "aws_subnet" "fourth_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "192.168.3.0/24"
  
  tags = {
    Name = "fourth_subnet"
  }
}
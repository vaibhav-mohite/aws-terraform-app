resource "aws_vpc" "vsm-vpc" {
  cidr_block       = "11.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "vsm-vpc"
  }
}

resource "aws_subnet" "vsm-subnet-1a" {
  vpc_id     = aws_vpc.vsm-vpc.id
  availability_zone = "ap-south-1a"
  cidr_block = "11.0.1.0/24"

  tags = {
    Name = "vsm-subnet-1a"
  }
}

resource "aws_subnet" "vsm-subnet-1b" {
  vpc_id     = aws_vpc.vsm-vpc.id
  availability_zone = "ap-south-1b"
  cidr_block = "11.0.2.0/24"

  tags = {
    Name = "vsm-subnet-1b"
  }
}

resource "aws_internet_gateway" "vsm-igw" {
  vpc_id = aws_vpc.vsm-vpc.id

  tags = {
    Name = "vsm-igw"
  }
}

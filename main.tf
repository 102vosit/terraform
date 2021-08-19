## AWS provider
provider "aws" {
  region = "us-east-1"

  access_key = "AKIA6QUFFR7ZWDKIGMXF"
  secret_key = "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"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "My-VPC"
  }
}

#Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet"
  }
}

#Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet"
  }
}

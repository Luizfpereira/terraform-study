terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"
}

resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.example_subnet.id
}

resource "aws_internet_gateway" "example_gateway" {
  vpc_id = aws_vpc.example_vpc.id
}

resource "aws_eip" "example_eip" {
  instance   = aws_instance.example_instance.id
  depends_on = [aws_internet_gateway.example_gateway]
}

resource "aws_ssm_parameter" "parameter" {
  name  = "vm_ip"
  type  = "String"
  value = aws_eip.example_eip.public_ip
}

output "private_dns" {
  value = aws_instance.example_instance.private_dns
}

output "public_ip" {
  value = aws_eip.example_eip.public_ip
}

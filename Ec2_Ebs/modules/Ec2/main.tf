provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Demo01" {
  ami = var.ami
  instance_type = "t3.micro"
  key_name = var.key
}


provider "aws" {   // mention the provider name(like were you want to implement the infra)
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-Øc55b159cbfafelf0"
  instance_type = "t2.micro"
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_ebs_volume" "vol01" {
  availability_zone = var.availability_zone
  type = var.volume_type
  size = var.vol_size
}
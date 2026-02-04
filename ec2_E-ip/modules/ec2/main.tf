resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
}

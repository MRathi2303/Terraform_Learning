resource "aws_db_subnet_group" "this" {
  name = "three-tier-db-subnet-grp"
  subnet_ids = var.private_db_subnet_ids

  tags = {
    Name = "3-tier-db-subnet-group"
  }

}

resource "aws_db_instance" "this" {
  identifier = "three-tier-db"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t3.micro"
  allocated_storage = 10
  db_subnet_group_name = aws_db_subnet_group.this.name
  multi_az = true
  publicly_accessible = false

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  tags = {
    Name = "3-tier-db"
  }

}


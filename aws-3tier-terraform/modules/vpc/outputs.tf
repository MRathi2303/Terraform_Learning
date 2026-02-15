output "vpc_id" {
  value = aws_vpc.3-tier-vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.3-tier-igw.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  value = aws_subnet.private_app[*].id
}

output "private_db_subnet_ids" {
  value = aws_subnet.private_db[*].id
}
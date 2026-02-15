output "vpc_id" {
  value = aws_vpc.three_tier_vpc.id
}

output "igw_id" {
  value = aws_internet_gateway.three_tier_igw.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_app_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "private_db_subnet_ids" {
  value = aws_subnet.private_db[*].id
}

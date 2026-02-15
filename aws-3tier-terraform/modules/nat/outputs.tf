output "nat_gateway_ids" {
  value = aws_nat_gateway.three_tier_nat[*].id
}
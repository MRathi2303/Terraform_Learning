
# Public Route Table

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "3-tier-public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_assoc" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}


# Private Route Tables (one per AZ)

resource "aws_route_table" "private" {
  count  = length(var.private_app_subnet_ids)
  vpc_id = var.vpc_id

  tags = {
    Name = "3-tier-private-rt-${count.index + 1}"
  }
}

resource "aws_route" "private_nat_access" {
  count                  = length(var.private_app_subnet_ids)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_ids[count.index]
}

resource "aws_route_table_association" "private_assoc" {
  count          = length(var.private_app_subnet_ids)
  subnet_id      = var.private_app_subnet_ids[count.index]
  route_table_id = aws_route_table.private[count.index].id
}

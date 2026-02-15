## elastic ip for each public subnet craeted

resource "aws_eip" "nat_eip" {
    count = length(var.public_subnet_ids)
    domain = "vpc"

    tags = {
      Name : "aws-3tier-nat-eip-${count.index+1}"
    }
}

## NAT Gateways (one per public subnet)

resource "aws_nat_gateway" "three_tier_nat" {
  count = length(var.public_subnet_ids)
  subnet_id = var.public_subnet_ids[count.index]
  allocation_id = aws_eip.nat_eip[count.index].id

  tags = {
    Name : "aws-3tier-nat-${count.index+1}"
  }

  depends_on = [ aws_eip.nat_eip ]
}
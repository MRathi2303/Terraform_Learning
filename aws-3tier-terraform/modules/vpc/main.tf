resource "aws_vpc" "three_tier_vpc" {
  cidr_block = var.cidr

  tags = {
    Name = "3-tier-vpc"
  }
}

resource "aws_internet_gateway" "three_tier_igw" {
  vpc_id = aws_vpc.three_tier_vpc.id

  tags = {
    Name = "3-tier-igw"
  }
}


## public subnets (2 AZs)
resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnet_cidrs)
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.public_subnet_cidrs[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true

    tags = {
        Name : "3-tier-public-subnet-${count.index+1}"
        Tier : "Public"
    }

}

## private subnet (2 AZs)

resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_cidrs)
    vpc_id = aws_vpc.three_tier_vpc.id
    cidr_block = var.private_subnet_cidrs[count.index]
    availability_zone = var.azs[count.index]

    tags = {
        Name : "3-tier-private-subnet-${count.index+1}"
        Tier : "Private"
    }

}

## Private DB Subnets (2 AZs)

resource "aws_subnet" "private_db" {
  count             = length(var.private_db_subnet_cidrs)
  vpc_id            = aws_vpc.three_tier_vpc.id
  cidr_block        = var.private_db_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = {
    Name = "3-tier-private-db-subnet-${count.index + 1}"
    Tier = "private-db"
  }
}



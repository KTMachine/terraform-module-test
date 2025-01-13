# Create VPCs
resource "aws_vpc" "vpcs" {
  for_each = var.network.vpcs

  cidr_block = each.value.cidr
  tags = {
    Name = "${each.key}-vpc"
  }
}

# Create Subnets
resource "aws_subnet" "subnets" {
  for_each = var.network.subnets

  vpc_id            = aws_vpc.vpcs[each.value.vpc].id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.key
  }
}
resource "aws_nat_gateway" "primary" {
  allocation_id = aws_eip.nat_primary.id
  subnet_id     = aws_subnet.public_primary.id

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "primary"
  }
}

resource "aws_nat_gateway" "secondary" {
  allocation_id = aws_eip.nat_secondary.id
  subnet_id     = aws_subnet.public_secondary.id

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "secondary"
  }
}

resource "aws_eip" "nat_primary" {
  vpc = true

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private_primary"
  }
}

resource "aws_eip" "nat_secondary" {
  vpc = true

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private_secondary"
  }
}

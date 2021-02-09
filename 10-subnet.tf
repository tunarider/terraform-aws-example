resource "aws_subnet" "public_primary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_primary_cidr
  availability_zone       = var.primary_az
  map_public_ip_on_launch = false

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "public_primary"
  }
}

resource "aws_subnet" "public_secondary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_secondary_cidr
  availability_zone       = var.secondary_az
  map_public_ip_on_launch = false

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "public_secondary"
  }
}

resource "aws_subnet" "private_primary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_primary_cidr
  availability_zone       = var.primary_az
  map_public_ip_on_launch = false

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private_primary"
  }
}

resource "aws_subnet" "private_secondary" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_secondary_cidr
  availability_zone       = var.secondary_az
  map_public_ip_on_launch = false

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private_secondary"
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = var.project_name
  }
}

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

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = var.project_name
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

resource "aws_route_table" "public_primary" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "public_primary"
  }
}

resource "aws_route_table" "public_secondary" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "public_secondary"
  }
}

resource "aws_route_table" "private_primary" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.primary.id
  }

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private_primary"
  }
}

resource "aws_route_table" "private_secondary" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.secondary.id
  }

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private_secondary"
  }
}

resource "aws_route_table_association" "public_primary" {
  subnet_id      = aws_subnet.public_primary.id
  route_table_id = aws_route_table.public_primary.id
}


resource "aws_route_table_association" "public_secondary" {
  subnet_id      = aws_subnet.public_secondary.id
  route_table_id = aws_route_table.public_secondary.id
}


resource "aws_route_table_association" "private_primary" {
  subnet_id      = aws_subnet.private_primary.id
  route_table_id = aws_route_table.private_primary.id
}

resource "aws_route_table_association" "private_secondary" {
  subnet_id      = aws_subnet.private_secondary.id
  route_table_id = aws_route_table.private_secondary.id
}

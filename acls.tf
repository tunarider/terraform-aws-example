resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32768
    to_port    = 60999
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 501
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.public_primary.id,
    aws_subnet.public_secondary.id,
  ]

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "public"
  }
}

resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = var.vpc_cidr
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32768
    to_port    = 60999
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  subnet_ids = [
    aws_subnet.private_primary.id,
    aws_subnet.private_secondary.id,
  ]

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "private"
  }
}

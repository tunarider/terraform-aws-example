resource "aws_instance" "db" {
  ami               = "ami-09282971cf2faa4c9"
  availability_zone = var.primary_az
  instance_type     = "t2.nano"
  key_name          = aws_key_pair.default.key_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id,
  ]

  subnet_id                   = aws_subnet.private_primary.id
  associate_public_ip_address = false

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name = "db"
  }
}

resource "aws_instance" "bastion" {
  ami               = "ami-09282971cf2faa4c9"
  availability_zone = var.primary_az
  instance_type     = "t2.nano"
  key_name          = aws_key_pair.bastion.key_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id,
    aws_security_group.public_ssh.id,
  ]

  subnet_id                   = aws_subnet.public_primary.id
  associate_public_ip_address = true

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "bastion"
  }
}

resource "aws_eip" "bastion" {
  instance = aws_instance.bastion.id
  vpc      = true

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "bastion"
  }
}

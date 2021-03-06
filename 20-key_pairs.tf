resource "aws_key_pair" "default" {
  key_name   = "${var.project_name}-default"
  public_key = var.public_key_default

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "${var.project_name}-default"
  }
}

resource "aws_key_pair" "bastion" {
  key_name   = "${var.project_name}-bastion"
  public_key = var.public_key_bastion
  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "${var.project_name}-bastion"
  }
}

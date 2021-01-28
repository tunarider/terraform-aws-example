resource "aws_key_pair" "default" {
  key_name   = "default"
  public_key = var.public_key

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "default"
  }
}

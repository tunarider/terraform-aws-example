resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = var.project_name
  }
}

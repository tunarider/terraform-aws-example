resource "aws_route53_zone" "example_internal" {
  name = "example.internal"

  vpc {
    vpc_id = aws_vpc.main.id
  }

  tags = {
    Provisioner = "terraform"
    Project     = var.project_name
    Name        = "example_internal"
  }
}

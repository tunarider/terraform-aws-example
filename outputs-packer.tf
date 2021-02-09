output "packer-profile" {
  value = var.profile
}

output "packer-project" {
  value = var.project_name
}

output "packer-region" {
  value = var.region
}

output "packer-security_group_ids" {
  value = [aws_default_security_group.default.id]
}

output "packer-ssh_bastion_host" {
  value = aws_eip.bastion.public_ip
}

output "packer-subnet_id" {
  value = aws_subnet.private_primary.id
}

output "packer-vpc_id" {
  value = aws_vpc.main.id
}

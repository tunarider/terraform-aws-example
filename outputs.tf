output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_primary_subnet_id" {
  value = aws_subnet.public_primary.id
}

output "public_secondary_subnet_id" {
  value = aws_subnet.public_secondary.id
}

output "private_primary_subnet_id" {
  value = aws_subnet.private_primary.id
}

output "private_secondary_subnet_id" {
  value = aws_subnet.private_secondary.id
}

output "public_ssh_security_group_id" {
  value = aws_security_group.public_ssh.id
}

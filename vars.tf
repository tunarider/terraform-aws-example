variable "region" {
  type = string
}

variable "profile" {
  type = string
}

variable "primary_az" {
  type = string
}

variable "secondary_az" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_primary_cidr" {
  type = string
}

variable "public_secondary_cidr" {
  type = string
}

variable "private_primary_cidr" {
  type = string
}

variable "private_secondary_cidr" {
  type = string
}

variable "public_key_default" {
  type = string
}

variable "public_key_bastion" {
  type = string
}

#
variable "aws_profile" {
  description = "The aws profile to be used"
}

variable "aws_region" {
  description = "Teh region where to create the VPC"
}

#
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}
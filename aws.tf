# The profile needs to be set using the access keys provided
provider "aws" {
  profile     = "${var.aws_profile}"
  region      = "${var.aws_region}"
}
################
# Common stuff #
################

# Sandpit VPC
module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "1.30.0"

  name                    = "eks-test-vpc"
  cidr                    = "${var.vpc_cidr}"

  azs                     = ["${var.aws_region}d", "${var.aws_region}e"]
  public_subnets          = ["192.168.0.0/20", "192.168.16.0/20"]
  private_subnets         = ["192.168.32.0/19", "192.168.64.0/19"]
  

  enable_nat_gateway      = true
  enable_vpn_gateway      = true
  map_public_ip_on_launch = false
  create_database_subnet_group = false

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# data "aws_iam_policy_document" "eks_assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["eks.amazonaws.com"]
#     }
#   }
# }

# resource "aws_iam_role" "eks_service_role" {
#   name               = "eks_service_role"
#   path               = "/eks/"
#   assume_role_policy = "${data.aws_iam_policy_document.eks_assume_role_policy.json}"
# }

# resource "aws_iam_role_policy_attachment" "eks_cluster" {
#   role       = "${aws_iam_role.eks_service_role.name}"
#    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }

# resource "aws_iam_role_policy_attachment" "eks_service" {
#   role       = "${aws_iam_role.eks_service_role.name}"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
# }
module "robokart" {
  source = "git::https://github.com/Royal-Reddy-Yaparla/terraform-vpc-aws-module?ref=main"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags

  vpc_tags = var.vpc_tags

  cidr_public = var.cidr_public
  cidr_private = var.cidr_private
  cidr_database = var.cidr_database

  is_peering_required = var.is_peering_required
  acceptor_vpc_id = var.accepters_vpc_id
}
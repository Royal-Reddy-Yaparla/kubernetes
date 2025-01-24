output "vpc_id" {
  value = module.robokart.vpc_id
}

# output "private_subnet_ids" {
#   value = module.robokart.private_subnet_ids
# }

# output "public_subnet_ids" {
#   value = module.robokart.public_subnet_ids
# }

# output "database_subnet_ids" {
#   value = module.robokart.database_subnet_ids
# }

output "azs" {
  value = module.robokart.azs
}
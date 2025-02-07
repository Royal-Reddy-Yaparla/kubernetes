variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "common_tags" {
  default = {
    project_name = "robokart-eks"
    environment = "dev"
    terraform = true
  }
}

variable "vpc_tags" {
  default = {}
}
variable "igt_tags" {
  default = {}
}
variable "project_name" {
  default = "robokart-eks"
}
variable "environment" {
  default = "dev"
}

variable "cidr_public" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "cidr_private" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "cidr_database" {
  default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "is_peering_required" {
  default = true
}

variable "accepters_vpc_id" {
  default = ""
}